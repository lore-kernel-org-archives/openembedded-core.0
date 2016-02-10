Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 54D49731F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:45:58 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2016 04:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,425,1449561600"; d="scan'208";a="45548572"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 10 Feb 2016 04:45:58 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 14:42:44 +0200
Message-Id: <6ebf64ba55b2abcb17cfaf487d412a7072d9034b.1455107972.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/7] webkitgtk: update to 2.10.7
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
X-List-Received-Date: Wed, 10 Feb 2016 12:45:58 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/webkit/{webkitgtk_2.10.5.bb => webkitgtk_2.10.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.10.5.bb => webkitgtk_2.10.7.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.10.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkitgtk_2.10.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
index fba3108..8812967 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.10.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
@@ -16,8 +16,8 @@ SRC_URI = "\
   file://0001-Enable-backtrace-on-linux-when-using-glibc.patch \
   file://0001-Fix-build-with-non-glibc-libraries-on-linux.patch \
   "
-SRC_URI[md5sum] = "bb3bd727960630bb4cbaddf8b1632d18"
-SRC_URI[sha256sum] = "785d5e98eaf07be15fb8891b7d5b13a2df7072c609b3ee631ca07d5dea1d79fa"
+SRC_URI[md5sum] = "84832b9d8329413b4f1d87df5f7e8efe"
+SRC_URI[sha256sum] = "990d62c82ed6dede31a6ff0a82d847f16b812842ff3e1093d17113627652864e"
 
 inherit cmake lib_package pkgconfig perlnative pythonnative distro_features_check upstream-version-is-even
 
-- 
2.7.0


