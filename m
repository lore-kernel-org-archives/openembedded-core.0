Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 64A2671A66
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:38 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412283"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:39 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:27 +0200
Message-Id: <90484a637dd3778bfeb6067f553be3309361cc6f.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 16/18] webkitgtk: update to 2.14.2
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:39 -0000

From: Carlos Alberto Lopez Perez <clopez@igalia.com>

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/webkit/{webkitgtk_2.14.1.bb => webkitgtk_2.14.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.14.1.bb => webkitgtk_2.14.2.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
index 1f2166c..373df17 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
            "
 
-SRC_URI[md5sum] = "8d6c60dc41604d3bbd43165a674c07e5"
-SRC_URI[sha256sum] = "2e2d76c328de65bed6e0e4f096b2720a366654b27fc1af0830ece90bc4b7ceb5"
+SRC_URI[md5sum] = "2fe3cadbc546d93ca68a13756c2be015"
+SRC_URI[sha256sum] = "2edbcbd5105046aea55af9671c4de8deedb5b0e3567c618034d440a760675556"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.10.2


