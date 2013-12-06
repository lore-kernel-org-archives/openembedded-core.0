Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0576E208
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2013 14:57:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Dec 2013 06:54:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,841,1378882800"; d="scan'208";a="420490305"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 06 Dec 2013 06:57:54 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2013 17:00:15 +0200
Message-Id: <af052a6b1d15ab37bcfd4814a71228a7051e16f9.1386341976.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1386341976.git.cristian.iorga@intel.com>
References: <cover.1386341976.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1386341976.git.cristian.iorga@intel.com>
References: <cover.1386341976.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] iproute2: upgrade to 3.12.0
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
X-List-Received-Date: Fri, 06 Dec 2013 14:57:55 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../iproute2/{iproute2_3.11.0.bb => iproute2_3.12.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.11.0.bb => iproute2_3.12.0.bb} (68%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.11.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.12.0.bb
similarity index 68%
rename from meta/recipes-connectivity/iproute2/iproute2_3.11.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_3.12.0.bb
index 469b2b0..8cd9d21 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.11.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.12.0.bb
@@ -5,8 +5,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-iproute2-de-bash-scripts.patch \
           "
 
-SRC_URI[md5sum] = "d7ffb27bc9f0d80577b1f3fb9d1a7689"
-SRC_URI[sha256sum] = "0ab31b52b5fd5ff0d3cf03f2068f05eeb4f0b37d107070fbbaacac94df5e88b7"
+SRC_URI[md5sum] = "f87386aaaecafab95607fd10e8152c68"
+SRC_URI[sha256sum] = "44f600475d27a421688cda2294efec38513473a740c24ead78eb20005f08f111"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
1.8.3.2


