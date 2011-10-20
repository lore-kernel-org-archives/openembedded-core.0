Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGnUv-0002o6-Iw
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 09:57:05 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 00:51:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64982225"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 00:51:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 00:50:55 -0700
Message-Id: <e2c6e26d665f9e8d8ae8d347b7092a375fd4c599.1319096633.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL - v2 19/26] ccache: update to 3.1.6
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
X-List-Received-Date: Thu, 20 Oct 2011 07:57:06 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

Update ccache to 3.1.6 from 3.1.5.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../ccache/{ccache_3.1.5.bb => ccache_3.1.6.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.1.5.bb => ccache_3.1.6.bb} (47%)

diff --git a/meta/recipes-devtools/ccache/ccache_3.1.5.bb b/meta/recipes-devtools/ccache/ccache_3.1.6.bb
similarity index 47%
rename from meta/recipes-devtools/ccache/ccache_3.1.5.bb
rename to meta/recipes-devtools/ccache/ccache_3.1.6.bb
index 9a967b2..e87468a 100644
--- a/meta/recipes-devtools/ccache/ccache_3.1.5.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.1.6.bb
@@ -4,5 +4,5 @@ PR = "r0"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e92ec45d4fca91f127864fb9e5d932"
 
-SRC_URI[md5sum] = "b1a9684828eae68382d6afc98ce80d24"
-SRC_URI[sha256sum] = "54afc35c672ce451e04a478cfc0eb74c1ba184e27ef24881206602aa0eb94d63"
+SRC_URI[md5sum] = "e6565e7d6c95d1e35b7a0d67e39901e8"
+SRC_URI[sha256sum] = "59f58bb73f00db5bbff36b8eb530d3000c86b3110e34cf8dba9e2a5d19eb684f"
-- 
1.7.6.2



