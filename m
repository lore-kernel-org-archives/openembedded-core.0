Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RVl0I-0000H4-2H
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 15:19:19 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Nov 2011 06:12:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,597,1315206000"; d="scan'208";a="96985613"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2011 06:12:32 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 22:12:27 +0800
Message-Id: <142f11d52e4134d5faada1da16f21bd855f98095.1322662245.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322662245.git.dexuan.cui@intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
Subject: [PATCH 1/8] pixman: upgrade from 0.22.0 to the latest stable 0.24.0
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
X-List-Received-Date: Wed, 30 Nov 2011 14:19:20 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{pixman_0.22.0.bb => pixman_0.24.0.bb}         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.22.0.bb => pixman_0.24.0.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.24.0.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.24.0.bb
index 1a33a18..d96fe75 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.24.0.bb
@@ -18,6 +18,6 @@ PR = "r0"
 
 EXTRA_OECONF="--disable-gtk"
 
-SRC_URI[md5sum] = "307fe4d7dc83b1a558c362907097c0d0"
-SRC_URI[sha256sum] = "24a1bce57c36c773f67d48f7f25f80d69a47ef92a67404f1644d94dee156ae2b"
+SRC_URI[md5sum] = "db5ffcd50064421176e8afb7b85fd1a7"
+SRC_URI[sha256sum] = "744e8b36b29ba76bdfe8f7cbc45585fb237533ac8d716a27e306874dcfa1cf44"
 
-- 
1.7.6



