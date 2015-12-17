Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AE220731CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875740031"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:36 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:51 +0200
Message-Id: <c38a1e246e584164bdd0c69a571a938610be64ff.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/17] iso-codes: update to 3.63
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:36 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../iso-codes/{iso-codes_3.58.bb => iso-codes_3.63.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_3.58.bb => iso-codes_3.63.bb} (76%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.58.bb b/meta/recipes-support/iso-codes/iso-codes_3.63.bb
similarity index 76%
rename from meta/recipes-support/iso-codes/iso-codes_3.58.bb
rename to meta/recipes-support/iso-codes/iso-codes_3.63.bb
index 7112e46..8ae8a43 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.58.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_3.63.bb
@@ -3,8 +3,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fbc093901857fcd118f065f900982c24"
 
 SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
-SRC_URI[md5sum] = "34097a0085f0979e28f9db66ec274c5e"
-SRC_URI[sha256sum] = "86af5735dce6e4eff2b983e5d8aa9a3dea1b8db702333ff20be89e45f7f35a72"
+SRC_URI[md5sum] = "129f822fd64c9bf80931cccc269ccb95"
+SRC_URI[sha256sum] = "60600e56952dc92b3a8cd8a7044348f7cfa35be528bab2491c3c18582fb5277f"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.6.2


