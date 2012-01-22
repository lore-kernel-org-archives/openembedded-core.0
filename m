Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1fS-0001bL-7N
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 18:57:26 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Jan 2012 09:49:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="101465113"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 22 Jan 2012 09:49:41 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:07 +0800
Message-Id: <8c85b0c040a43949d8bdccfd100a3012b0180b52.1327255445.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 02/18] pixman: upgrade to 0.24.2
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
X-List-Received-Date: Sun, 22 Jan 2012 17:57:26 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{pixman_0.24.0.bb => pixman_0.24.2.bb}         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.24.0.bb => pixman_0.24.2.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.24.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/pixman_0.24.0.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb
index d96fe75..b55e547 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.24.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb
@@ -18,6 +18,6 @@ PR = "r0"
 
 EXTRA_OECONF="--disable-gtk"
 
-SRC_URI[md5sum] = "db5ffcd50064421176e8afb7b85fd1a7"
-SRC_URI[sha256sum] = "744e8b36b29ba76bdfe8f7cbc45585fb237533ac8d716a27e306874dcfa1cf44"
+SRC_URI[md5sum] = "2ce7d12750664d2eebd51bf0a07b6205"
+SRC_URI[sha256sum] = "32f74f3e3c1feea33e6ad3e2fd66cb3eb816805c384b346ea1636a87c9057dbf"
 
-- 
1.7.6



