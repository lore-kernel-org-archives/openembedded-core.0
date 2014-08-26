Return-Path: <max.eliaser@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 302CA710D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 17:36:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Aug 2014 10:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,405,1406617200"; d="scan'208";a="593594930"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.68])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2014 10:36:54 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 10:34:10 -0700
Message-Id: <2d9025b17efef76fa87c8e63d336189a880dac64.1409074419.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1409074419.git.max.eliaser@intel.com>
References: <cover.1409074419.git.max.eliaser@intel.com>
In-Reply-To: <cover.1409074419.git.max.eliaser@intel.com>
References: <cover.1409074419.git.max.eliaser@intel.com>
Subject: [PATCH 2/5] qemux86: xorg.conf: allow X.Org driver to be selected automatically.
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
X-List-Received-Date: Tue, 26 Aug 2014 17:36:59 -0000

A section specifying the driver to use is deleted from the image's xorg.conf,
allowing the X server to automatically select the most appropriate driver.
Testing shows that it does always pick the correct one.

Signed-off-by: Max Eliaser <max.eliaser@intel.com>
---
 .../xorg-xserver/xserver-xf86-config/qemux86/xorg.conf               | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
index 10a6d9a..bbda9ea 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
@@ -30,11 +30,6 @@ Section "InputDevice"
     Option        "USB"           "on"
 EndSection
 
-Section "Device"
-    Identifier    "Graphics Controller"
-    Driver        "vmware"
-EndSection
-
 Section "Monitor"
     Identifier    "Generic Monitor"
     Option        "DPMS"
-- 
1.8.3.2


