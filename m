Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C916D6058C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 07:15:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2018 00:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,456,1526367600"; d="scan'208";a="247087625"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.20.118])
	by orsmga005.jf.intel.com with ESMTP; 08 Aug 2018 00:15:18 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 15:15:05 +0800
Message-Id: <20180808071515.25581-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/11] gstreamer1.0: upgrade 1.14.1 -> 1.14.2
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
X-List-Received-Date: Wed, 08 Aug 2018 07:15:19 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gstreamer/{gstreamer1.0_1.14.1.bb => gstreamer1.0_1.14.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.14.1.bb => gstreamer1.0_1.14.2.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb
index e9cd74c..7f291f6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb
@@ -27,8 +27,8 @@ SRC_URI = " \
     file://add-a-target-to-compile-tests.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "c46967bd2b7b6b73fa4f47de61610243"
-SRC_URI[sha256sum] = "28d82b0d261544a9bf85b429399929e4986eb00efcf1ce16cc71d269a4c3186c"
+SRC_URI[md5sum] = "9f4177c1752e44cbd72f6311ee61e1ba"
+SRC_URI[sha256sum] = "4bd6127299f3f29379046bbd58a526e6353b569e0e72f7b4df2ae70df6882e09"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    "
-- 
2.7.4


