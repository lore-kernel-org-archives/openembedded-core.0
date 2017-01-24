Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2135E77230
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 10:42:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jan 2017 02:42:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="34688128"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 24 Jan 2017 02:42:31 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 308066A4006;
	Tue, 24 Jan 2017 02:41:33 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 12:42:19 +0200
Message-Id: <e10aaf32e9db02c2731f2776d80b7e1f9c0875f1.1485249527.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485249527.git.jussi.kukkonen@intel.com>
References: <cover.1485249527.git.jussi.kukkonen@intel.com>
Subject: [PATCH 6/9] libxkbcommon: Upgrade 0.7.0 -> 0.7.1
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
X-List-Received-Date: Tue, 24 Jan 2017 10:42:32 -0000

Small release with bug fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-lib/{libxkbcommon_0.7.0.bb => libxkbcommon_0.7.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.7.0.bb => libxkbcommon_0.7.1.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.1.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.0.bb
rename to meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.1.bb
index a6836d8..07be028 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.7.1.bb
@@ -9,8 +9,8 @@ DEPENDS = "util-macros flex-native bison-native"
 
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "61ba550fc529ea4d6f9faa2cad62c95f"
-SRC_URI[sha256sum] = "09351592312d67b438655f54da5b67853026662c4a57e6be4d225f04a9989798"
+SRC_URI[md5sum] = "947ba609cb0239b9462127d5cf8908ee"
+SRC_URI[sha256sum] = "ba59305d2e19e47c27ea065c2e0df96ebac6a3c6e97e28ae5620073b6084e68b"
 
 UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
 
-- 
2.1.4


