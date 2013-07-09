Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 15D606028A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 22:15:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jul 2013 15:13:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1030,1363158000"; d="scan'208";a="367406206"
Received: from dvhart-mobl3.amr.corp.intel.com (HELO localhost) ([10.7.199.52])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2013 15:15:37 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2013 15:15:28 -0700
Message-Id: <e01e4656b562f087f270dc1134e7501c8f6b169b.1373408128.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Darren Hart <dvhart@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] alsa-state: Provide an empty asound.conf by default
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
X-List-Received-Date: Tue, 09 Jul 2013 22:15:37 -0000

An empty asound.conf should work for most cases. The existing asound.conf
uses plug dmix which causes arecord to fail without a special -D device
specification on the command line (as no capture device is defined).

Clear asound.conf for the default case. Any needed changes should be
made in the BSP layers.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-bsp/alsa-state/alsa-state/asound.conf | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state/asound.conf b/meta/recipes-bsp/alsa-state/alsa-state/asound.conf
index 6be0242..03653cf 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state/asound.conf
+++ b/meta/recipes-bsp/alsa-state/alsa-state/asound.conf
@@ -1,12 +1 @@
-# default dmix configuration
-
-pcm.!default {
-    type plug
-    slave.pcm "dmix"
-}
-
-ctl.mixer0 {
-    type hw
-    card 0
-}
-
+# Global alsa-lib configuration
-- 
1.8.3.1


