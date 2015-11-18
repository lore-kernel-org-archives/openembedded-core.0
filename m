Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B5287601B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 09:33:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 18 Nov 2015 01:33:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,312,1444719600"; d="scan'208";a="853703635"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2015 01:33:47 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id B7FE66A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 01:32:41 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 11:34:34 +0200
Message-Id: <1447839279-12119-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/6] iproute2: update to 4.3.0
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
X-List-Received-Date: Wed, 18 Nov 2015 09:33:48 -0000

4.1.1 -> 4.3.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../iproute2/{iproute2_4.1.1.bb => iproute2_4.3.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.1.1.bb => iproute2_4.3.0.bb} (68%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.1.1.bb b/meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
similarity index 68%
rename from meta/recipes-connectivity/iproute2/iproute2_4.1.1.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
index 10db0ba..0b3d896 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.1.1.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.3.0.bb
@@ -4,8 +4,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://configure-cross.patch \
            file://0001-iproute2-de-bash-scripts.patch \
           "
-SRC_URI[md5sum] = "39290cb3a55d38dd8d10e19a3094109f"
-SRC_URI[sha256sum] = "73077a989efb934450bd655cbd9aaddaa747cb696c64d0c9a3323768a6a8e66f"
+SRC_URI[md5sum] = "1a2bbb80cfc7ab3f3e987e18b3207c2f"
+SRC_URI[sha256sum] = "f03b1188dd6c039512424de82ff7a8f3b446680bd4e908ff42a7b9b137422995"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.4.0


