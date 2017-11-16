Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BE15578780
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 15:55:37 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 07:55:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,404,1505804400"; d="scan'208";a="174302945"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 16 Nov 2017 07:55:38 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 2CE5B5800A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 07:55:37 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 17:56:06 +0200
Message-Id: <1510847767-2966-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] libogg: upgrade to 1.3.3
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
X-List-Received-Date: Thu, 16 Nov 2017 15:55:37 -0000

1.3.2 -> 1.3.3

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-multimedia/libogg/{libogg_1.3.2.bb => libogg_1.3.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libogg/{libogg_1.3.2.bb => libogg_1.3.3.bb} (80%)

diff --git a/meta/recipes-multimedia/libogg/libogg_1.3.2.bb b/meta/recipes-multimedia/libogg/libogg_1.3.3.bb
similarity index 80%
rename from meta/recipes-multimedia/libogg/libogg_1.3.2.bb
rename to meta/recipes-multimedia/libogg/libogg_1.3.3.bb
index 0142e0f..8d88f1f 100644
--- a/meta/recipes-multimedia/libogg/libogg_1.3.2.bb
+++ b/meta/recipes-multimedia/libogg/libogg_1.3.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
 
 SRC_URI = "http://downloads.xiph.org/releases/ogg/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "5c3a34309d8b98640827e5d0991a4015"
-SRC_URI[sha256sum] = "3f687ccdd5ac8b52d76328fbbfebc70c459a40ea891dbf3dccb74a210826e79b"
+SRC_URI[md5sum] = "87ed742047f065046eb6c36745d871b8"
+SRC_URI[sha256sum] = "4f3fc6178a533d392064f14776b23c397ed4b9f48f5de297aba73b643f955c08"
 
 inherit autotools pkgconfig
-- 
2.4.0


