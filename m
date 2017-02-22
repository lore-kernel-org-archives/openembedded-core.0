Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0267E73144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302218"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:31 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:13 +0200
Message-Id: <982b1817eaaea9ffc91f1a1c0a2e03e3b5354d2e.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/24] iso-codes: update to 3.74
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:31 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../iso-codes/{iso-codes_3.72.bb => iso-codes_3.74.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_3.72.bb => iso-codes_3.74.bb} (76%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.72.bb b/meta/recipes-support/iso-codes/iso-codes_3.74.bb
similarity index 76%
rename from meta/recipes-support/iso-codes/iso-codes_3.72.bb
rename to meta/recipes-support/iso-codes/iso-codes_3.74.bb
index 8fe7ad2512a..c436a1dd2bc 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.72.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_3.74.bb
@@ -3,8 +3,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
-SRC_URI[md5sum] = "423fdab41c2c40555b2edaddd64f129e"
-SRC_URI[sha256sum] = "d0bd4785c3ec564a966c5792a4e15d119bf1c4dda10e2e60ce9107da1acc44c7"
+SRC_URI[md5sum] = "d5448475d087756b78391b8c53c5b83a"
+SRC_URI[sha256sum] = "21f4f3cea8fe09f5b53784522303a0e1e7d083964ecaf1c75b1441d4d9ec6aee"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.11.0


