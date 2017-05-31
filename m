Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BF0A77805C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 11:23:25 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2017 04:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,423,1491289200"; d="scan'208";a="107462700"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 31 May 2017 04:23:27 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 983775803AB;
	Wed, 31 May 2017 04:23:25 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 14:23:13 +0300
Message-Id: <d3d00a66632adc0c5cbc2cf75393ed1802081f5f.1496229576.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496229576.git.jussi.kukkonen@intel.com>
References: <cover.1496229576.git.jussi.kukkonen@intel.com>
Subject: [PATCH 04/10] atk-spi2-core: Upgrade 2.24.0 -> 2.24.1
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
X-List-Received-Date: Wed, 31 May 2017 11:23:25 -0000

Tiny bugfix upgrade.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../atk/{at-spi2-core_2.24.0.bb => at-spi2-core_2.24.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.24.0.bb => at-spi2-core_2.24.1.bb} (88%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.24.0.bb b/meta/recipes-support/atk/at-spi2-core_2.24.1.bb
similarity index 88%
rename from meta/recipes-support/atk/at-spi2-core_2.24.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.24.1.bb
index c3b0c48..b5b71e7 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.24.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.24.1.bb
@@ -9,8 +9,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-build-Add-with-systemduserunitdir.patch \
           "
 
-SRC_URI[md5sum] = "27598276ec58371a6254a4f8b949bf8c"
-SRC_URI[sha256sum] = "6179f314fbd903b3cd3477a57b6b1fecca88b76ce769ce777fda0d3e5f61afcd"
+SRC_URI[md5sum] = "61d0a471e693292934a73f288ebff35c"
+SRC_URI[sha256sum] = "1e90d064b937aacfe79a96232ac7e63d28d716e85bd9ff4333f865305a959b5b"
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
 
-- 
2.1.4


