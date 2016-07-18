Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D3E98731D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 13:35:18 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 18 Jul 2016 06:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,384,1464678000"; d="scan'208";a="848345553"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 18 Jul 2016 06:34:44 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 16:34:31 +0300
Message-Id: <d313976e65be205c48ba1829b25f9ec779a33026.1468848064.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <c67de06959dd87fa6ce214da11cd431c44da056f.1468848064.git.jussi.kukkonen@intel.com>
References: <c67de06959dd87fa6ce214da11cd431c44da056f.1468848064.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468848064.git.jussi.kukkonen@intel.com>
References: <cover.1468848064.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 8/9] xf86-input-evdev: Upgrade 2.10.2 -> 2.10.3
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
X-List-Received-Date: Mon, 18 Jul 2016 13:35:19 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-evdev_2.10.2.bb => xf86-input-evdev_2.10.3.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.10.2.bb => xf86-input-evdev_2.10.3.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.3.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.2.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.3.bb
index 2ea4574..f81c3ec 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.3.bb
@@ -16,5 +16,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
 
 DEPENDS += "mtdev libevdev"
 
-SRC_URI[md5sum] = "452bcc3bcce712b59af363eea94e3392"
-SRC_URI[sha256sum] = "a73a630d41ab90708d929f357e922bfbdb63d553491c5a30ab3e8fb1e35dfe1d"
+SRC_URI[md5sum] = "aa3363ce5061d0c4d1e7f7019b99716d"
+SRC_URI[sha256sum] = "5aa21ba4be8df927e5676a99c7f4f0343abc089f5451b7e73e39536f29b332a2"
-- 
2.1.4


