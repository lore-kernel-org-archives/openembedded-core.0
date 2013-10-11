Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 824CF6D054
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:29 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506421"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:13 -0700
Message-Id: <582cb1d3018b7733fc6b6a49b52d2ef1356fa386.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
References: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 07/18] man-pages: upgrade to 3.54
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:29 -0000

(From OE-Core rev: 866c2630db9c241f0d2afafb66da9d000e4b5770)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../man-pages/{man-pages_3.53.bb => man-pages_3.54.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.53.bb => man-pages_3.54.bb} (82%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.53.bb b/meta/recipes-extended/man-pages/man-pages_3.54.bb
similarity index 82%
rename from meta/recipes-extended/man-pages/man-pages_3.53.bb
rename to meta/recipes-extended/man-pages/man-pages_3.54.bb
index 965adbf..1edaa23 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.53.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.54.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=0422377a748010b2b738342e24f141c1"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "3f827368bc0e2330f61d4b4c1c98a792"
-SRC_URI[sha256sum] = "618715dd7e5536ba819710436a76cd897585447a0cf9bf1af270ca83fbad27d5"
+SRC_URI[md5sum] = "57fa37123b6dd09e06b9d1b0b4aee8b6"
+SRC_URI[sha256sum] = "e5d6d61a8de48bc27a1a8135c20c740ee33d35970f0859bfe14aef34253d9df8"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.8.3.1


