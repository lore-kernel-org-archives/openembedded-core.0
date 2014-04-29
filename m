Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DA6AB61F16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 13:51:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 06:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,951,1389772800"; d="scan'208";a="531596659"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 06:51:07 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 16:29:43 +0300
Message-Id: <7db4f08b91f4cf8cce4064c09c17ae8b220e7225.1398775392.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
Subject: [PATCH 01/12] xf86-input-synaptics: upgrade to 1.7.4
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
X-List-Received-Date: Tue, 29 Apr 2014 13:51:11 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...tics_1.7.3.bb => xf86-input-synaptics_1.7.4.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.7.3.bb => xf86-input-synaptics_1.7.4.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.3.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.4.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.3.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.4.bb
index 89ae45c..8045790 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.4.bb
@@ -12,8 +12,8 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 
-SRC_URI[md5sum] = "74c83e6cb53a0e15bcbe7cc73d63d2a1"
-SRC_URI[sha256sum] = "8b2a972043961195d056b84346317ec42bfa029095c9ee7aaf6deceba12e32d5"
+SRC_URI[md5sum] = "deaa740072c19fef8e2fb1d7787392b7"
+SRC_URI[sha256sum] = "56a2d2df7bd39e29f56102c62f153e023f3e9b2f5e255309d33fab8e81945af7"
 
 DEPENDS += "libxi mtdev libxtst"
 
-- 
1.7.9.5


