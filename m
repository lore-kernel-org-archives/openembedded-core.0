Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CA10A65CC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:12:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 12 Dec 2016 02:12:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,334,1477983600"; d="scan'208";a="1071021777"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 12 Dec 2016 02:12:02 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 03CEB6A4006;
	Mon, 12 Dec 2016 02:11:14 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 12:11:42 +0200
Message-Id: <33aede135affa6cd12279dbaa22d8f759ff01bff.1481536730.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481536730.git.jussi.kukkonen@intel.com>
References: <cover.1481536730.git.jussi.kukkonen@intel.com>
Subject: [PATCH 05/12] xf86-input-keyboard: Remove git recipe
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
X-List-Received-Date: Mon, 12 Dec 2016 10:12:00 -0000

Last used revision was from 8 years ago.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-driver/xf86-input-keyboard_git.bb               | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb
deleted file mode 100644
index dfb08f7..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_git.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require xorg-driver-input.inc
-
-SUMMARY = "X.Org X server -- keyboard input driver"
-
-DESCRIPTION = "keyboard is an Xorg input driver for keyboards. The \
-driver supports the standard OS-provided keyboard interface.  The driver \
-functions as a keyboard input device, and may be used as the X server's \
-core keyboard."
-
-SRCREV = "3e28d68b50d291938734e9684b8296ca864f3892"
-PV = "1.3.2+git${SRCPV}"
-PR = "${INC_PR}.0"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-input-keyboard"
-S = "${WORKDIR}/git"
-
-- 
2.1.4


