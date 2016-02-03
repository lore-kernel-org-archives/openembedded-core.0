Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 311A577358
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 16:34:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Feb 2016 08:34:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,391,1449561600"; d="scan'208";a="876169892"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 03 Feb 2016 08:34:12 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 83FF86A4004
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 09:22:04 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 18:37:10 +0200
Message-Id: <1454517430-22305-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v3] formfactor: add machconfig for qemumips64
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
X-List-Received-Date: Wed, 03 Feb 2016 16:34:12 -0000

We need machconfig file to automatically choose between physical and virtual
keyboards.

[YOCTO #9027]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-bsp/formfactor/files/qemumips64/machconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100755 meta/recipes-bsp/formfactor/files/qemumips64/machconfig

diff --git a/meta/recipes-bsp/formfactor/files/qemumips64/machconfig b/meta/recipes-bsp/formfactor/files/qemumips64/machconfig
new file mode 100755
index 0000000..56777b6
--- /dev/null
+++ b/meta/recipes-bsp/formfactor/files/qemumips64/machconfig
@@ -0,0 +1,10 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+ 
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=640
+DISPLAY_HEIGHT_PIXELS=480
+DISPLAY_BPP=16
+DISPLAY_DPI=150
+#DISPLAY_SUBPIXEL_ORDER=vrgb
-- 
2.4.0


