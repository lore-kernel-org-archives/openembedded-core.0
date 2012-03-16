Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8Lb1-0003J9-5a
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 02:04:43 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Mar 2012 17:55:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129570044"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2012 17:55:37 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:54 +0800
Message-Id: <b0132579c7f6f0b20628f113dc7ad50657007537.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 57/60] libxcb: upgrade to 1.8.1
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
X-List-Received-Date: Fri, 16 Mar 2012 01:04:43 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../xcb/{libxcb_1.8.bb => libxcb_1.8.1.bb}         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xcb/{libxcb_1.8.bb => libxcb_1.8.1.bb} (59%)

diff --git a/meta/recipes-graphics/xcb/libxcb_1.8.bb b/meta/recipes-graphics/xcb/libxcb_1.8.1.bb
similarity index 59%
rename from meta/recipes-graphics/xcb/libxcb_1.8.bb
rename to meta/recipes-graphics/xcb/libxcb_1.8.1.bb
index fbf90c2..1f39ca0 100644
--- a/meta/recipes-graphics/xcb/libxcb_1.8.bb
+++ b/meta/recipes-graphics/xcb/libxcb_1.8.1.bb
@@ -9,5 +9,5 @@ DEPENDS += "libpthread-stubs xcb-proto-native libxdmcp"
 
 PACKAGES =+ "libxcb-xinerama"
 
-SRC_URI[md5sum] = "eba59a8887ba6dbaa4cf337766f8d19d"
-SRC_URI[sha256sum] = "25c3600bec104c5aa6e9f559bfe0011b0e223bde726b849b58f758c2d4e6fc5e"
+SRC_URI[md5sum] = "9da03df9e2f4c048202920d9f6a7e123"
+SRC_URI[sha256sum] = "d2f46811e950710e7e79e45615d24f2c7ec318b9de9dc717972723da58bffa0d"
-- 
1.7.6



