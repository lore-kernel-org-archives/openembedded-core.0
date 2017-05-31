Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7482578062
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 11:23:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2017 04:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,423,1491289200"; d="scan'208";a="1176489792"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2017 04:23:28 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id E4A20580244;
	Wed, 31 May 2017 04:23:26 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 14:23:14 +0300
Message-Id: <7f6ba4337de8b4218493c6ae305538f167f103a3.1496229576.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496229576.git.jussi.kukkonen@intel.com>
References: <cover.1496229576.git.jussi.kukkonen@intel.com>
Subject: [PATCH 05/10] at-spi2-atk: Upgrade 2.24.0 -> 2.24.1
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
X-List-Received-Date: Wed, 31 May 2017 11:23:28 -0000

Tiny bug fix upgrade.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../atk/{at-spi2-atk_2.24.0.bb => at-spi2-atk_2.24.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.24.0.bb => at-spi2-atk_2.24.1.bb} (81%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.24.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.24.1.bb
similarity index 81%
rename from meta/recipes-support/atk/at-spi2-atk_2.24.0.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.24.1.bb
index 98a1c9c..ac55081 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.24.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.24.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "984f27528b0e3ec1f153a901cd4fe497"
-SRC_URI[sha256sum] = "022d68497c05cc65ba7cd2b166132de9a160c8d90e9200b5faa473ef7e784c61"
+SRC_URI[md5sum] = "79388fbc4dc7f27394556dd389aeb594"
+SRC_URI[sha256sum] = "60dc90ac4f74b8ffe96a9363c25208a443b381bacecfefea6de549f20ed6957d"
 
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core"
 
-- 
2.1.4


