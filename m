Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LO4-0001xm-Ux
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:51:21 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 17:42:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129566848"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2012 17:42:32 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:32 +0800
Message-Id: <9c8717da7a330dd5506778f5bf971cace3447ff1.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 35/60] libice: upgrade to 1.0.8
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
X-List-Received-Date: Fri, 16 Mar 2012 00:51:21 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../xorg-lib/{libice_1.0.7.bb => libice_1.0.8.bb}  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libice_1.0.7.bb => libice_1.0.8.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libice_1.0.7.bb b/meta/recipes-graphics/xorg-lib/libice_1.0.8.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libice_1.0.7.bb
rename to meta/recipes-graphics/xorg-lib/libice_1.0.8.bb
index 0a906d8..43c8336 100644
--- a/meta/recipes-graphics/xorg-lib/libice_1.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libice_1.0.8.bb
@@ -21,5 +21,5 @@ XORG_PN = "libICE"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "bb72a732b15e9dc25c3036559387eed5"
-SRC_URI[sha256sum] = "a8b1692f151a473cee8733df9aefe98f7e5f64dfe6d4213cb6231d7bf855b901"
+SRC_URI[md5sum] = "471b5ca9f5562ac0d6eac7a0bf650738"
+SRC_URI[sha256sum] = "24a991284d02ff0c789bc8d11ad2e4dffe144cb70f24e28f9ce3e8b1ee08b71e"
-- 
1.7.6



