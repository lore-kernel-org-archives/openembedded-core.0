Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tzl4z-0003nW-29
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 10:32:43 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jan 2013 01:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,550,1355126400"; d="scan'208";a="195769996"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.19])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 01:16:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 01:15:58 -0800
Message-Id: <585121936d16f0916d0edf9e6fb288d096c4aa09.1359364462.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
In-Reply-To: <cover.1359364462.git.sgw@linux.intel.com>
References: <cover.1359364462.git.sgw@linux.intel.com>
Subject: [PATCH 11/13] resolvconf: Update to 1.69
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
X-List-Received-Date: Mon, 28 Jan 2013 09:33:05 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../resolvconf/{resolvconf_1.68.bb => resolvconf_1.69.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.68.bb => resolvconf_1.69.bb} (88%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.68.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.69.bb
similarity index 88%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.68.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.69.bb
index 971b0f8..a1d6688 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.68.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.69.bb
@@ -14,8 +14,8 @@ PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 
-SRC_URI[md5sum] = "61cca51474ccec74f3de15f44b182666"
-SRC_URI[sha256sum] = "f88fec7e167afce6f6fb4c5304dd625b71521b278b826a857796451753c9a964"
+SRC_URI[md5sum] = "a5cacf9724f1b79a685cc5dfe2c643c9"
+SRC_URI[sha256sum] = "e386a6e5ac81d292edbc0d8fbd0cfbbdbb4a76ac06c5f08079a1aa8cc59f3fcb"
 
 inherit allarch
 
-- 
1.8.0.2



