Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 67B9C6D476
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 13:59:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Nov 2013 05:55:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="406830958"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.166])
	by orsmga001.jf.intel.com with ESMTP; 11 Nov 2013 05:59:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2013 13:59:11 +0000
Message-Id: <bfb202591eb3842cccf8fe73627f1e8b5bd8444f.1384176729.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384176729.git.paul.eggleton@linux.intel.com>
References: <cover.1384176729.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1384176729.git.paul.eggleton@linux.intel.com>
References: <cover.1384176729.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] nfs-utils: upgrade to 1.2.9
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
X-List-Received-Date: Mon, 11 Nov 2013 13:59:23 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../nfs-utils/{nfs-utils_1.2.8.bb => nfs-utils_1.2.9.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.2.8.bb => nfs-utils_1.2.9.bb} (95%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
similarity index 95%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
index e3e8136..9fa972c 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
@@ -21,8 +21,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.b
            file://nfs-mountd.service \
            file://nfs-statd.service "
 
-SRC_URI[md5sum] = "6e7d97de51e428a0b8698c16ca23db77"
-SRC_URI[sha256sum] = "1cc8f02a633eddbf0a1d93421f331479c4cdab4c5ab33b8bf8c7c369f9156ac6"
+SRC_URI[md5sum] = "18869d16db3f49c053f8c68eba3fe2e0"
+SRC_URI[sha256sum] = "90b76d5692a520b74273e607a4fd69df4cc35f65e242e22e2bc61b58759722f3"
 
 PARALLEL_MAKE = ""
 
-- 
1.8.1.2


