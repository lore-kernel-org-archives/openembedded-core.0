Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E252D731A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 12:22:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 22 Dec 2015 04:21:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,464,1444719600"; d="scan'208";a="867289049"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 22 Dec 2015 04:21:42 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 017126A4007
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 05:09:42 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 14:22:53 +0200
Message-Id: <1450786978-19993-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1450786978-19993-1-git-send-email-maxin.john@intel.com>
References: <1450786978-19993-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/7] gstreamer1.0-plugins-base: upgrade to version 1.6.2
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
X-List-Received-Date: Tue, 22 Dec 2015 12:22:04 -0000

1.6.1 -> 1.6.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...er1.0-plugins-base_1.6.1.bb => gstreamer1.0-plugins-base_1.6.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.6.1.bb => gstreamer1.0-plugins-base_1.6.2.bb} (82%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
index d4f5d50..473dbcd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
@@ -11,7 +11,7 @@ SRC_URI += "file://get-caps-from-src-pad-when-query-caps.patch \
             file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
 "
 
-SRC_URI[md5sum] = "a89933afbe45d8f8c92d89c2f1199ecb"
-SRC_URI[sha256sum] = "9533dcfaa4ee32d435483d9fa88c06b1eba6e9bb234aacd7583f207199f44ba3"
+SRC_URI[md5sum] = "f530fbbe287edce79c55a37bd1a39fe2"
+SRC_URI[sha256sum] = "c75dd400e451526ed71e1c4955e33d470a2581f5e71ecf84920a41c0a5c75322"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
2.4.0


