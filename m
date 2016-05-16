Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 03D21731CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 13:23:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2016 06:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="977873549"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2016 06:23:04 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 16:22:47 +0300
Message-Id: <7b719e0c8d47bbabfe47f84340e2ac3bc84b8d9d.1463404035.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
References: <25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463404035.git.jussi.kukkonen@intel.com>
References: <cover.1463404035.git.jussi.kukkonen@intel.com>
Subject: [PATCH 10/13] xproto: Upgrade 7.0.28 -> 7.0.29
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
X-List-Received-Date: Mon, 16 May 2016 13:23:04 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-proto/{xproto_7.0.28.bb => xproto_7.0.29.bb}                | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.28.bb => xproto_7.0.29.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-proto/xproto_7.0.28.bb b/meta/recipes-graphics/xorg-proto/xproto_7.0.29.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-proto/xproto_7.0.28.bb
rename to meta/recipes-graphics/xorg-proto/xproto_7.0.29.bb
index 7427a7d..412b6a2 100644
--- a/meta/recipes-graphics/xorg-proto/xproto_7.0.28.bb
+++ b/meta/recipes-graphics/xorg-proto/xproto_7.0.29.bb
@@ -15,6 +15,5 @@ SRC_URI += "file://xproto_fix_for_x32.patch"
 EXTRA_OECONF_append = " --enable-specs=no"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "3ce2f230c5d8fa929f326ad1f0fa40a8"
-SRC_URI[sha256sum] = "29e85568d1f68ceef8a2c081dad9bc0e5500a53cfffde24b564dc43d46ddf6ca"
-
+SRC_URI[md5sum] = "eeeae1f47d43a33ef0d5c56727410326"
+SRC_URI[sha256sum] = "6c1a477092ca73233902b8d5f33012635c4b0208f17e7833cc7efe5c93ba9f8a"
-- 
2.1.4


