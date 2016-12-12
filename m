Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3966771A77
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:12:05 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 12 Dec 2016 02:12:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,334,1477983600"; d="scan'208";a="39182200"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 12 Dec 2016 02:12:07 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 26EF26A4006;
	Mon, 12 Dec 2016 02:11:19 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 12:11:46 +0200
Message-Id: <2eecbbcb775624019c7ae6b94907d01044483cd8.1481536730.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481536730.git.jussi.kukkonen@intel.com>
References: <cover.1481536730.git.jussi.kukkonen@intel.com>
Subject: [PATCH 09/12] xf86-input-synaptics: Remove git recipe
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
X-List-Received-Date: Mon, 12 Dec 2016 10:12:06 -0000

Last source revision is from 8 years ago.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-driver/xf86-input-synaptics_git.bb            | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
deleted file mode 100644
index 140f633..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xorg-driver-input.inc
-
-SUMMARY = "X.Org X server -- synaptics touchpad input driver"
-
-DESCRIPTION = "synaptics is an Xorg input driver for the touchpads from \
-Synaptics Incorporated. Even though these touchpads (by default, \
-operating in a compatibility mode emulating a standard mouse) can be \
-handled by the normal evdev or mouse drivers, this driver allows more \
-advanced features of the touchpad to become available."
-
-SRCREV = "934bc0012f948c52aadc8eda912f7728fb7394a2"
-PV = "0.15.2+git${SRCPV}"
-PR = "${INC_PR}.1"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-synaptics"
-S = "${WORKDIR}/git"
-
-DEPENDS += "libxi mtdev libxtst"
-- 
2.1.4


