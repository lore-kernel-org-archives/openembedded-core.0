Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E67A671A8F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:12:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 Dec 2016 02:11:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,334,1477983600"; d="scan'208";a="796999454"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Dec 2016 02:11:59 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 6EF806A4006;
	Mon, 12 Dec 2016 02:11:12 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 12:11:40 +0200
Message-Id: <fdf881c954a5066b2a97f90ee5d625bc1e6c1818.1481536730.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481536730.git.jussi.kukkonen@intel.com>
References: <cover.1481536730.git.jussi.kukkonen@intel.com>
Subject: [PATCH 03/12] xf86-input-evdev: Upgrade 2.10.3 -> 2.10.4
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
X-List-Received-Date: Mon, 12 Dec 2016 10:12:08 -0000

Tiny update to XINPUT ABI 24.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-evdev_2.10.3.bb => xf86-input-evdev_2.10.4.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.10.3.bb => xf86-input-evdev_2.10.4.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.3.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.4.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.3.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.4.bb
index f81c3ec..c660a1d 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.4.bb
@@ -16,5 +16,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
 
 DEPENDS += "mtdev libevdev"
 
-SRC_URI[md5sum] = "aa3363ce5061d0c4d1e7f7019b99716d"
-SRC_URI[sha256sum] = "5aa21ba4be8df927e5676a99c7f4f0343abc089f5451b7e73e39536f29b332a2"
+SRC_URI[md5sum] = "0f209d13b39427c1a6d38d70059b1e8f"
+SRC_URI[sha256sum] = "bbf6a03fbce1a6c0c7d874eef519fd0a854bf01b515c745d41fa551ce6490cc2"
-- 
2.1.4


