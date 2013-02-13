Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5feD-0004Ep-0k
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 17:57:30 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Feb 2013 08:41:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,658,1355126400"; d="scan'208";a="290652953"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2013 08:40:45 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Feb 2013 18:40:34 +0200
Message-Id: <191816050425235321ec9e7c44154c4671ea958c.1360773347.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360773347.git.laurentiu.palcu@intel.com>
References: <cover.1360773347.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360773347.git.laurentiu.palcu@intel.com>
References: <cover.1360773347.git.laurentiu.palcu@intel.com>
Subject: [PATCH 7/7] xev: upgrade to 1.2.1
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
X-List-Received-Date: Wed, 13 Feb 2013 16:57:46 -0000

Licence didn't change, the end line for computing the licence md5sum was
inside the actual code which, eventually changed. Adjust it to the right
line.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-graphics/xorg-app/xev_1.2.0.bb |   12 ------------
 meta/recipes-graphics/xorg-app/xev_1.2.1.bb |   12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-app/xev_1.2.0.bb
 create mode 100644 meta/recipes-graphics/xorg-app/xev_1.2.1.bb

diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.0.bb b/meta/recipes-graphics/xorg-app/xev_1.2.0.bb
deleted file mode 100644
index 5248ea1..0000000
--- a/meta/recipes-graphics/xorg-app/xev_1.2.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xorg-app-common.inc
-LIC_FILES_CHKSUM = "file://xev.c;beginline=1;endline=35;md5=2f39a0038b59269c1e62efae64cfd056"
-DESCRIPTION = "X Event Viewer"
-LICENSE = "MIT"
-PE = "1"
-
-DEPENDS += "libxrandr xproto"
-
-SRC_URI += "file://diet-x11.patch"
-
-SRC_URI[md5sum] = "2727c72f3eba0c23f8f6b2e618d195a2"
-SRC_URI[sha256sum] = "3786a77dab17741d508d5d117a0ff33bb6eabf93e0935388b5f920bfcf2fb38f"
diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.1.bb b/meta/recipes-graphics/xorg-app/xev_1.2.1.bb
new file mode 100644
index 0000000..298910a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.1.bb
@@ -0,0 +1,12 @@
+require xorg-app-common.inc
+LIC_FILES_CHKSUM = "file://xev.c;beginline=1;endline=33;md5=577c99421f1803b891d2c79097ae4682"
+DESCRIPTION = "X Event Viewer"
+LICENSE = "MIT"
+PE = "1"
+
+DEPENDS += "libxrandr xproto"
+
+SRC_URI += "file://diet-x11.patch"
+
+SRC_URI[md5sum] = "5b0a0b6f589441d546da21739fa75634"
+SRC_URI[sha256sum] = "11f17fab097f17d9efc51ea9d0e3140bea3904eb3c486afa7c8c3eedab496243"
-- 
1.7.9.5



