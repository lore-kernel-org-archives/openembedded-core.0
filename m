Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirKX-0004YL-2b
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:14:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2012 11:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161983149"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:03:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:03:34 -0700
Message-Id: <214f0d0461c3ede931e989d3ae865a0f2a92db55.1340560914.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
Subject: [PATCH 09/14] resolvconf: Upgrade to 1.67
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
X-List-Received-Date: Sun, 24 Jun 2012 18:14:37 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{resolvconf_1.65.bb => resolvconf_1.67.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.65.bb => resolvconf_1.67.bb} (88%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.65.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.67.bb
similarity index 88%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.65.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.67.bb
index 9b7553d..7eb49d1 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.65.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.67.bb
@@ -14,8 +14,8 @@ PR = "r0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 
-SRC_URI[md5sum] = "8411411956f986a43021fa7e71d1bae8"
-SRC_URI[sha256sum] = "3876a50a71c5e3e08373b7e41d5ca9a6cf19cf48e9decb3ab0a7c67261d58785"
+SRC_URI[md5sum] = "62da86743692cfe4290bee216ac6873e"
+SRC_URI[sha256sum] = "31b6f4489f4a2912d854244c3dca159a6610d314bc3893b5ec6291cc23304571"
 
 inherit allarch
 
-- 
1.7.7.6



