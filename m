Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E6C1E65CC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:12:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 12 Dec 2016 02:12:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,334,1477983600"; d="scan'208";a="1071021805"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 12 Dec 2016 02:12:04 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 8A7D06A4006;
	Mon, 12 Dec 2016 02:11:17 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 12:11:44 +0200
Message-Id: <466a666b54bc96a4e9fd6685b20dcc8dd8ce03b5.1481536730.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481536730.git.jussi.kukkonen@intel.com>
References: <cover.1481536730.git.jussi.kukkonen@intel.com>
Subject: [PATCH 07/12] xf86-input-mouse: Remove git recipe
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
X-List-Received-Date: Mon, 12 Dec 2016 10:12:03 -0000

Last used revision is from 8 years ago.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-driver/xf86-input-mouse_git.bb                | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
deleted file mode 100644
index d79a2e4..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xorg-driver-input.inc
-
-SUMMARY = "X.Org X server -- mouse input driver"
-
-DESCRIPTION = "mouse is an Xorg input driver for mice. The driver \
-supports most available mouse types and interfaces.  The mouse driver \
-functions as a pointer input device, and may be used as the X server's \
-core pointer. Multiple mice are supported by multiple instances of this \
-driver."
-
-SRCREV = "ea5cfe804e112f320f14ad896c7802d53551d3e6"
-PV = "1.3.0+git${SRCPV}"
-PR = "${INC_PR}.0"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-mouse \
-           file://unbreak.patch"
-S = "${WORKDIR}/git"
-
-- 
2.1.4


