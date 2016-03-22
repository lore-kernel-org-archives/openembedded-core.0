Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 51D3A65CB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 23:50:55 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 22 Mar 2016 16:50:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,379,1455004800"; d="scan'208";a="71450825"
Received: from afshjern.zpn.intel.com ([10.219.16.250])
	by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2016 16:50:54 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 17:52:05 -0600
Message-Id: <1458690727-23015-2-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1458690727-23015-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1458690727-23015-1-git-send-email-alejandro.franco@linux.intel.com>
Cc: joshua.g.lock@intel.com, aschultz@tpip.net, benjamin.esquivel@intel.com
Subject: [PATCHv2 1/3] icecc.bbclass: add icc_is_allarch inherit check
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
X-List-Received-Date: Tue, 22 Mar 2016 23:50:55 -0000

Additional check for inheritance of allarch.bbclass, for when
checking that PACKAGE_ARCH == "all" is not enough to be sure
a recipe is "allarch"; e.g. nativesdk-buildtools type recipes

[YOCTO #8934]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 61b8bb1..75d0e5d 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -138,7 +138,7 @@ def use_icc(bb,d):
     return "yes"
 
 def icc_is_allarch(bb, d):
-    return d.getVar("PACKAGE_ARCH", False) == "all"
+    return d.getVar("PACKAGE_ARCH", False) == "all" or bb.data.inherits_class('allarch', d)
 
 def icc_is_kernel(bb, d):
     return \
-- 
2.7.3


