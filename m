Return-Path: <jussi.kukkonen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3FFC8772B4
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 10:42:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 24 Jan 2017 02:42:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="1117055525"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2017 02:42:34 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id B83976A4006;
	Tue, 24 Jan 2017 02:41:36 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 12:42:21 +0200
Message-Id: <0b143405284ce48b44362d210264cb9398305a58.1485249527.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485249527.git.jussi.kukkonen@intel.com>
References: <cover.1485249527.git.jussi.kukkonen@intel.com>
Subject: [PATCH 8/9] xf86-input-evdev: Upgrade 2.10.4 -> 2.10.5
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
X-List-Received-Date: Tue, 24 Jan 2017 10:42:34 -0000

Small release with bug fixes and config improvements.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-evdev_2.10.4.bb => xf86-input-evdev_2.10.5.bb}       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.10.4.bb => xf86-input-evdev_2.10.5.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.4.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.5.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.4.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.5.bb
index c660a1d..96b220c 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.4.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.5.bb
@@ -16,5 +16,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
 
 DEPENDS += "mtdev libevdev"
 
-SRC_URI[md5sum] = "0f209d13b39427c1a6d38d70059b1e8f"
-SRC_URI[sha256sum] = "bbf6a03fbce1a6c0c7d874eef519fd0a854bf01b515c745d41fa551ce6490cc2"
+SRC_URI[md5sum] = "94c2c8354c74ab1cfbbb0a222078b9c6"
+SRC_URI[sha256sum] = "9edaa6205baf6d2922cc4db3d8e54a7e7773b5f733b0ae90f6be7725f983b70d"
+
-- 
2.1.4


