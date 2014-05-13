Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5890366070
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 11:02:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2014 04:02:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1043,1389772800"; d="scan'208";a="531050080"
Received: from hpatters-mobl.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.37])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2014 04:02:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 May 2014 12:01:01 +0100
Message-Id: <a79f6cb3b369d59ab3aad3316765487c3d88d6fc.1399978792.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1399978792.git.paul.eggleton@linux.intel.com>
References: <cover.1399978792.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1399978792.git.paul.eggleton@linux.intel.com>
References: <cover.1399978792.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/6] ethtool: upgrade to 3.14
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
X-List-Received-Date: Tue, 13 May 2014 11:02:40 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/ethtool/{ethtool_3.13.bb => ethtool_3.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_3.13.bb => ethtool_3.14.bb} (87%)

diff --git a/meta/recipes-extended/ethtool/ethtool_3.13.bb b/meta/recipes-extended/ethtool/ethtool_3.14.bb
similarity index 87%
rename from meta/recipes-extended/ethtool/ethtool_3.13.bb
rename to meta/recipes-extended/ethtool/ethtool_3.14.bb
index adcb6db..2a3ca70 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.13.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.14.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://run-ptest"
 
-SRC_URI[md5sum] = "0c0c0558a403b478cd3f65dadc00470d"
-SRC_URI[sha256sum] = "68f6b6c9417e8ff3d3b5a8bc22fc4fe8846176ee7d7636e365ce6a2e7b1e44e9"
+SRC_URI[md5sum] = "997e20c25c43ad5800f8ae3204455a8a"
+SRC_URI[sha256sum] = "b1a988d6e397bd9d5d73cfd64329f85121936a050174bbfe90f8701fd893a1df"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
1.9.0


