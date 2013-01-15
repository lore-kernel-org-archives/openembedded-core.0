Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TvChU-0007Zc-Se
	for Openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:01:51 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Jan 2013 11:45:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,475,1355126400"; d="scan'208";a="247226249"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by orsmga001.jf.intel.com with ESMTP; 15 Jan 2013 11:45:11 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 11:44:46 -0800
Message-Id: <8738a6efd777d20d444fc9b149ce75498b21202b.1358278958.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1358278958.git.nitin.a.kamble@intel.com>
References: <cover.1358278958.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] xf86-video-modesetting: new recipe for gma500
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
X-List-Received-Date: Tue, 15 Jan 2013 20:01:51 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

I am trying to use gma500 driver for the noemgd BSPs. The current best
xf86 driver for it is modesetting. This recipe provides that
driver.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../xorg-driver/xf86-video-modesetting_0.6.0.bb    |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb
new file mode 100644
index 0000000..407ad1a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
+
+DESCRIPTION = "X.Org X server -- modesetting display driver"
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "d8a771d5d2d75ea9d234c6928153c08b"
+SRC_URI[sha256sum] = "852f9ddb213913f75e1e65ad7ce9c6b5bc7f43a93d8087b6e59666ea4eb3d0d6"
-- 
1.7.3.4



