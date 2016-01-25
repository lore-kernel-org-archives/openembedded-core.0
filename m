Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 110307706E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:10:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641143902"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:10:51 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:14 +0200
Message-Id: <986b7728c8e0882c54896f98aa07fcb5255e2d84.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/16] webkitgtk: update to 2.10.5
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:44 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/webkit/{webkitgtk_2.10.4.bb => webkitgtk_2.10.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.10.4.bb => webkitgtk_2.10.5.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.10.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.10.5.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.10.4.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.10.5.bb
index 098bbbb..fba3108 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.10.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.10.5.bb
@@ -16,8 +16,8 @@ SRC_URI = "\
   file://0001-Enable-backtrace-on-linux-when-using-glibc.patch \
   file://0001-Fix-build-with-non-glibc-libraries-on-linux.patch \
   "
-SRC_URI[md5sum] = "fb010031c6f61c3a1a00793b112badb5"
-SRC_URI[sha256sum] = "dbf8260da5cac0c74de2d3cce1fe7c519da3cd816a2c769cb6c6d56addd2f055"
+SRC_URI[md5sum] = "bb3bd727960630bb4cbaddf8b1632d18"
+SRC_URI[sha256sum] = "785d5e98eaf07be15fb8891b7d5b13a2df7072c609b3ee631ca07d5dea1d79fa"
 
 inherit cmake lib_package pkgconfig perlnative pythonnative distro_features_check upstream-version-is-even
 
-- 
2.7.0.rc3


