Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 188656E988
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:30:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 07:29:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="450785169"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2014 07:29:46 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 17:29:28 +0200
Message-Id: <3770099d69ae9a68a7c8f416cc4f28fcc0ae767b.1391699953.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
Subject: [PATCH 09/13] xf86-input-synaptics: upgrade to 1.7.3
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
X-List-Received-Date: Thu, 06 Feb 2014 15:30:01 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...tics_1.7.1.bb => xf86-input-synaptics_1.7.3.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.7.1.bb => xf86-input-synaptics_1.7.3.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.3.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.3.bb
index f678e8b..89ae45c 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.3.bb
@@ -12,8 +12,8 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 
-SRC_URI[md5sum] = "6505de717972b6a24b8eb13e69eb996c"
-SRC_URI[sha256sum] = "db5825660e1fb23190697f609bf75d4450fe707344a14298e1c9b47039bbb58e"
+SRC_URI[md5sum] = "74c83e6cb53a0e15bcbe7cc73d63d2a1"
+SRC_URI[sha256sum] = "8b2a972043961195d056b84346317ec42bfa029095c9ee7aaf6deceba12e32d5"
 
 DEPENDS += "libxi mtdev libxtst"
 
-- 
1.7.9.5


