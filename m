Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 589DD757DD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 10:44:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jun 2015 03:44:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,552,1427785200"; d="scan'208";a="720634388"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2015 03:44:03 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 13:44:19 +0300
Message-Id: <397c732d829e6818bf3f65998c940b30e595b919.1433414236.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <4168ccc0ec9736fcb82ae9273e46e38df46b778e.1433414236.git.jussi.kukkonen@intel.com>
References: <4168ccc0ec9736fcb82ae9273e46e38df46b778e.1433414236.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1433414236.git.jussi.kukkonen@intel.com>
References: <cover.1433414236.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/6] xf86-input-synaptics: Upgrade 1.8.1 -> 1.8.2
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
X-List-Received-Date: Thu, 04 Jun 2015 10:44:21 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-synaptics_1.8.1.bb => xf86-input-synaptics_1.8.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.8.1.bb => xf86-input-synaptics_1.8.2.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.2.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.2.bb
index 19be77a..19c122f 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.2.bb
@@ -10,8 +10,8 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 
-SRC_URI[md5sum] = "ed70d0cba94262a4008dcef654ab34a9"
-SRC_URI[sha256sum] = "d74fdaf29e9888a2cb494e16d0a9ddb24265c5c765b05392b69c50e84ffbf09a"
+SRC_URI[md5sum] = "8ed68e8cc674dd61adb280704764aafb"
+SRC_URI[sha256sum] = "7b0e164ebd02a680e0c695955e783059f37edb0c2656398e0a972adc8e698c80"
 
 DEPENDS += "libxi mtdev libxtst libevdev"
 
-- 
2.1.4


