Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1CD4F731A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 12:21:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Dec 2015 04:21:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,464,1444719600"; d="scan'208";a="712766097"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 22 Dec 2015 04:21:55 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 74AC16A4007
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 05:09:54 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 14:22:58 +0200
Message-Id: <1450786978-19993-8-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1450786978-19993-1-git-send-email-maxin.john@intel.com>
References: <1450786978-19993-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 7/7] gstreamer1.0-libav: upgrade to version 1.6.2
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
X-List-Received-Date: Tue, 22 Dec 2015 12:21:56 -0000

1.6.1 -> 1.6.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../{gstreamer1.0-libav_1.6.1.bb => gstreamer1.0-libav_1.6.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.6.1.bb => gstreamer1.0-libav_1.6.2.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.2.bb
index 077c714..1091b84 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.6.2.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
     file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
 "
-SRC_URI[md5sum] = "058b22411e1690eee5b71d1ab44eab25"
-SRC_URI[sha256sum] = "24d5e8e8b8c825af1a19aa80a27aba268ec383c8133fd4ef66e0e572ff6137a9"
+SRC_URI[md5sum] = "09644a38827d233f53edeac815dd0ec0"
+SRC_URI[sha256sum] = "2597acc00171006d49f0d300440a87df51b113d557466e532153abc740db3469"
 
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
-- 
2.4.0


