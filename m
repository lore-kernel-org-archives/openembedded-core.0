Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UGCdf-0003Ye-7t
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 19:12:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2013 10:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,845,1355126400"; d="scan'208";a="214773835"
Received: from unknown (HELO dell-desktop.rb.intel.com) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Mar 2013 10:55:34 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 19:55:04 +0200
Message-Id: <9fe4665f82eeb5dbb5eb60dea793eb2611989431.1363283478.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
Subject: [PATCH 05/17] ed: Upgrade to v1.7
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
X-List-Received-Date: Thu, 14 Mar 2013 18:12:30 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../ed/{ed-1.6 => ed-1.7}/ed-1.2-build.patch       |    0
 meta/recipes-extended/ed/{ed_1.6.bb => ed_1.7.bb}  |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ed/{ed-1.6 => ed-1.7}/ed-1.2-build.patch (100%)
 rename meta/recipes-extended/ed/{ed_1.6.bb => ed_1.7.bb} (81%)

diff --git a/meta/recipes-extended/ed/ed-1.6/ed-1.2-build.patch b/meta/recipes-extended/ed/ed-1.7/ed-1.2-build.patch
similarity index 100%
rename from meta/recipes-extended/ed/ed-1.6/ed-1.2-build.patch
rename to meta/recipes-extended/ed/ed-1.7/ed-1.2-build.patch
diff --git a/meta/recipes-extended/ed/ed_1.6.bb b/meta/recipes-extended/ed/ed_1.7.bb
similarity index 81%
rename from meta/recipes-extended/ed/ed_1.6.bb
rename to meta/recipes-extended/ed/ed_1.7.bb
index cc72588..0057438 100644
--- a/meta/recipes-extended/ed/ed_1.6.bb
+++ b/meta/recipes-extended/ed/ed_1.7.bb
@@ -16,8 +16,8 @@ bindir = "${base_bindir}"
 SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.gz \
            file://ed-1.2-build.patch"
 
-SRC_URI[md5sum] = "9a78593decccaa889523aa4bb555ed4b"
-SRC_URI[sha256sum] = "211c67b0c4aae277d34b1c5f842db1952e468e5905142868e4718ac838f08a65"
+SRC_URI[md5sum] = "0aa4e2428e325203d0d7c3e86c961b1c"
+SRC_URI[sha256sum] = "894241019a5ff2b7816d20c5bd5a7048fb8f336ca52e97b3cc88d45b16472031"
 
 do_configure() {
 	${S}/configure
-- 
1.7.9.5



