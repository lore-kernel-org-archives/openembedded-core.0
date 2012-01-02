Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RholI-0008H9-8R
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 21:45:40 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jan 2012 12:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108039306"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jan 2012 12:38:15 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 12:37:58 -0800
Message-Id: <da10bf059752328feae76bf62e14849ddd9d6765.1325536389.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
References: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325536389.git.nitin.a.kamble@intel.com>
References: <cover.1325536389.git.nitin.a.kamble@intel.com>
Subject: [PATCH v2 02/15] byacc: upgrade from 20110908 to 20111219
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
X-List-Received-Date: Mon, 02 Jan 2012 20:45:40 -0000

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



