Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tact4-0005Xs-KG
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 02:44:30 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2012 17:30:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,282,1352102400"; d="scan'208";a="244596728"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2012 17:30:24 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 17:30:14 -0800
Message-Id: <c7eb846584f91377f9b011b529ad38a19b8debf1.1353374801.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
Subject: [PATCH 06/13] resolvconf: Update to 1.68
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
X-List-Received-Date: Tue, 20 Nov 2012 01:44:30 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{resolvconf_1.67.bb => resolvconf_1.68.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.67.bb => resolvconf_1.68.bb} (88%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.67.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.68.bb
similarity index 88%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.67.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.68.bb
index 7eb49d1..971b0f8d 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.67.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.68.bb
@@ -14,8 +14,8 @@ PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 
-SRC_URI[md5sum] = "62da86743692cfe4290bee216ac6873e"
-SRC_URI[sha256sum] = "31b6f4489f4a2912d854244c3dca159a6610d314bc3893b5ec6291cc23304571"
+SRC_URI[md5sum] = "61cca51474ccec74f3de15f44b182666"
+SRC_URI[sha256sum] = "f88fec7e167afce6f6fb4c5304dd625b71521b278b826a857796451753c9a964"
 
 inherit allarch
 
-- 
1.7.7.6



