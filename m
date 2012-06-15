Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SfLu7-00016m-FY
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 04:04:51 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Jun 2012 18:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156591328"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.116])
	by azsmga001.ch.intel.com with ESMTP; 14 Jun 2012 18:54:13 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2012 09:53:35 +0800
Message-Id: <888c238b3f8d80ebd03aa856133d86e6d47769e6.1339724809.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1339724809.git.lianhao.lu@intel.com>
References: <cover.1339724809.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] pango: added upstream-status status.
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
X-List-Received-Date: Fri, 15 Jun 2012 02:04:51 -0000

Added missing upstream status.

Signed-off-by: Edwin Zhai <edwin.zhai@intel.com>
---
 .../pango/pango-1.28.4/multilib-fix-clean.patch    |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch b/meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch
index addda5f..3f00ad8 100644
--- a/meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch
+++ b/meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: pango-1.28.4/configure.in
 ===================================================================
 --- pango-1.28.4.orig/configure.in	2011-04-05 04:29:16.000000000 +0800
-- 
1.7.0.4



