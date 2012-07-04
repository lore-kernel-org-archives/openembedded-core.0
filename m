Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1SmO0z-0008OU-Ua
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 13:45:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2012 04:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166822249"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by orsmga002.jf.intel.com with ESMTP; 04 Jul 2012 04:33:59 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2012 14:34:03 +0300
Message-Id: <1341401643-4395-6-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341401643-4395-1-git-send-email-cristian.iorga@intel.com>
References: <1341401643-4395-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 5/5] ofono: update to ver. 1.8
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
X-List-Received-Date: Wed, 04 Jul 2012 11:45:02 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../ofono/{ofono_1.6.bb => ofono_1.8.bb}           |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.6.bb => ofono_1.8.bb} (64%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.6.bb b/meta/recipes-connectivity/ofono/ofono_1.8.bb
similarity index 64%
rename from meta/recipes-connectivity/ofono/ofono_1.6.bb
rename to meta/recipes-connectivity/ofono/ofono_1.8.bb
index 386ffee..e2d97f0 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.6.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.8.bb
@@ -4,8 +4,9 @@ SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.bz2 \
   file://ofono \
 "
-SRC_URI[md5sum] = "d863b2b650a525cf75056085398bc8ef"
-SRC_URI[sha256sum] = "63e38ea1cf35b00ecbab7611c6caa2adcd33eb10495f7a9f72013d4ab7a14c98"
+
+SRC_URI[md5sum] = "e457ea13db22bb2de77767c867dcc4d3"
+SRC_URI[sha256sum] = "164b413068e810281a5e6c9bb90d5002d80f1c30bef2f3ffdbe70f963079524d"
 
 
 EXTRA_OECONF += "\
-- 
1.7.9.5



