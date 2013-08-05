Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 158436B1A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 21:07:42 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2013 14:07:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,821,1367996400"; d="scan'208";a="342090546"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.23])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2013 14:07:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2013 14:07:38 -0700
Message-Id: <fee5295c1b5faf5386587d9e1e4c5d45a13379e8.1375736784.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1375736784.git.sgw@linux.intel.com>
References: <cover.1375736784.git.sgw@linux.intel.com>
In-Reply-To: <cover.1375736784.git.sgw@linux.intel.com>
References: <cover.1375736784.git.sgw@linux.intel.com>
Subject: [PATCH 2/3] util-linux: upgrade to 2.23.2
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
X-List-Received-Date: Mon, 05 Aug 2013 21:07:43 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../util-linux/{util-linux_2.23.1.bb => util-linux_2.23.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.23.1.bb => util-linux_2.23.2.bb} (83%)

diff --git a/meta/recipes-core/util-linux/util-linux_2.23.1.bb b/meta/recipes-core/util-linux/util-linux_2.23.2.bb
similarity index 83%
rename from meta/recipes-core/util-linux/util-linux_2.23.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.23.2.bb
index 12f5021..b5c221b 100644
--- a/meta/recipes-core/util-linux/util-linux_2.23.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.23.2.bb
@@ -14,8 +14,8 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             ${OLDHOST} \
 "
 
-SRC_URI[md5sum] = "6741eeaff93ff5a6bacdd3816bdd87c4"
-SRC_URI[sha256sum] = "ad4a7831d7b27d0172996fd343e809716c2403b32a94e15194d8ea797223c4af"
+SRC_URI[md5sum] = "39a02ad0b3b37824c394f40930b7aa38"
+SRC_URI[sha256sum] = "6c5be3f7beec91b4893de14bbd722886fa2521be5bfa0fc079b749d0018633b1"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
 EXTRA_OECONF_class-native += "--disable-fallocate --disable-use-tty-group"
-- 
1.8.1.4


