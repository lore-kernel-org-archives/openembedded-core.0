Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LUS-0002PO-8j
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:57:56 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 17:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139665564"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 17:49:10 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:47 +0800
Message-Id: <414cfbb38e9ba03a290509ed14a435e8d2f18ace.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 50/60] libxtst: upgrade to 1.2.1
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
X-List-Received-Date: Fri, 16 Mar 2012 00:57:56 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libxtst_1.2.0.bb => libxtst_1.2.1.bb}         |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.0.bb => libxtst_1.2.1.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.0.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.1.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxtst_1.2.0.bb
rename to meta/recipes-graphics/xorg-lib/libxtst_1.2.1.bb
index 2081f0c..88ba088 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.1.bb
@@ -12,10 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cba677ca25c42ad29ee8ff351b50ece8 \
 
 DEPENDS += "libxext recordproto inputproto libxi"
 PROVIDES = "xtst"
-PR = "r2"
+PR = "r0"
 PE = "1"
 
 XORG_PN = "libXtst"
 
-SRC_URI[md5sum] = "7c592c72da6676f8b0aeec9133b81686"
-SRC_URI[sha256sum] = "7a2e0912b521f6bd8c392189874ba4a3b8168b0bba4c2143e073de53d8e85408"
+SRC_URI[md5sum] = "e8abc5c00c666f551cf26aa53819d592"
+SRC_URI[sha256sum] = "7eea3e66e392aca3f9dad6238198753c28e1c32fa4903cbb7739607a2504e5e0"
-- 
1.7.6



