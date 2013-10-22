Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 95E276D011
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:07:54 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Oct 2013 07:07:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="311109688"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Oct 2013 07:07:55 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2013 17:10:03 +0300
Message-Id: <488941bb9793d52f804353b60d9976d0786e58f9.1382450957.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1382450957.git.cristian.iorga@intel.com>
References: <cover.1382450957.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1382450957.git.cristian.iorga@intel.com>
References: <cover.1382450957.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] connman: upgrade to 1.19
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Oct 2013 14:07:54 -0000

Improvements:
- On startup keep interfaces already configured
with static IPv4 addresses if there is a
service configuration file containing
the very same static values. If not,
take the interface down and flush
the old configuration as before (Jukka Rissanen).
- Handle FallbackNameservers properly;
use them when no other nameservers have been
configured for a service (Patrik Flykt).

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../connman/{connman_1.18.bb => connman_1.19.bb}                    | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.18.bb => connman_1.19.bb} (65%)

diff --git a/meta/recipes-connectivity/connman/connman_1.18.bb b/meta/recipes-connectivity/connman/connman_1.19.bb
similarity index 65%
rename from meta/recipes-connectivity/connman/connman_1.18.bb
rename to meta/recipes-connectivity/connman/connman_1.19.bb
index 44a4a07..c63dfe4 100644
--- a/meta/recipes-connectivity/connman/connman_1.18.bb
+++ b/meta/recipes-connectivity/connman/connman_1.19.bb
@@ -6,9 +6,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://connman \
             "
 
-SRC_URI[md5sum] = "7578ec8f0422d34f5a4ba51b605fe576"
-SRC_URI[sha256sum] = "56c2ca7842be2100b6b59367845d5beec125f231af6ea505604992e0c5a69992"
-
-PR = "${INC_PR}.0"
+SRC_URI[md5sum] = "47cce1d17a693dc307e6796c81991bd0"
+SRC_URI[sha256sum] = "7e4e624cadf42feed18e783351b10f81ef23d7e298bddc7ffe26fe5e69f25b8b"
 
 RRECOMMENDS_${PN} = "connman-conf"
-- 
1.8.1.2


