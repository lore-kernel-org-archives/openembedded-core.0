Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 69238772CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:48:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 04:48:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,351,1477983600"; d="scan'208";a="18480849"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 04:48:40 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:48:04 +0200
Message-Id: <6bc4ea8f3b11c705bf412814687dd9ccca41c006.1481805889.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
References: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/16] iso-codes: update to 3.72
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
X-List-Received-Date: Thu, 15 Dec 2016 12:48:39 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../iso-codes/{iso-codes_3.71.bb => iso-codes_3.72.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_3.71.bb => iso-codes_3.72.bb} (76%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.71.bb b/meta/recipes-support/iso-codes/iso-codes_3.72.bb
similarity index 76%
rename from meta/recipes-support/iso-codes/iso-codes_3.71.bb
rename to meta/recipes-support/iso-codes/iso-codes_3.72.bb
index 6ff7e59..8fe7ad2 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.71.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_3.72.bb
@@ -3,8 +3,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
-SRC_URI[md5sum] = "7401964329590ed5890006614b774651"
-SRC_URI[sha256sum] = "013df6ac35fb0b9e3244c6a4f13a1090d61cb4478f7cd468bbf46be983ba1f74"
+SRC_URI[md5sum] = "423fdab41c2c40555b2edaddd64f129e"
+SRC_URI[sha256sum] = "d0bd4785c3ec564a966c5792a4e15d119bf1c4dda10e2e60ce9107da1acc44c7"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.10.2


