Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4as-0006iI-Bc
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632917"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:05 -0800
Message-Id: <2bc8cfcc303723f3f62a11dc55044a91e2db6407.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/62] qemuppc: add machconfig
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:38 -0000

From: Liming Wang <liming.wang@windriver.com>

Signed-off-by: Liming Wang <liming.wang@windriver.com>
---
 .../formfactor/files/qemuppc/machconfig            |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100755 meta/recipes-bsp/formfactor/files/qemuppc/machconfig

diff --git a/meta/recipes-bsp/formfactor/files/qemuppc/machconfig b/meta/recipes-bsp/formfactor/files/qemuppc/machconfig
new file mode 100755
index 0000000..5ea2270
--- /dev/null
+++ b/meta/recipes-bsp/formfactor/files/qemuppc/machconfig
@@ -0,0 +1,10 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+ 
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=800
+DISPLAY_HEIGHT_PIXELS=600
+DISPLAY_BPP=16
+DISPLAY_DPI=150
+DISPLAY_SUBPIXEL_ORDER=vrgb
-- 
1.7.6.5



