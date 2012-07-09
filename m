Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMg-00065B-Of
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:47:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292876"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:47:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:20 -0700
Message-Id: <b71507160c76e1a8fc54593af22a1cb7d3625430.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/41] libxi: upgrade to 1.6.1
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
X-List-Received-Date: Mon, 09 Jul 2012 15:59:11 -0000

From: Laurentiu Palcu <laurentiu.palcu@intel.com>

---
 .../xorg-lib/{libxi_1.4.5.bb => libxi_1.6.1.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.4.5.bb => libxi_1.6.1.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.4.5.bb b/meta/recipes-graphics/xorg-lib/libxi_1.6.1.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/libxi_1.4.5.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.6.1.bb
index 214d1ca..575d130 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.4.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.6.1.bb
@@ -20,5 +20,5 @@ XORG_PN = "libXi"
 
 EXTRA_OECONF_append = " --enable-specs=no"
 
-SRC_URI[md5sum] = "82dcdc76388116800a2c3ad969f510a4"
-SRC_URI[sha256sum] = "22a99123229d22e6e1567c4cda0224a744475f427625d61b23d965157a86f1b5"
+SRC_URI[md5sum] = "78ee882e1ff3b192cf54070bdb19938e"
+SRC_URI[sha256sum] = "f2e3627d7292ec5eff488ab58867fba14a62f06e72a8d3337ab6222c09873109"
-- 
1.7.7.6



