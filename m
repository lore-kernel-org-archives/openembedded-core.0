Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B43987713F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 12:41:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 04:41:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,265,1444719600"; d="scan'208";a="596861550"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 04:41:04 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 14:44:03 +0200
Message-Id: <89b809eaef8b1fcf71287300bc8a29d813b384e0.1447072488.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <090fbaaf8c5d1b0a51169fce3b9c6ef822103dc7.1447072488.git.jussi.kukkonen@intel.com>
References: <090fbaaf8c5d1b0a51169fce3b9c6ef822103dc7.1447072488.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447072488.git.jussi.kukkonen@intel.com>
References: <cover.1447072488.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 6/8] atk-spi2-core: Upgrade 2.16.0 -> 2.18.1
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
X-List-Received-Date: Mon, 09 Nov 2015 12:41:12 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../atk/{at-spi2-core_2.16.0.bb => at-spi2-core_2.18.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.16.0.bb => at-spi2-core_2.18.1.bb} (84%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.16.0.bb b/meta/recipes-support/atk/at-spi2-core_2.18.1.bb
similarity index 84%
rename from meta/recipes-support/atk/at-spi2-core_2.16.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.18.1.bb
index 7c12b54..53fa1f5 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.18.1.bb
@@ -8,8 +8,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
           "
 
-SRC_URI[md5sum] = "be6eeea370f913b7639b609913b2cf02"
-SRC_URI[sha256sum] = "1c0b77fb8ce81abbf1d80c0afee9858b3f9229f673b7881995fe0fc16b1a74d0"
+SRC_URI[md5sum] = "5f13ba8cfd97cf817261954ef49ebd48"
+SRC_URI[sha256sum] = "57d555be4cc64905454687bf9bb7dc1e68531bee93befa77222d94ea083f01cf"
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native gettext-native"
 
-- 
2.1.4


