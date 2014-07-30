Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E167B7096D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 22:54:53 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2014 15:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,768,1400050800"; d="scan'208";a="463358290"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.12.249])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2014 15:54:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jul 2014 15:54:46 -0700
Message-Id: <85eedcc4d1d2cf651cdd898c01ab9c37a1002ed8.1406760824.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1406760824.git.sgw@linux.intel.com>
References: <cover.1406760824.git.sgw@linux.intel.com>
In-Reply-To: <cover.1406760824.git.sgw@linux.intel.com>
References: <cover.1406760824.git.sgw@linux.intel.com>
Subject: [PATCH 1/4] help2man-native: Upgrade to 1.46.1
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
X-List-Received-Date: Wed, 30 Jul 2014 22:54:55 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../help2man/{help2man-native_1.45.1.bb => help2man-native_1.46.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.45.1.bb => help2man-native_1.46.1.bb} (79%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.45.1.bb b/meta/recipes-devtools/help2man/help2man-native_1.46.1.bb
similarity index 79%
rename from meta/recipes-devtools/help2man/help2man-native_1.45.1.bb
rename to meta/recipes-devtools/help2man/help2man-native_1.46.1.bb
index dec17b5..a51c81f 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.45.1.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.46.1.bb
@@ -6,8 +6,8 @@ DEPENDS = "autoconf-native automake-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "8a8a5314284e46185e492756afdca29a"
-SRC_URI[sha256sum] = "c70fc791e6d13240327955de355244371b00bb1c9e247d5693ed601b716467c2"
+SRC_URI[md5sum] = "63b8f14a81ce28ba119d588d00c63f43"
+SRC_URI[sha256sum] = "3dfd02a026149aad06887c1cb6062471779c100e00aecb79b8f9d01cf1581c47"
 
 inherit autotools native
 
-- 
1.8.3.1


