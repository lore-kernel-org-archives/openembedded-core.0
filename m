Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1Qexeb-0001k1-Ua
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 01:06:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jul 2011 16:02:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,496,1304319600"; d="scan'208";a="24671666"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.178])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2011 16:02:51 -0700
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 16:23:39 -0700
Message-Id: <5c16672646dccf9d2fb2f671e6e1a13bffb2afdb.1310080780.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310080780.git.jessica.zhang@intel.com>
References: <cover.1310080780.git.jessica.zhang@intel.com>
In-Reply-To: <cover.1310080780.git.jessica.zhang@intel.com>
References: <cover.1310080780.git.jessica.zhang@intel.com>
Subject: [PATCH 1/1] [bug 1195] site/mips-common: Cache cvs_cv_func_printf_ptr
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
X-List-Received-Date: Thu, 07 Jul 2011 23:06:42 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
---
 meta/site/mips-common |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/site/mips-common b/meta/site/mips-common
index 6408baa..bbfc779 100644
--- a/meta/site/mips-common
+++ b/meta/site/mips-common
@@ -1,6 +1,9 @@
 ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
 ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 
+# cvs
+cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
+
 # screen
 screen_cv_sys_bcopy_overlap=${screen_cv_sys_bcopy_overlap=no}
 screen_cv_sys_memcpy_overlap=${screen_cv_sys_memcpy_overlap=no}
-- 
1.7.0.4



