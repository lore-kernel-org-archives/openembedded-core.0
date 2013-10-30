Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1336D4F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 15:22:44 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Oct 2013 08:22:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="314791924"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Oct 2013 08:22:44 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Oct 2013 17:24:50 +0200
Message-Id: <ed02829ef93e40bac1f7c4394343494ddf8c6dbf.1383146648.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383146648.git.cristian.iorga@intel.com>
References: <cover.1383146648.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1383146648.git.cristian.iorga@intel.com>
References: <cover.1383146648.git.cristian.iorga@intel.com>
Subject: [PATCH 2/4] iproute2: upgrade to 3.11.0
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
X-List-Received-Date: Wed, 30 Oct 2013 15:22:44 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../iproute2/{iproute2_3.10.0.bb => iproute2_3.11.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.10.0.bb => iproute2_3.11.0.bb} (64%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.10.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.11.0.bb
similarity index 64%
rename from meta/recipes-connectivity/iproute2/iproute2_3.10.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_3.11.0.bb
index 2220467..98f5a80 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.10.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.11.0.bb
@@ -4,8 +4,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
            file://configure-cross.patch \
           "
 
-SRC_URI[md5sum] = "45fb5427fc723a0001c72b92c931ba02"
-SRC_URI[sha256sum] = "c4023d8d722a1ed673474ca0e5a2d61ebd747cc7001a91321757422d9074c97e"
+SRC_URI[md5sum] = "d7ffb27bc9f0d80577b1f3fb9d1a7689"
+SRC_URI[sha256sum] = "0ab31b52b5fd5ff0d3cf03f2068f05eeb4f0b37d107070fbbaacac94df5e88b7"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
1.8.1.2


