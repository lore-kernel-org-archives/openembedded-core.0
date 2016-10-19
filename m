Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8884971A78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:09:10 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2016 08:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,514,1473145200"; d="scan'208";a="21266865"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 08:09:11 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 18:06:37 +0300
Message-Id: <2c65b1cbde2c9af76e15d0e760a85bdd1ac9a026.1476888929.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/19] mklibs-native: fix upstream version check
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
X-List-Received-Date: Wed, 19 Oct 2016 15:09:11 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
index b3c1b5b..4cf1a5c 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.41.bb
@@ -18,4 +18,6 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160207T221625Z/pool/main/
 SRC_URI[md5sum] = "6b2979876a611717df3d49e7f9cf291d"
 SRC_URI[sha256sum] = "058c7349f8ec8a03b529c546a95cd6426741bd819f1e1211f499273eb4bf5d89"
 
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/m/mklibs/"
+
 inherit autotools gettext native pythonnative
-- 
2.9.3


