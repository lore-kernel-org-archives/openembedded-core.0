Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1R9Rxy-00027X-Cy
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 03:32:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Sep 2011 18:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,464,1312182000"; d="scan'208";a="57186166"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 29 Sep 2011 18:27:12 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2011 18:27:09 -0700
Message-Id: <b2f1fe26361d2e057a3791d703b7d0047c195dbf.1317344910.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <4320d5ae4fbe881a4a4a761c899069225f6c78ca.1317344910.git.nitin.a.kamble@intel.com>
References: <4320d5ae4fbe881a4a4a761c899069225f6c78ca.1317344910.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1317344910.git.nitin.a.kamble@intel.com>
References: <cover.1317344910.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/4] byacc: upgrade from 20101229 to 20110908
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
X-List-Received-Date: Fri, 30 Sep 2011 01:32:42 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../byacc/{byacc_20101229.bb => byacc_20110908.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20101229.bb => byacc_20110908.bb} (49%)

diff --git a/meta/recipes-extended/byacc/byacc_20101229.bb b/meta/recipes-extended/byacc/byacc_20110908.bb
similarity index 49%
rename from meta/recipes-extended/byacc/byacc_20101229.bb
rename to meta/recipes-extended/byacc/byacc_20110908.bb
index 09e91e6..5969d0a 100644
--- a/meta/recipes-extended/byacc/byacc_20101229.bb
+++ b/meta/recipes-extended/byacc/byacc_20110908.bb
@@ -3,5 +3,5 @@ LICENSE="other-BSD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=4dc4c30f840a7203fb6edf20b3db849e"
 require byacc.inc
 
-SRC_URI[md5sum] = "e359702cda080c15f656a244aab132e5"
-SRC_URI[sha256sum] = "67a5e4c7888bf7921949e38d4fd6eec855ec8b5a60d83f8d6f34eddb6d42a70c"
+SRC_URI[md5sum] = "5665ee1f2ca482d57eef9591a2fe4768"
+SRC_URI[sha256sum] = "70a3e491ddfae9da04646abe769fa0ecb9cbf003e2a09c5732907e3e8b478fb0"
-- 
1.7.4.4



