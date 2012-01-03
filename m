Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrP-0004Y7-10
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752251"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:06 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:58 -0800
Message-Id: <d85485e7e9b44962b578acca5b3abfa4fb43b500.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 072/113] byacc: upgrade from 20110908 to 20111219
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:35 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../byacc/{byacc_20110908.bb => byacc_20111219.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20110908.bb => byacc_20111219.bb} (73%)

diff --git a/meta/recipes-extended/byacc/byacc_20110908.bb b/meta/recipes-extended/byacc/byacc_20111219.bb
similarity index 73%
rename from meta/recipes-extended/byacc/byacc_20110908.bb
rename to meta/recipes-extended/byacc/byacc_20111219.bb
index 5e01c25..4b317c4 100644
--- a/meta/recipes-extended/byacc/byacc_20110908.bb
+++ b/meta/recipes-extended/byacc/byacc_20111219.bb
@@ -1,4 +1,4 @@
-PR = "r1"
+PR = "r0"
 
 # Sigh. This is one of those places where everyone licenses it differently. Someone
 # even apply UCB to it (Free/Net/OpenBSD). The maintainer states that:
@@ -9,5 +9,5 @@ LICENSE="PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=4dc4c30f840a7203fb6edf20b3db849e"
 require byacc.inc
 
-SRC_URI[md5sum] = "5665ee1f2ca482d57eef9591a2fe4768"
-SRC_URI[sha256sum] = "70a3e491ddfae9da04646abe769fa0ecb9cbf003e2a09c5732907e3e8b478fb0"
+SRC_URI[md5sum] = "c17542fd9df6e392d495a64f883e29f1"
+SRC_URI[sha256sum] = "ca37eb3702a02efe4a4dd09e0ef26fc91e4c22c36d8d52e45d2f76923fbd99d9"
-- 
1.7.6.4



