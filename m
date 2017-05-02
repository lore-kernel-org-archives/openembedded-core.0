Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D5D8771D7E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 12:51:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 May 2017 05:51:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,405,1488873600"; d="scan'208";a="1163544021"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2017 05:51:56 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 May 2017 15:51:47 +0300
Message-Id: <20170502125151.5095-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170502125151.5095-1-alexander.kanavin@linux.intel.com>
References: <20170502125151.5095-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/6] iso-codes: upgrade to 3.75
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
X-List-Received-Date: Tue, 02 May 2017 12:51:56 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../iso-codes/{iso-codes_3.74.bb => iso-codes_3.75.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_3.74.bb => iso-codes_3.75.bb} (76%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.74.bb b/meta/recipes-support/iso-codes/iso-codes_3.75.bb
similarity index 76%
rename from meta/recipes-support/iso-codes/iso-codes_3.74.bb
rename to meta/recipes-support/iso-codes/iso-codes_3.75.bb
index c436a1dd2bc..4f3d53c1736 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.74.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_3.75.bb
@@ -3,8 +3,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
-SRC_URI[md5sum] = "d5448475d087756b78391b8c53c5b83a"
-SRC_URI[sha256sum] = "21f4f3cea8fe09f5b53784522303a0e1e7d083964ecaf1c75b1441d4d9ec6aee"
+SRC_URI[md5sum] = "9ba173b69d4360003414f23837597a92"
+SRC_URI[sha256sum] = "7335e0301cd77cd4ee019bf5d3709aa79309d49dd66e85ba350caf67e00b00cd"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.11.0


