Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 71C5B65DEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 16:17:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989832"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:43 -0800
Message-Id: <78c4b060c5f757addcb8566bb0cd19e8837829e8.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 18/19] man-pages: Upgrade to 3.75
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:58 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../man-pages/{man-pages_3.71.bb => man-pages_3.75.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.71.bb => man-pages_3.75.bb} (86%)

diff --git a/meta/recipes-extended/man-pages/man-pages_3.71.bb b/meta/recipes-extended/man-pages/man-pages_3.75.bb
similarity index 86%
rename from meta/recipes-extended/man-pages/man-pages_3.71.bb
rename to meta/recipes-extended/man-pages/man-pages_3.75.bb
index 225b256..18e2bca 100644
--- a/meta/recipes-extended/man-pages/man-pages_3.71.bb
+++ b/meta/recipes-extended/man-pages/man-pages_3.75.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "a853ef29d835e8522c04f832919139f1"
-SRC_URI[sha256sum] = "307c9ac65b98a3a3d377050f0dc62d40b7a5995e6e6e6049d63fd9cc4fc27059"
+SRC_URI[md5sum] = "74ad4aef657a046fe214bf981a9a2b30"
+SRC_URI[sha256sum] = "ba23f57a98d032a742ff506f32550dfa2c3076c8bf8d5f6b59305c6b015077d3"
 
 RDEPENDS_${PN} = "man"
 
-- 
1.8.3.1


