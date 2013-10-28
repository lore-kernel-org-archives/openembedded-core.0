Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BEA196D138
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 16:45:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Oct 2013 09:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,587,1378882800"; d="scan'208";a="418598710"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.120.252])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2013 09:44:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 16:44:38 +0000
Message-Id: <cdb5f91a8c71d48121defef4f1c826d35a6eadce.1382978401.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1382978401.git.paul.eggleton@linux.intel.com>
References: <cover.1382978401.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1382978401.git.paul.eggleton@linux.intel.com>
References: <cover.1382978401.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] ethtool: upgrade to 3.11
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
X-List-Received-Date: Mon, 28 Oct 2013 16:45:18 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-extended/ethtool/{ethtool-3.10 => ethtool-3.11}/run-ptest | 0
 meta/recipes-extended/ethtool/{ethtool_3.10.bb => ethtool_3.11.bb}    | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool-3.10 => ethtool-3.11}/run-ptest (100%)
 rename meta/recipes-extended/ethtool/{ethtool_3.10.bb => ethtool_3.11.bb} (87%)

diff --git a/meta/recipes-extended/ethtool/ethtool-3.10/run-ptest b/meta/recipes-extended/ethtool/ethtool-3.11/run-ptest
similarity index 100%
rename from meta/recipes-extended/ethtool/ethtool-3.10/run-ptest
rename to meta/recipes-extended/ethtool/ethtool-3.11/run-ptest
diff --git a/meta/recipes-extended/ethtool/ethtool_3.10.bb b/meta/recipes-extended/ethtool/ethtool_3.11.bb
similarity index 87%
rename from meta/recipes-extended/ethtool/ethtool_3.10.bb
rename to meta/recipes-extended/ethtool/ethtool_3.11.bb
index 83587d9..1e89800 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.10.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.11.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://run-ptest"
 
-SRC_URI[md5sum] = "b41deb37143dfb86934a8f52cea853d2"
-SRC_URI[sha256sum] = "62f0a9cea954c32a2bdc2d2ece295fda5b915cfea56f5de97b997d8ebaae0381"
+SRC_URI[md5sum] = "b3fba5cc45377b8fc2ead9f1e05c11bd"
+SRC_URI[sha256sum] = "a054fd5a318a0a01113952908d2344eb452f4dfd2525fe8b525f7ff2236db38a"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
1.8.1.2


