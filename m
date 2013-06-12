Return-Path: <kevin.strasser@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 203256AAA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 17:47:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2013 10:47:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,853,1363158000"; d="scan'208";a="352392156"
Received: from wrk.jf.intel.com ([10.7.202.76])
	by orsmga002.jf.intel.com with ESMTP; 12 Jun 2013 10:47:20 -0700
From: Kevin Strasser <kevin.strasser@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 10:40:31 -0700
Message-Id: <c6511306be675ada18061ce85bb1bad25cf1cee1.1371058261.git.kevin.strasser@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1371058261.git.kevin.strasser@linux.intel.com>
References: <cover.1371058261.git.kevin.strasser@linux.intel.com>
In-Reply-To: <cover.1371058261.git.kevin.strasser@linux.intel.com>
References: <cover.1371058261.git.kevin.strasser@linux.intel.com>
Subject: [PATCH 2/2] dhcp: drop noattrmode.patch
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
X-List-Received-Date: Wed, 12 Jun 2013 17:47:20 -0000

This change no longer needs to be backported now that a newer version
of dhcp is being used. The patch isn't causing errors because it is not
included in the dhcp recipe's SRC_URI.

Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
---
 .../dhcp/dhcp/noattrmode.patch                     |   21 --------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/noattrmode.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/noattrmode.patch b/meta/recipes-connectivity/dhcp/dhcp/noattrmode.patch
deleted file mode 100644
index 5c635e8..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/noattrmode.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Backport
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- dhcp-3.0.1/includes/dhcpd.h~compile
-+++ dhcp-3.0.1/includes/dhcpd.h
-@@ -306,9 +306,9 @@
- #	define EPHEMERAL_FLAGS		(MS_NULL_TERMINATION | \
- 					 UNICAST_BROADCAST_HACK)
- 
--	binding_state_t __attribute__ ((mode (__byte__))) binding_state;
--	binding_state_t __attribute__ ((mode (__byte__))) next_binding_state;
--	binding_state_t __attribute__ ((mode (__byte__))) desired_binding_state;
-+	binding_state_t binding_state;
-+	binding_state_t next_binding_state;
-+	binding_state_t desired_binding_state;
- 	
- 	struct lease_state *state;
- 
-- 
1.7.9.5


