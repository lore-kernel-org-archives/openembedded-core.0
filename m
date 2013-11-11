Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 49F806D476
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 13:59:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Nov 2013 05:55:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="406830944"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.166])
	by orsmga001.jf.intel.com with ESMTP; 11 Nov 2013 05:59:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2013 13:59:10 +0000
Message-Id: <fa01b1ad986ffb55618852a9b2bf292fdc1a7bd9.1384176729.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384176729.git.paul.eggleton@linux.intel.com>
References: <cover.1384176729.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1384176729.git.paul.eggleton@linux.intel.com>
References: <cover.1384176729.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] ethtool: upgrade to 3.12.1
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
X-List-Received-Date: Mon, 11 Nov 2013 13:59:22 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../ethtool/{ethtool-3.11 => ethtool-3.12.1}/run-ptest                | 0
 meta/recipes-extended/ethtool/{ethtool_3.11.bb => ethtool_3.12.1.bb}  | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool-3.11 => ethtool-3.12.1}/run-ptest (100%)
 rename meta/recipes-extended/ethtool/{ethtool_3.11.bb => ethtool_3.12.1.bb} (87%)

diff --git a/meta/recipes-extended/ethtool/ethtool-3.11/run-ptest b/meta/recipes-extended/ethtool/ethtool-3.12.1/run-ptest
similarity index 100%
rename from meta/recipes-extended/ethtool/ethtool-3.11/run-ptest
rename to meta/recipes-extended/ethtool/ethtool-3.12.1/run-ptest
diff --git a/meta/recipes-extended/ethtool/ethtool_3.11.bb b/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
similarity index 87%
rename from meta/recipes-extended/ethtool/ethtool_3.11.bb
rename to meta/recipes-extended/ethtool/ethtool_3.12.1.bb
index 1e89800..19bca2f 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.11.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://run-ptest"
 
-SRC_URI[md5sum] = "b3fba5cc45377b8fc2ead9f1e05c11bd"
-SRC_URI[sha256sum] = "a054fd5a318a0a01113952908d2344eb452f4dfd2525fe8b525f7ff2236db38a"
+SRC_URI[md5sum] = "5a1058efe8eb4f3473f5028967729078"
+SRC_URI[sha256sum] = "45190d70e5ce1b4d87def4f71fb5bf04f8a4f4dc5f9e0f38c49c16c462fb59d9"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
1.8.1.2


