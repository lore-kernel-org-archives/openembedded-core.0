Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8Lal-0003Eb-NI
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 02:04:28 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 17:55:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139668118"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 17:55:39 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:55 +0800
Message-Id: <aab829a02a5688a86bf6dfcaf21029ad4674cb73.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 58/60] libxi: upgrade to 1.4.5
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
X-List-Received-Date: Fri, 16 Mar 2012 01:04:28 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../xorg-lib/{libxi_1.4.3.bb => libxi_1.4.5.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.4.3.bb => libxi_1.4.5.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.4.3.bb b/meta/recipes-graphics/xorg-lib/libxi_1.4.5.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/libxi_1.4.3.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.4.5.bb
index 80a01fc..214d1ca 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.4.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.4.5.bb
@@ -20,5 +20,5 @@ XORG_PN = "libXi"
 
 EXTRA_OECONF_append = " --enable-specs=no"
 
-SRC_URI[md5sum] = "792e8a7ddc7175911d69f823d38eaff6"
-SRC_URI[sha256sum] = "08c9d89a404740592621e6f5078414df86ccc78ca876e3da1af15639d81c74e0"
+SRC_URI[md5sum] = "82dcdc76388116800a2c3ad969f510a4"
+SRC_URI[sha256sum] = "22a99123229d22e6e1567c4cda0224a744475f427625d61b23d965157a86f1b5"
-- 
1.7.6



