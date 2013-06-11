Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D48506A9C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:39:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2013 06:37:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,845,1363158000"; d="scan'208";a="327680039"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2013 06:39:39 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 16:39:28 +0300
Message-Id: <7dac391aa44b346c728f3c8a32f61f2e2d5699f1.1370956136.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1370956136.git.laurentiu.palcu@intel.com>
References: <cover.1370956136.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1370956136.git.laurentiu.palcu@intel.com>
References: <cover.1370956136.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/7] xf86-input-synaptics: upgrade to 1.7.1
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
X-List-Received-Date: Tue, 11 Jun 2013 13:39:39 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...tics_1.7.0.bb => xf86-input-synaptics_1.7.1.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.7.0.bb => xf86-input-synaptics_1.7.1.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb
index 72b4107..9125613 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb
@@ -12,8 +12,8 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 
-SRC_URI[md5sum] = "5e4f232a18a1741e4c34895d28238f8d"
-SRC_URI[sha256sum] = "d6f1ad0b0653dddbe2e2db7e2f06c1860e491045e87a6577b63568d65e5d0f0e"
+SRC_URI[md5sum] = "6505de717972b6a24b8eb13e69eb996c"
+SRC_URI[sha256sum] = "db5825660e1fb23190697f609bf75d4450fe707344a14298e1c9b47039bbb58e"
 
 DEPENDS += "libxi mtdev"
 
-- 
1.7.9.5


