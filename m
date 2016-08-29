Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9608B731DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 14:32:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2016 07:32:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="1048688762"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2016 07:32:10 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 17:30:21 +0300
Message-Id: <8b3b750d74bc74dedf3c04631743c8c6106fa107.1472480768.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
References: <cover.1472480768.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 14/15] webkitgtk: upgrade to 2.12.4
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
X-List-Received-Date: Mon, 29 Aug 2016 14:32:10 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/webkit/{webkitgtk_2.12.3.bb => webkitgtk_2.12.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.12.3.bb => webkitgtk_2.12.4.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.4.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.12.4.bb
index d9f1c30..cb33336 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.4.bb
@@ -19,8 +19,8 @@ SRC_URI = "\
   file://musl-fixes.patch \
   file://ppc-musl-fix.patch \
   "
-SRC_URI[md5sum] = "aebb4029c09dd81664aa830e4a584c85"
-SRC_URI[sha256sum] = "173cbb9a2eca23eee52e99965483ab25aa9c0569ef5b57041fc0c129cc26c307"
+SRC_URI[md5sum] = "0331ac714fd1a0587ffea470ef1afb20"
+SRC_URI[sha256sum] = "424d3177599abbc1eb1a1ad7928dd280a62006e992f2fada2e059375a9609a77"
 
 inherit cmake lib_package pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even
 
-- 
2.9.3


