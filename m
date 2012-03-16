Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LUS-0002PQ-MW
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:57:56 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121480672"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:49:05 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:43 +0800
Message-Id: <32266c103be623181a85167d48525b1d8710a215.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 46/60] libxscrnsaver: upgrade to 1.2.2
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
 ...bxscrnsaver_1.2.1.bb => libxscrnsaver_1.2.2.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxscrnsaver_1.2.1.bb => libxscrnsaver_1.2.2.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.1.bb b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.1.bb
rename to meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb
index 453c68f..f97fd8f 100644
--- a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.2.bb
@@ -20,5 +20,5 @@ PE = "1"
 
 XORG_PN = "libXScrnSaver"
 
-SRC_URI[md5sum] = "898794bf6812fc9be9bf1bb7aa4d2b08"
-SRC_URI[sha256sum] = "ce3a66e2f6fa85b22280ab9cc1b2a113a2cb0ade9470914c7c3d6ac1d44b259a"
+SRC_URI[md5sum] = "7a773b16165e39e938650bcc9027c1d5"
+SRC_URI[sha256sum] = "8ff1efa7341c7f34bcf9b17c89648d6325ddaae22e3904e091794e0b4426ce1d"
-- 
1.7.6



