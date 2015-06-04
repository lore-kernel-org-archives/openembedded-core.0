Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 78601757EB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 10:44:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jun 2015 03:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,552,1427785200"; d="scan'208";a="720634381"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2015 03:44:02 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 13:44:18 +0300
Message-Id: <0a56ca40b060ecb7d1c42ca1272b8351c024023b.1433414236.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <4168ccc0ec9736fcb82ae9273e46e38df46b778e.1433414236.git.jussi.kukkonen@intel.com>
References: <4168ccc0ec9736fcb82ae9273e46e38df46b778e.1433414236.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1433414236.git.jussi.kukkonen@intel.com>
References: <cover.1433414236.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/6] xf86-input-keyboard: Upgrade 1.8.0 -> 1.8.1
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
X-List-Received-Date: Thu, 04 Jun 2015 10:44:21 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-keyboard_1.8.0.bb => xf86-input-keyboard_1.8.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-keyboard_1.8.0.bb => xf86-input-keyboard_1.8.1.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.8.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.8.1.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.8.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.8.1.bb
index f138918..6fe51ac 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.8.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-keyboard_1.8.1.bb
@@ -9,5 +9,5 @@ core keyboard."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea2099d24ac9e316a6d4b9f20b3d4e10"
 
-SRC_URI[md5sum] = "ce936e219682bacf5a4a9c4ab940edb8"
-SRC_URI[sha256sum] = "41c51c4e0a87aad6a1c4973c68a8de23b61162d0223f4ab36c627c307830cb5b"
+SRC_URI[md5sum] = "96ccc43d389b970afbd3893875dfd678"
+SRC_URI[sha256sum] = "1ac8ff39bf9da7d2fc7fd6c24515726e8138340c0518ab8c606e008cf93ca211"
-- 
2.1.4


