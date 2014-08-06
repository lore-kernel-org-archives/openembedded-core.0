Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 88614701D0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 23:30:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Aug 2014 16:25:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,814,1400050800"; d="scan'208";a="584446788"
Received: from unknown (HELO swold-linux.jf.intel.com) ([10.7.199.90])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2014 16:30:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Aug 2014 16:30:51 -0700
Message-Id: <1407367851-12976-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] busybox: Add Upstream-Status to patch
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
X-List-Received-Date: Wed, 06 Aug 2014 23:31:00 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/busybox/busybox/recognize_connmand.patch | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox/recognize_connmand.patch b/meta/recipes-core/busybox/busybox/recognize_connmand.patch
index 495bb05..f42c74c 100644
--- a/meta/recipes-core/busybox/busybox/recognize_connmand.patch
+++ b/meta/recipes-core/busybox/busybox/recognize_connmand.patch
@@ -1,3 +1,9 @@
+This adds connmand to the list of know dhcp clients
+
+Upstream-Status: Inappropriate [OE-Core]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
 Index: busybox-1.22.1/networking/ifupdown.c
 ===================================================================
 --- busybox-1.22.1.orig/networking/ifupdown.c
-- 
1.8.3.1


