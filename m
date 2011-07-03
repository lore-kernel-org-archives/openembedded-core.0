Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QdMOD-0003GB-Lj
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jul 2011 15:07:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Jul 2011 06:03:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,467,1304319600"; d="scan'208";a="22119738"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by azsmga001.ch.intel.com with ESMTP; 03 Jul 2011 06:03:20 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Jul 2011 21:03:15 +0800
Message-Id: <2dc0c1a80056b1d67298dec8b09ed835b2dd57fe.1309698011.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1309698011.git.ke.yu@intel.com>
References: <cover.1309698011.git.ke.yu@intel.com>
In-Reply-To: <cover.1309698011.git.ke.yu@intel.com>
References: <cover.1309698011.git.ke.yu@intel.com>
Subject: [PATCH 3/5] xauth: upgrade from 1.05 to 1.06
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
X-List-Received-Date: Sun, 03 Jul 2011 13:07:09 -0000

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../xorg-app/{xauth_1.0.5.bb => xauth_1.0.6.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.5.bb => xauth_1.0.6.bb} (68%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.0.5.bb b/meta/recipes-graphics/xorg-app/xauth_1.0.6.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-app/xauth_1.0.5.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.0.6.bb
index 23986ac..f00d30a 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.0.6.bb
@@ -9,5 +9,5 @@ DEPENDS += "libxau libxext libxmu"
 PR = "r0"
 PE = "1"
 
-SRC_URI[md5sum] = "46fc44e5e947d3720f3be5054044ff0e"
-SRC_URI[sha256sum] = "6d139500ff1daf806525adf071f8c1778ad138a0378c73ea831ad18847ad746c"
+SRC_URI[md5sum] = "105f5b00bb9293b3db36f7e500d4f950"
+SRC_URI[sha256sum] = "a686406951f0ed6be45bc26182a1423e2cdffad2d492b33ff3fbf72f7bcb6b0b"
-- 
1.7.0.4



