Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2668A6FF93
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 01:38:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 23 Mar 2016 18:38:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,383,1455004800"; d="scan'208";a="917593324"
Received: from afshjern.zpn.intel.com ([10.219.16.250])
	by orsmga001.jf.intel.com with ESMTP; 23 Mar 2016 18:38:11 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 19:39:10 -0600
Message-Id: <1458783551-757-3-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1458783551-757-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1458783551-757-1-git-send-email-alejandro.franco@linux.intel.com>
Cc: joshua.g.lock@intel.com, aschultz@tpip.net, benjamin.esquivel@intel.com
Subject: [PATCHv3 2/3] icecc.bbclass: expand package arch
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
X-List-Received-Date: Thu, 24 Mar 2016 01:38:11 -0000

Expanding PACKAGE_ARCH might be necessary as it is being
checked against to determine if this is allarch

[YOCTO #8934]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 75d0e5d..b4f1be5 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -138,7 +138,7 @@ def use_icc(bb,d):
     return "yes"
 
 def icc_is_allarch(bb, d):
-    return d.getVar("PACKAGE_ARCH", False) == "all" or bb.data.inherits_class('allarch', d)
+    return d.getVar("PACKAGE_ARCH", True) == "all" or bb.data.inherits_class('allarch', d)
 
 def icc_is_kernel(bb, d):
     return \
-- 
2.7.3


