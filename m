Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QJuKa-0003KV-SO
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 23:19:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 May 2011 14:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,347,1301900400"; d="scan'208";a="433888037"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 10 May 2011 14:16:13 -0700
Message-Id: <5121786f93b4e66ee2e781dce3e30f576f263f7e.1305062028.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305062026.git.nitin.a.kamble@intel.com>
References: <cover.1305062026.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 10 May 2011 13:13:37 -0700
Date: Tue, 10 May 2011 14:16:13 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 10/16] cpio: fix upstream-status format
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 21:19:01 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../cpio/cpio-2.8/avoid_heap_overflow.patch        |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch b/meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch
index cf068fa..49a7cf5 100644
--- a/meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch
+++ b/meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Inappropriate [bugfix: http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0624]"
+Upstream-Status: Inappropriate [bugfix: http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0624]
 
 This patch avoids heap overflow reported by :
 http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0624
-- 
1.7.3.4



