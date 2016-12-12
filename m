Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4EEA971A8D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:12:08 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP; 12 Dec 2016 02:12:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,334,1477983600"; d="scan'208";a="41586260"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 12 Dec 2016 02:12:01 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id B4D1B6A4006;
	Mon, 12 Dec 2016 02:11:13 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 12:11:41 +0200
Message-Id: <dac3a47f1639f9598d44cbe9d39582bc7ada0f6c.1481536730.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481536730.git.jussi.kukkonen@intel.com>
References: <cover.1481536730.git.jussi.kukkonen@intel.com>
Subject: [PATCH 04/12] xf86-input-keyboard: Upgrade 1.8.1 -> 1.9.0
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
X-List-Received-Date: Mon, 12 Dec 2016 10:12:08 -0000

Small update with ABI 23 support.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-keyboard_1.8.1.bb => xf86-input-keyboard_1.9.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.8.1.bb => xf86-input-keyboard_1.9.0.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.8.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.8.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb
index 6fe51ac..1896fff 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.8.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.9.0.bb
@@ -9,5 +9,5 @@ core keyboard."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea2099d24ac9e316a6d4b9f20b3d4e10"
 
-SRC_URI[md5sum] = "96ccc43d389b970afbd3893875dfd678"
-SRC_URI[sha256sum] = "1ac8ff39bf9da7d2fc7fd6c24515726e8138340c0518ab8c606e008cf93ca211"
+SRC_URI[md5sum] = "a3a3f0dd32361dcdbd406e894dafe090"
+SRC_URI[sha256sum] = "f7c900f21752683402992b288d5a2826de7a6c0c0abac2aadd7e8a409e170388"
-- 
2.1.4


