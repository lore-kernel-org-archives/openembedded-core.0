Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 00A01718FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 20:10:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Nov 2014 12:07:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,404,1413270000"; d="scan'208";a="609301527"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 17 Nov 2014 12:09:38 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Nov 2014 22:09:30 +0200
Message-Id: <ff06cf04a70427e8720736f71ad0ed4328da9715.1416254938.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1416254938.git.cristian.iorga@intel.com>
References: <cover.1416254938.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1416254938.git.cristian.iorga@intel.com>
References: <cover.1416254938.git.cristian.iorga@intel.com>
Subject: [PATCH 2/3] libpcap: upgrade to 1.6.2
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
X-List-Received-Date: Mon, 17 Nov 2014 20:10:03 -0000

- Bug fixes.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../libpcap/{libpcap_1.6.1.bb => libpcap_1.6.2.bb}                    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.6.1.bb => libpcap_1.6.2.bb} (77%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.6.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb
similarity index 77%
rename from meta/recipes-connectivity/libpcap/libpcap_1.6.1.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb
index f570ebb..a2d5ef4 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.6.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.6.2.bb
@@ -1,8 +1,8 @@
 require libpcap.inc
 
 SRC_URI += "file://aclocal.patch"
-SRC_URI[md5sum] = "5eb05edf6b6c6e63d536d1c9fbfb2f7c"
-SRC_URI[sha256sum] = "116cbb3ac9e96d5dd7b39638a2f894a67fa3dcf06d794e6dae2b9a942ad13476"
+SRC_URI[md5sum] = "5f14191c1a684a75532c739c2c4059fa"
+SRC_URI[sha256sum] = "5db3e2998f1eeba2c76da55da5d474248fe19c44f49e15cac8a796a2c7e19690"
 
 #
 # make install doesn't cover the shared lib
-- 
2.1.0


