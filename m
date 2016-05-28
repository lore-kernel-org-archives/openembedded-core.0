Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3E577085
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 19:27:19 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 28 May 2016 12:27:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,380,1459839600"; d="scan'208";a="710368549"
Received: from riturkis-mobl1.amr.corp.intel.com (HELO localhost)
	([10.252.207.19])
	by FMSMGA003.fm.intel.com with ESMTP; 28 May 2016 12:27:20 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org, bruce.ashfield@windriver.com,
	richard.purdie@linuxfoundation.org
Date: Sat, 28 May 2016 14:27:18 -0500
Message-Id: <2d425e7e0f2020c64240c74a78b65c67d8ad97f0.1464450270.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1464450270.git.tom.zanussi@linux.intel.com>
References: <cover.1464450270.git.tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] linux-yocto-rt/4.4: Update KBRANCH
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
X-List-Received-Date: Sat, 28 May 2016 19:27:20 -0000

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


