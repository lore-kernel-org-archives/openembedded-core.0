Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CCFF66CA5B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 12:31:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Oct 2013 05:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1032,1371106800"; d="scan'208";a="413995833"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 04 Oct 2013 05:31:02 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Oct 2013 15:33:05 +0300
Message-Id: <e1d72be6d8b6a6f18000f4c5a334573de35deea3.1380889949.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1380889949.git.cristian.iorga@intel.com>
References: <cover.1380889949.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1380889949.git.cristian.iorga@intel.com>
References: <cover.1380889949.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] connman-conf: add a global public DNS to network provisioning
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
X-List-Received-Date: Fri, 04 Oct 2013 12:31:00 -0000

In case of QEMU machines, a global public DNS is provisioned,
as the network is not configured via DHCP.
Google's public global DNS server 8.8.8.8 is used.

Partial fix for [YOCTO #4587] (qemu machines case).

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config
index 996e429..42998ce 100644
--- a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config
+++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired.config
@@ -6,3 +6,4 @@ Description = Wired network configuration
 Type = ethernet
 IPv4 =
 MAC = 52:54:00:12:34:56
+Nameservers = 8.8.8.8
-- 
1.8.1.2


