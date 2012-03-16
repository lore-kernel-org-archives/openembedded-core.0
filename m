Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LRO-0002AS-Av
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:54:46 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Mar 2012 17:45:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129567613"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2012 17:45:51 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:40 +0800
Message-Id: <74e0d4809d5ca3a86496e0ba3322b8f784a722ab.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 43/60] libxt: upgrade to 1.1.2
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
X-List-Received-Date: Fri, 16 Mar 2012 00:54:46 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../xorg-lib/{libxt_1.1.1.bb => libxt_1.1.2.bb}    |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxt_1.1.1.bb => libxt_1.1.2.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.1.1.bb b/meta/recipes-graphics/xorg-lib/libxt_1.1.2.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-lib/libxt_1.1.1.bb
rename to meta/recipes-graphics/xorg-lib/libxt_1.1.2.bb
index 5475fc7..04fd59d 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.1.2.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3239170e81427c5948287df07691f03f"
 DEPENDS += "util-linux libxcb libsm virtual/libx11 kbproto libxdmcp"
 PROVIDES = "xt"
 
-PR = "r1"
+PR = "r0"
 PE = "1"
 
 XORG_PN = "libXt"
@@ -41,5 +41,5 @@ do_compile() {
 	oe_runmake
 }
 
-SRC_URI[md5sum] = "eb22c0a1f172b06b97a3f5ae89768412"
-SRC_URI[sha256sum] = "a2a1c29c684e3c9082cdb920b5aea802b179d19107b9ab2170fda07575559da7"
+SRC_URI[md5sum] = "c4f7f149559320f378d93b835d38ad6f"
+SRC_URI[sha256sum] = "f041a7802b13630348072f5a609e0cc0e3df2382c0ddaae41d2769422eacc347"
-- 
1.7.6



