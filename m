Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Su1Eu-00087O-R6
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 15:02:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jul 2012 05:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171214697"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.26])
	by orsmga001.jf.intel.com with ESMTP; 25 Jul 2012 05:51:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 13:51:23 +0100
Message-Id: <1343220683-9012-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] meta/lib: remove test.py
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
X-List-Received-Date: Wed, 25 Jul 2012 13:02:57 -0000

This looks like it was added by accident in OE-Core revision
7903433898b4683a1c09cc9a6a379421bc9bbd58.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/test.py |    3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 meta/lib/test.py

diff --git a/meta/lib/test.py b/meta/lib/test.py
deleted file mode 100644
index 12f4d83..0000000
--- a/meta/lib/test.py
+++ /dev/null
@@ -1,3 +0,0 @@
-import oe.license
-
-print(oe.license.is_included('LGPLv2.1 | GPLv3', ['*'], []))
-- 
1.7.9.5



