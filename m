Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E5491771DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 11:01:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 02 Feb 2016 03:01:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,384,1449561600"; d="scan'208";a="894572543"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2016 03:01:26 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 555886A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 03:49:18 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 13:04:11 +0200
Message-Id: <1454411051-15095-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1454411051-15095-1-git-send-email-maxin.john@intel.com>
References: <1454411051-15095-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/3] formfactor: add machconfig for qemumips64 and beaglebone
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
X-List-Received-Date: Tue, 02 Feb 2016 11:01:26 -0000

We need machconfig file to automatically choose between physical and virtual
keyboards.

[YOCTO #9027]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-bsp/formfactor/files/beaglebone/machconfig | 10 ++++++++++
 meta/recipes-bsp/formfactor/files/qemumips64/machconfig | 10 ++++++++++
 2 files changed, 20 insertions(+)
 create mode 100755 meta/recipes-bsp/formfactor/files/beaglebone/machconfig
 create mode 100755 meta/recipes-bsp/formfactor/files/qemumips64/machconfig

diff --git a/meta/recipes-bsp/formfactor/files/beaglebone/machconfig b/meta/recipes-bsp/formfactor/files/beaglebone/machconfig
new file mode 100755
index 0000000..56a2ae2
--- /dev/null
+++ b/meta/recipes-bsp/formfactor/files/beaglebone/machconfig
@@ -0,0 +1,10 @@
+HAVE_TOUCHSCREEN=1
+HAVE_KEYBOARD=1
+ 
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+#DISPLAY_WIDTH_PIXELS=640
+#DISPLAY_HEIGHT_PIXELS=480
+#DISPLAY_BPP=16
+DISPLAY_DPI=150
+DISPLAY_SUBPIXEL_ORDER=vrgb
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


