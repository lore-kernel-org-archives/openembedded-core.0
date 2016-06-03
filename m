Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6AF77599
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 21:18:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jun 2016 14:18:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,414,1459839600"; d="scan'208";a="980461878"
Received: from tzanussi-mobl.amr.corp.intel.com (HELO localhost)
	([10.254.121.190])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jun 2016 14:18:30 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 16:18:27 -0500
Message-Id: <0f31e8d9a515e3f8c8e4eb6e1d92b5fd1818804d.1464988267.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1464988267.git.tom.zanussi@linux.intel.com>
References: <cover.1464988267.git.tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1][krogoth] linux-yocto-rt/4.4: Update KBRANCH
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
X-List-Received-Date: Fri, 03 Jun 2016 21:18:29 -0000

standard/preempt-rt was replaced by standard/preempt-rt/base in
linux-yocto-4.4.git, so KBRANCH needs to be updated accordingly.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 5e39374..beff921 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -1,4 +1,4 @@
-KBRANCH ?= "standard/preempt-rt"
+KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-- 
1.9.3


