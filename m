Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5932F7671F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:55:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2015 03:55:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,677,1432623600"; d="scan'208";a="768726393"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2015 03:55:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Aug 2015 13:55:33 +0300
Message-Id: <80555cc2f9b31fa35033c18b84d54041ff420167.1439549437.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
References: <cover.1439549437.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/22] iso-codes: add a recipe from meta-oe
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
X-List-Received-Date: Fri, 14 Aug 2015 10:55:12 -0000

iso-codes is a dependency of epiphany

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/iso-codes/iso-codes_3.58.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-support/iso-codes/iso-codes_3.58.bb

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.58.bb b/meta/recipes-support/iso-codes/iso-codes_3.58.bb
new file mode 100644
index 0000000..3df2ea9
--- /dev/null
+++ b/meta/recipes-support/iso-codes/iso-codes_3.58.bb
@@ -0,0 +1,15 @@
+SUMMARY = "ISO language, territory, currency, script codes and their translations"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fbc093901857fcd118f065f900982c24"
+
+SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
+SRC_URI[md5sum] = "34097a0085f0979e28f9db66ec274c5e"
+SRC_URI[sha256sum] = "86af5735dce6e4eff2b983e5d8aa9a3dea1b8db702333ff20be89e45f7f35a72"
+
+# inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
+# are inhibited by allarch
+DEPENDS = "gettext-native"
+
+inherit autotools allarch
+
+FILES_${PN} += "${datadir}/xml/"
-- 
2.1.4


