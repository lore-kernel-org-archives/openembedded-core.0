Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6F877D94
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 10:37:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 01 Jun 2017 03:37:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,279,1493708400"; d="scan'208";a="975511647"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 01 Jun 2017 03:37:04 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 8054C5803AB;
	Thu,  1 Jun 2017 03:37:03 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:36:50 +0300
Message-Id: <16ead647be529ca378e7bb9c9dbafae64e416b64.1496311679.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496311679.git.jussi.kukkonen@intel.com>
References: <cover.1496311679.git.jussi.kukkonen@intel.com>
Subject: [PATCH 05/10] clutter-1.0: Upgrade 1.26.0 -> 1.26.2
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
X-List-Received-Date: Thu, 01 Jun 2017 10:37:04 -0000

Mostly bug fixes in this release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../clutter/{clutter-1.0_1.26.0.bb => clutter-1.0_1.26.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-1.0_1.26.0.bb => clutter-1.0_1.26.2.bb} (67%)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.26.0.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.26.2.bb
similarity index 67%
rename from meta/recipes-graphics/clutter/clutter-1.0_1.26.0.bb
rename to meta/recipes-graphics/clutter/clutter-1.0_1.26.2.bb
index dfa1cfe..48b0501 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0_1.26.0.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.0_1.26.2.bb
@@ -2,8 +2,8 @@ require clutter-1.0.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[archive.md5sum] = "b065e9ca53d1f6bc1ec26aeb27338bb7"
-SRC_URI[archive.sha256sum] = "67514e7824b3feb4723164084b36d6ce1ae41cb3a9897e9f1a56c8334993ce06"
+SRC_URI[archive.md5sum] = "a03482cbacf735eca8c996f210a21ee5"
+SRC_URI[archive.sha256sum] = "e7233314983055e9018f94f56882e29e7fc34d8d35de030789fdcd9b2d0e2e56"
 SRC_URI += "file://install-examples.patch \
             file://run-installed-tests-with-tap-output.patch \
             file://0001-Remove-clutter.types-as-it-is-build-configuration-sp.patch \
-- 
2.1.4


