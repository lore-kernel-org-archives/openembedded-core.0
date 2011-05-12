Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgP-0000MC-JC
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:03:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 May 2011 04:01:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860495"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:01:06 -0700
Message-Id: <8626ba68b8c674366ddc7bd7b83afafa704ac0b2.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 09:42:34 +0800
Date: Thu, 12 May 2011 19:01:04 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 14/54] beecrypt: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:03:55 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../beecrypt/beecrypt/disable-icu-check.patch      |    2 ++
 .../beecrypt/beecrypt/fix-security.patch           |    3 +++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/beecrypt/beecrypt/disable-icu-check.patch b/meta/recipes-support/beecrypt/beecrypt/disable-icu-check.patch
index 4a2f414..91b1fa6 100644
--- a/meta/recipes-support/beecrypt/beecrypt/disable-icu-check.patch
+++ b/meta/recipes-support/beecrypt/beecrypt/disable-icu-check.patch
@@ -1,6 +1,8 @@
 We are unable to run code at configure time in a cross environemnt, but as we
 control the build we can be fairly certain this dependency is met.
 
+Upstream-Status: Inappropriate [embedded specific]
+
 JL 05/07/10
 Index: beecrypt-4.2.1/configure.ac
 ===================================================================
diff --git a/meta/recipes-support/beecrypt/beecrypt/fix-security.patch b/meta/recipes-support/beecrypt/beecrypt/fix-security.patch
index f28e393..6cb0c00 100644
--- a/meta/recipes-support/beecrypt/beecrypt/fix-security.patch
+++ b/meta/recipes-support/beecrypt/beecrypt/fix-security.patch
@@ -3,6 +3,9 @@ project:
 http://www.mail-archive.com/fink-commits@lists.sourceforge.net/msg75742.html
 
 JL 05/07/10 
+
+Upstream-Status: Pending
+
 Index: beecrypt-4.2.1/include/beecrypt/c++/beeyond/BeeCertificate.h
 ===================================================================
 --- beecrypt-4.2.1.orig/include/beecrypt/c++/beeyond/BeeCertificate.h	2010-11-26 17:22:57.000000000 +0800
-- 
1.7.1



