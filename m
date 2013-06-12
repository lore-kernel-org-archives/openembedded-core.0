Return-Path: <kevin.strasser@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 145936AA70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 17:47:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2013 10:47:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,853,1363158000"; d="scan'208";a="352392155"
Received: from wrk.jf.intel.com ([10.7.202.76])
	by orsmga002.jf.intel.com with ESMTP; 12 Jun 2013 10:47:20 -0700
From: Kevin Strasser <kevin.strasser@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2013 10:40:30 -0700
Message-Id: <413012075baacdde3ac92f419557da5433cd703a.1371058261.git.kevin.strasser@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1371058261.git.kevin.strasser@linux.intel.com>
References: <cover.1371058261.git.kevin.strasser@linux.intel.com>
In-Reply-To: <cover.1371058261.git.kevin.strasser@linux.intel.com>
References: <cover.1371058261.git.kevin.strasser@linux.intel.com>
Subject: [PATCH 1/2] dhcp: drop fixincludes.patch
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

Recent versions of dhcp have swapped out use of __u16 for u_int16_t and
therefor asm/types.h no longer needs to be included. Drop fixincludes.patch
from dhcp recipe.

Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
---
 .../dhcp/dhcp/fixincludes.patch                    |   12 ------------
 meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb    |    3 +--
 2 files changed, 1 insertion(+), 14 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/fixincludes.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/fixincludes.patch b/meta/recipes-connectivity/dhcp/dhcp/fixincludes.patch
deleted file mode 100644
index e33c9dd..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/fixincludes.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Upstream-Status: Pending
-
---- dhcp-3.0.2/common/tr.c~compile	2005-10-13 14:23:37.000000000 +0200
-+++ dhcp-3.0.2/common/tr.c	2005-10-13 14:23:45.000000000 +0200
-@@ -39,6 +39,7 @@
- #include "includes/netinet/udp.h"
- #include "includes/netinet/if_ether.h"
- #include "netinet/if_tr.h"
-+#include <asm/types.h>
- #include <sys/time.h>
- 
- /*
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
index a5eed34..08db41b 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.5-P1.bb
@@ -2,8 +2,7 @@ require dhcp.inc
 
 PR = "r1"
 
-SRC_URI += "file://fixincludes.patch \
-            file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
+SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://fix-external-bind.patch \
             file://link-with-lcrypto.patch \
             file://fixsepbuild.patch \
-- 
1.7.9.5


