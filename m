Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB29601D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 15:49:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Feb 2017 07:49:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,172,1484035200"; d="scan'208";a="1098281002"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.22.23])
	by orsmga001.jf.intel.com with ESMTP; 17 Feb 2017 07:49:21 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Feb 2017 15:49:16 +0000
Message-Id: <20170217154916.4585-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] layer.conf: bump version for change in eSDK selftest behaviour
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
X-List-Received-Date: Fri, 17 Feb 2017 15:49:24 -0000

Since 59a99cd8 "oeqa/sdk: Updates sanity tests for minimal eSDK"
we can now run oe-selftests against a minimal eSDK.

We need to increase the layer version so that we can detect this
change in behaviour in our automated testing.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 24b4df0..87c235f 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_PRIORITY_core = "5"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_core = "9"
+LAYERVERSION_core = "10"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
 
-- 
2.9.3


