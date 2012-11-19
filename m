Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TaKXo-000444-Ox
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 07:09:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2012 21:54:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,276,1352102400"; d="scan'208";a="221530208"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga001.jf.intel.com with ESMTP; 18 Nov 2012 21:54:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Nov 2012 21:54:44 -0800
Message-Id: <e93a8e77fa58fa340fd34cec0e827787729718ee.1353304234.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
Subject: [PATCH 11/17] mc: Update to 4.8.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2012 06:09:23 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../mc/{mc_4.8.4.bb => mc_4.8.6.bb}                |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.4.bb => mc_4.8.6.bb} (82%)

diff --git a/meta/recipes-extended/mc/mc_4.8.4.bb b/meta/recipes-extended/mc/mc_4.8.6.bb
similarity index 82%
rename from meta/recipes-extended/mc/mc_4.8.4.bb
rename to meta/recipes-extended/mc/mc_4.8.6.bb
index fc551dd..048b781 100644
--- a/meta/recipes-extended/mc/mc_4.8.4.bb
+++ b/meta/recipes-extended/mc/mc_4.8.6.bb
@@ -10,8 +10,8 @@ PR = "r0"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "a8edb8226cb25869f925ecce043faf1e"
-SRC_URI[sha256sum] = "917f32a6ce0b8e3ec893bb18af73e64c246d79066322041608352623a579234b"
+SRC_URI[md5sum] = "323706aa5e77698bed7b0b6faa7c1530"
+SRC_URI[sha256sum] = "17034d16cf5e86ed15e0f5de95238afb0a8c6069b1f0a29397042451c1b75877"
 
 inherit autotools gettext
 
-- 
1.7.7.6



