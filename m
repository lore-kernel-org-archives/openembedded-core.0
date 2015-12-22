Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6037B731A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 12:21:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 22 Dec 2015 04:21:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,464,1444719600"; d="scan'208";a="846359645"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 22 Dec 2015 04:21:44 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id E3DD96A4007
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 05:09:44 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 14:22:54 +0200
Message-Id: <1450786978-19993-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1450786978-19993-1-git-send-email-maxin.john@intel.com>
References: <1450786978-19993-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/7] gstreamer1.0-plugins-good: upgrade to version 1.6.2
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
X-List-Received-Date: Tue, 22 Dec 2015 12:21:44 -0000

1.6.1 -> 1.6.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...er1.0-plugins-good_1.6.1.bb => gstreamer1.0-plugins-good_1.6.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.6.1.bb => gstreamer1.0-plugins-good_1.6.2.bb} (77%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.2.bb
similarity index 77%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.2.bb
index 2b7ec7a..92ebe1d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
 SRC_URI += "file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch"
-SRC_URI[md5sum] = "a930f5ff133f17baf39d2876628b7890"
-SRC_URI[sha256sum] = "86d4b814099f7b7b16be19d4b94fa41002ac01fdf1525b07c5764d54c0605935"
+SRC_URI[md5sum] = "ef4f5bc4f31f706832a234b0f603967b"
+SRC_URI[sha256sum] = "876e54dfce93274b98e024f353258d35fa4d49d1f9010069e676c530f6eb6a92"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
-- 
2.4.0


