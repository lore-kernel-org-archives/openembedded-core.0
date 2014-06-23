Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A50666B7D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 13:15:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Jun 2014 06:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,530,1400050800"; d="scan'208";a="532678513"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 23 Jun 2014 06:15:08 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jun 2014 16:18:44 +0300
Message-Id: <cbe0406b193683144f15d7c9d80798a4baaab2f0.1403529482.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403529482.git.cristian.iorga@intel.com>
References: <cover.1403529482.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1403529482.git.cristian.iorga@intel.com>
References: <cover.1403529482.git.cristian.iorga@intel.com>
Subject: [PATCH 3/3] iproute2: upgrade to 3.15.0
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
X-List-Received-Date: Mon, 23 Jun 2014 13:15:11 -0000

The main new features are:
  * ss gets more attention
  * Support for HHF qdisc
  * Updates to bridge command
  * Lots of vxlan related changes
  * Lots of little corrections and build fixes.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../iproute2/{iproute2_3.14.0.bb => iproute2_3.15.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.14.0.bb => iproute2_3.15.0.bb} (68%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.14.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.15.0.bb
similarity index 68%
rename from meta/recipes-connectivity/iproute2/iproute2_3.14.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_3.15.0.bb
index ed40648..7cf9115 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.14.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.15.0.bb
@@ -4,8 +4,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
           "
-SRC_URI[md5sum] = "bd9d7567bbb987c88120669f5e1a1092"
-SRC_URI[sha256sum] = "bda38951c49f89ffc2e2fe85579ce616337b5d3a2f0319921fd071c838356bd4"
+SRC_URI[md5sum] = "5b1711c9d16071959052e369a2682d77"
+SRC_URI[sha256sum] = "5359ed1f31839d8542a057c0c4233131ab9c28d8c41fc9c8484579d9c0b99af4"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
1.9.1


