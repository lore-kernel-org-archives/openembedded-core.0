Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 20B716D13B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:55:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 00:55:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,286,1539673200"; d="scan'208";a="103727671"
Received: from asau1-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.138.143])
	by orsmga003.jf.intel.com with ESMTP; 27 Nov 2018 00:55:36 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 16:55:14 +0800
Message-Id: <20181127085524.4826-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127085524.4826-1-anuj.mittal@intel.com>
References: <20181127085524.4826-1-anuj.mittal@intel.com>
Subject: [PATCH 04/14] gstreamer1.0: upgrade 1.14.3 -> 1.14.4
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
X-List-Received-Date: Tue, 27 Nov 2018 08:55:36 -0000

This release only contains bugfixes and it should be safe to update from
1.14.x.

Release notes:

https://gstreamer.freedesktop.org/releases/1.14/

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0_1.14.3.bb => gstreamer1.0_1.14.4.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.14.3.bb => gstreamer1.0_1.14.4.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
index 048c074f63..232234b888 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.4.bb
@@ -27,8 +27,8 @@ SRC_URI = " \
     file://add-a-target-to-compile-tests.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "c790c0d002164cafe93e67cdf78c8ace"
-SRC_URI[sha256sum] = "13ae530eb1d4566c3aa0cff1bbb8e64c643065bb12e2e7c707f311ab4a390456"
+SRC_URI[md5sum] = "f67fbbc42bd85a0701df119f52fb52bd"
+SRC_URI[sha256sum] = "f94f6696c5f05a3b3a9183e39c5f5c0b779f75a04c0efa497e7920afa985ffc7"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    "
-- 
2.17.1


