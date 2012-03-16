Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LUR-0002PO-HB
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:57:55 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 17:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139665548"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 17:49:08 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:46 +0800
Message-Id: <42101986216c91c5f1f6dc3d4801e63dc48d7580.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 49/60] libxft: upgrade to 2.3.0
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
X-List-Received-Date: Fri, 16 Mar 2012 00:57:55 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../xorg-lib/{libxft_2.2.0.bb => libxft_2.3.0.bb}  |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.2.0.bb => libxft_2.3.0.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.0.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
rename to meta/recipes-graphics/xorg-lib/libxft_2.3.0.bb
index 1166e57..73ce9fd 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.0.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=90b90b60eb30f65fc9c2673d7cf59e24"
 DEPENDS += "virtual/libx11 libxrender freetype fontconfig"
 PROVIDES = "xft"
 
-PR = "r3"
+PR = "r0"
 PE = "1"
 
 XORG_PN = "libXft"
@@ -30,5 +30,5 @@ python () {
             d.setVar('PKG_${PN}', '${MLPREFIX}libxft2')
 }
 
-SRC_URI[md5sum] = "cce3c327258116493b753f157e0360c7"
-SRC_URI[sha256sum] = "c8685ae56da0c1dcc2bc1e34607e7d76ae98b86a1a71baba3a6b76dbcf5ff9b2"
+SRC_URI[md5sum] = "bd0a8d8cace1dfbb963250bf3eb9a19a"
+SRC_URI[sha256sum] = "3426393ad72a5c47006536d474e396c7a21c33131bb28f495578e05a5858b044"
-- 
1.7.6



