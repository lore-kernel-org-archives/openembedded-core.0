Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD3E7312E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302195"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:27 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:09 +0200
Message-Id: <6f9c6978b1dc6a1fc9fb1d8cb95b66f95e824f59.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/24] webkitgtk: update to 2.14.5
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:26 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/webkit/{webkitgtk_2.14.2.bb => webkitgtk_2.14.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.14.2.bb => webkitgtk_2.14.5.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
index 6338101395a..8e79ef1f82a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://x32_support.patch \
            "
 
-SRC_URI[md5sum] = "2fe3cadbc546d93ca68a13756c2be015"
-SRC_URI[sha256sum] = "2edbcbd5105046aea55af9671c4de8deedb5b0e3567c618034d440a760675556"
+SRC_URI[md5sum] = "7fe3cb2699e64f969b285823c5ae2516"
+SRC_URI[sha256sum] = "3ca8f1c33a9b43d6c753dcac1c0788656930e06382b10fdf5c2805ea8f96369f"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.11.0


