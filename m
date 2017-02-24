Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EFC3E77505
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 08:43:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Feb 2017 00:43:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,200,1484035200"; d="scan'208";a="1101783732"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2017 00:43:19 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2017 10:42:30 +0200
Message-Id: <20170224084230.21753-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] webkitgtk: update to 2.14.5
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
X-List-Received-Date: Fri, 24 Feb 2017 08:43:40 -0000

Remove a reference to WebKit/LICENSE, as the directory is not there anymore
(and the LICENSE file in it hasn't been moved somewhere else) - it was
a relic of webkit 1.x era.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-sato/webkit/{webkitgtk_2.14.2.bb => webkitgtk_2.14.5.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.14.2.bb => webkitgtk_2.14.5.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
index 6338101395a..5fb07da26d9 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.14.5.bb
@@ -4,7 +4,6 @@ BUGTRACKER = "http://bugs.webkit.org/"
 
 LICENSE = "BSD & LGPLv2+"
 LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
-                    file://Source/WebKit/LICENSE;md5=4646f90082c40bcf298c285f8bab0b12 \
                     file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12 \
 		    file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 \
 		    file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80 \
@@ -23,8 +22,8 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://x32_support.patch \
            "
 
-SRC_URI[md5sum] = "2fe3cadbc546d93ca68a13756c2be015"
-SRC_URI[sha256sum] = "2edbcbd5105046aea55af9671c4de8deedb5b0e3567c618034d440a760675556"
+SRC_URI[md5sum] = "7fe3cb2699e64f969b285823c5ae2516"
+SRC_URI[sha256sum] = "3ca8f1c33a9b43d6c753dcac1c0788656930e06382b10fdf5c2805ea8f96369f"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.11.0


