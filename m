Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTh1-0000iT-IO
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2011 04:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="641704527"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2011 04:01:42 -0700
Message-Id: <03eb00a9fbeeb33004d009a2c0c501b3a2bf23c2.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 15:34:06 +0800
Date: Thu, 12 May 2011 19:01:40 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 42/54] liboil: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:33 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../liboil-0.3.17/fix-unaligned-whitelist.patch    |    2 ++
 .../liboil/liboil-0.3.17/no-tests.patch            |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch b/meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
index 79d53b6..c8e3c1f 100644
--- a/meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
+++ b/meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
@@ -4,6 +4,8 @@ configure: fix whitelisting of x86_64 unaligned memory access
 
 Fix typo in whitelist so cross-compile works for x86_64.
 
+Upstream-Status: Inappropriate [configuration]
+
 --- liboil-0.3.17/m4/as-unaligned-access.m4.orig	2009-02-26 14:40:08.000000000 -0500
 +++ liboil-0.3.17/m4/as-unaligned-access.m4	2010-11-03 12:19:55.000000000 -0400
 @@ -9,7 +9,7 @@
diff --git a/meta/recipes-support/liboil/liboil-0.3.17/no-tests.patch b/meta/recipes-support/liboil/liboil-0.3.17/no-tests.patch
index 00cf5d7..892d441 100644
--- a/meta/recipes-support/liboil/liboil-0.3.17/no-tests.patch
+++ b/meta/recipes-support/liboil/liboil-0.3.17/no-tests.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 --- liboil-0.3.9/liboil/liboilfunction.c.old	2006-09-18 13:03:20.000000000 +0100
 +++ liboil-0.3.9/liboil/liboilfunction.c	2006-09-18 13:04:10.000000000 +0100
 @@ -345,7 +345,9 @@
-- 
1.7.1



