Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RgdXb-0001sS-0k
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 15:34:39 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Dec 2011 06:27:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="91550936"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga001.jf.intel.com with ESMTP; 30 Dec 2011 06:27:22 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 22:33:13 +0800
Message-Id: <52275463768fee2368982c3ffb5bfbab2f451f01.1325252646.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
References: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
In-Reply-To: <cover.1325252645.git.shane.wang@intel.com>
References: <cover.1325252645.git.shane.wang@intel.com>
Subject: [PATCH 12/14] watchdog: upgrade to 5.11
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
X-List-Received-Date: Fri, 30 Dec 2011 14:34:39 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../watchdog/{watchdog_5.9.bb => watchdog_5.11.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/watchdog/{watchdog_5.9.bb => watchdog_5.11.bb} (70%)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.9.bb b/meta/recipes-extended/watchdog/watchdog_5.11.bb
similarity index 70%
rename from meta/recipes-extended/watchdog/watchdog_5.9.bb
rename to meta/recipes-extended/watchdog/watchdog_5.11.bb
index 96aa1f0..0b88c1f 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.9.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.11.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8a7258c60a71a2f04b67fb01f495889c"
 
 PR = "r0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog_${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d7cae3c9829f5d9a680764f314234867"
-SRC_URI[sha256sum] = "60d8e9180b8800e1b2386553a9f63a026bddad4997d21790f7c5dde7e77065ec"
+SRC_URI[md5sum] = "02c764219b3bdb2373091cbd67109eb6"
+SRC_URI[sha256sum] = "723a7966e0c3d58e3f4df20943a5c9aa1553381f46aa0dbcf832016756e62792"
 
 inherit autotools
 
-- 
1.7.6



