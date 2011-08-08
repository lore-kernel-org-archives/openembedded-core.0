Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QqKSb-0003Hm-Bz
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 09:41:17 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Aug 2011 00:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,336,1309762800"; 
   d="scan'208";a="5003951"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Aug 2011 00:36:48 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2011 15:35:38 +0800
Message-Id: <9e9fc650a0e3d3a87601db920e3e71ba52078e44.1312788761.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1312788761.git.dongxiao.xu@intel.com>
References: <cover.1312788761.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1312788761.git.dongxiao.xu@intel.com>
References: <cover.1312788761.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/2] module-init-tools-cross: Clean the RDEPENDS value
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
X-List-Received-Date: Mon, 08 Aug 2011 07:41:17 -0000

cross recipes should not RDEPENDS on any package. Cross recipe has no
"PACKAGES" define, thus clean RDEPENDS_${PN} value to ensure correctness
in multilib.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../module-init-tools-cross_3.16.bb                |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
index a6c5d21..dee163d 100644
--- a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
+++ b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
@@ -2,6 +2,7 @@ require module-init-tools.inc
 PR = "r0"
 inherit cross
 PROVIDES += "virtual/${TARGET_PREFIX}depmod"
+RDEPENDS_${PN} = ""
 
 SRC_URI[md5sum] = "bc44832c6e41707b8447e2847d2019f5"
 SRC_URI[sha256sum] = "e1f2cdcae64a8effc25e545a5e0bdaf312f816ebbcd0916e4e87450755fab64b"
-- 
1.7.1



