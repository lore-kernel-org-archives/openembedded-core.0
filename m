Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DE2BF6098F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 15:51:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Jun 2013 08:50:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,881,1363158000"; d="scan'208";a="330949551"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.47])
	by orsmga001.jf.intel.com with ESMTP; 17 Jun 2013 08:50:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2013 16:50:51 +0100
Message-Id: <1371484251-2328-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] pseudo: drop version 1.4.5 recipe
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
X-List-Received-Date: Mon, 17 Jun 2013 15:51:19 -0000

We've been using 1.5.1 for a while now with success, so in line with the
OE-Core policy of avoiding multiple versions of the same recipe let's
drop this version.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_1.4.5.bb | 8 --------
 1 file changed, 8 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.5.bb

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.5.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.5.bb
deleted file mode 100644
index e99974f..0000000
--- a/meta/recipes-devtools/pseudo/pseudo_1.4.5.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require pseudo.inc
-
-PR = "r0"
-
-SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "1b8677f7730bd4c51daab7727c35123e"
-SRC_URI[sha256sum] = "e36360e4899467ac842fece894177cb50207671a90e0567ffc74c144fa377f51"
-- 
1.8.1.2


