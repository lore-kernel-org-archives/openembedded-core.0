Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 63B3E71A85
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:33 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412261"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:34 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:22 +0200
Message-Id: <5524c897d3b0730a9a8acc9d7dea5c33c0346d23.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/18] iso-codes: update to 3.71
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:33 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../iso-codes/{iso-codes_3.70.bb => iso-codes_3.71.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_3.70.bb => iso-codes_3.71.bb} (76%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.70.bb b/meta/recipes-support/iso-codes/iso-codes_3.71.bb
similarity index 76%
rename from meta/recipes-support/iso-codes/iso-codes_3.70.bb
rename to meta/recipes-support/iso-codes/iso-codes_3.71.bb
index 7edd8b7..6ff7e59 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.70.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_3.71.bb
@@ -3,8 +3,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
-SRC_URI[md5sum] = "c61f8f02eecf978d3710ff594e43ca7e"
-SRC_URI[sha256sum] = "41e2fbaec2ed57e767b94f175d0dcd31b627aeb23b75cd604605a6fb6109d61f"
+SRC_URI[md5sum] = "7401964329590ed5890006614b774651"
+SRC_URI[sha256sum] = "013df6ac35fb0b9e3244c6a4f13a1090d61cb4478f7cd468bbf46be983ba1f74"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.10.2


