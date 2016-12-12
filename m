Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E601265CC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:12:04 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP; 12 Dec 2016 02:12:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,334,1477983600"; d="scan'208";a="41515431"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 02:12:06 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id D40A36A4006;
	Mon, 12 Dec 2016 02:11:18 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 12:11:45 +0200
Message-Id: <0223516e6f253e442a6f9d4401125ccec93190e7.1481536730.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481536730.git.jussi.kukkonen@intel.com>
References: <cover.1481536730.git.jussi.kukkonen@intel.com>
Subject: [PATCH 08/12] xf86-input-synaptics: Upgrade 1.8.3 -> 1.9.0
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
X-List-Received-Date: Mon, 12 Dec 2016 10:12:05 -0000

Bug fixes, new hw support, support for XINPUT ABI 23.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-synaptics_1.8.3.bb => xf86-input-synaptics_1.9.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.8.3.bb => xf86-input-synaptics_1.9.0.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.3.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.0.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.3.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.0.bb
index b47c82c..d327a3b 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.0.bb
@@ -10,7 +10,7 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 
-SRC_URI[md5sum] = "4e3c8bed1ab4a67db2160c2c3d7e2a34"
-SRC_URI[sha256sum] = "d39f100c74f3673778b53f17bab7690161925e25dd998a15dd8cc69b52e83f01"
+SRC_URI[md5sum] = "58e5b7722a402114093bf193962d1e3a"
+SRC_URI[sha256sum] = "afba3289d7a40217a19d90db98ce181772f9ca6d77e1898727b0afcf02073b5a"
 
 DEPENDS += "libxi mtdev libxtst libevdev"
-- 
2.1.4


