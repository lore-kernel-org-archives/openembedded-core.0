Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 59798772E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:44:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:44:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686950"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:44:08 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:47:00 +0200
Message-Id: <a3f87d9e5c1f78040ed03a47eef493713c79c603.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 15/19] xf86-input-synaptics: Upgrade 1.8.2 -> 1.8.3
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
X-List-Received-Date: Fri, 13 Nov 2015 09:44:08 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-synaptics_1.8.2.bb => xf86-input-synaptics_1.8.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.8.2.bb => xf86-input-synaptics_1.8.3.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.3.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.2.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.3.bb
index 32db25b..b47c82c 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.3.bb
@@ -10,7 +10,7 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 
-SRC_URI[md5sum] = "8ed68e8cc674dd61adb280704764aafb"
-SRC_URI[sha256sum] = "7b0e164ebd02a680e0c695955e783059f37edb0c2656398e0a972adc8e698c80"
+SRC_URI[md5sum] = "4e3c8bed1ab4a67db2160c2c3d7e2a34"
+SRC_URI[sha256sum] = "d39f100c74f3673778b53f17bab7690161925e25dd998a15dd8cc69b52e83f01"
 
 DEPENDS += "libxi mtdev libxtst libevdev"
-- 
2.1.4


