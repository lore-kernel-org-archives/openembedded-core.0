Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DA0B77253D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 17:23:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 29 Dec 2014 09:21:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,659,1413270000"; d="scan'208";a="654543751"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.155])
	by fmsmga002.fm.intel.com with ESMTP; 29 Dec 2014 09:23:35 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Dec 2014 11:24:07 -0600
Message-Id: <df47ba5837e1df876d6caad6e4b61a2477dc0ab6.1419873753.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419873753.git.anibal.limon@linux.intel.com>
References: <cover.1419873753.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] xrandr: Upgrade to 1.4.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Dec 2014 17:23:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-graphics/xorg-app/{xrandr_1.4.2.bb => xrandr_1.4.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.4.2.bb => xrandr_1.4.3.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.4.2.bb b/meta/recipes-graphics/xorg-app/xrandr_1.4.3.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-app/xrandr_1.4.2.bb
rename to meta/recipes-graphics/xorg-app/xrandr_1.4.3.bb
index 84f01b0..41bd420 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.4.2.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.4.3.bb
@@ -11,5 +11,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fe1608bdb33cf8c62a4438f7d34679b3"
 DEPENDS += "libxrandr libxrender"
 PE = "1"
 
-SRC_URI[md5sum] = "78fd973d9b532106f8777a3449176148"
-SRC_URI[sha256sum] = "b2e76ee92ff827f1c52ded7c666fe6f2704ca81cdeef882397da4e3e8ab490bc"
+SRC_URI[md5sum] = "441fdb98d2abc6051108b7075d948fc7"
+SRC_URI[sha256sum] = "7154ac3486b86923692f2d6cdb2991a2ee72bc32af2c4379a6f1c068f204be1b"
-- 
1.9.1


