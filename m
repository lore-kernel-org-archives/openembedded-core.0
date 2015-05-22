Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4A274742DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 15:26:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2015 08:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,476,1427785200"; d="scan'208";a="575483085"
Received: from ihoshino-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.255.86.199])
	by orsmga003.jf.intel.com with ESMTP; 22 May 2015 08:26:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 08:26:46 -0700
Message-Id: <282662bc963d23782bb7c09425fec988fd4b6a69.1432308259.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1432308259.git.sgw@linux.intel.com>
References: <cover.1432308259.git.sgw@linux.intel.com>
Subject: [PATCH 1/3] boost/bjam-native: Upgrade to 1.58.0
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
X-List-Received-Date: Fri, 22 May 2015 15:26:58 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../boost/{bjam-native_1.57.0.bb => bjam-native_1.58.0.bb}            | 0
 meta/recipes-support/boost/{boost-1.57.0.inc => boost-1.58.0.inc}     | 4 ++--
 meta/recipes-support/boost/{boost_1.57.0.bb => boost_1.58.0.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.57.0.bb => bjam-native_1.58.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.57.0.inc => boost-1.58.0.inc} (83%)
 rename meta/recipes-support/boost/{boost_1.57.0.bb => boost_1.58.0.bb} (100%)

diff --git a/meta/recipes-support/boost/bjam-native_1.57.0.bb b/meta/recipes-support/boost/bjam-native_1.58.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.57.0.bb
rename to meta/recipes-support/boost/bjam-native_1.58.0.bb
diff --git a/meta/recipes-support/boost/boost-1.57.0.inc b/meta/recipes-support/boost/boost-1.58.0.inc
similarity index 83%
rename from meta/recipes-support/boost/boost-1.57.0.inc
rename to meta/recipes-support/boost/boost-1.58.0.inc
index 809419d..0bae81b 100644
--- a/meta/recipes-support/boost/boost-1.57.0.inc
+++ b/meta/recipes-support/boost/boost-1.58.0.inc
@@ -13,7 +13,7 @@ BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
 
-SRC_URI[md5sum] = "1be49befbdd9a5ce9def2983ba3e7b76"
-SRC_URI[sha256sum] = "910c8c022a33ccec7f088bd65d4f14b466588dda94ba2124e78b8c57db264967"
+SRC_URI[md5sum] = "b8839650e61e9c1c0a89f371dd475546"
+SRC_URI[sha256sum] = "fdfc204fc33ec79c99b9a74944c3e54bd78be4f7f15e260c0e2700a36dc7d3e5"
 
 S = "${WORKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/boost/boost_1.57.0.bb b/meta/recipes-support/boost/boost_1.58.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.57.0.bb
rename to meta/recipes-support/boost/boost_1.58.0.bb
-- 
2.1.0


