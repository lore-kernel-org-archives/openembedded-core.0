Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DEFC878C1C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 07:15:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2018 00:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,456,1526367600"; d="scan'208";a="247087660"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.20.118])
	by orsmga005.jf.intel.com with ESMTP; 08 Aug 2018 00:15:22 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 15:15:08 +0800
Message-Id: <20180808071515.25581-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180808071515.25581-1-anuj.mittal@intel.com>
References: <20180808071515.25581-1-anuj.mittal@intel.com>
Subject: [PATCH 04/11] gstreamer1.0-plugins-bad: 1.14.1 -> 1.14.2
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
X-List-Received-Date: Wed, 08 Aug 2018 07:15:27 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...er1.0-plugins-bad_1.14.1.bb => gstreamer1.0-plugins-bad_1.14.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.14.1.bb => gstreamer1.0-plugins-bad_1.14.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.2.bb
index 64d5651..e36ffe6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.2.bb
@@ -9,8 +9,8 @@ SRC_URI = " \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
     file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
 "
-SRC_URI[md5sum] = "c2f963501fc6afc084c418894425dcfd"
-SRC_URI[sha256sum] = "2a77c6908032aafdf2cd2e5823fec948f16a25c2d1497a953828d762dc20d61a"
+SRC_URI[md5sum] = "76826c564bed5511982d7fb6137d9875"
+SRC_URI[sha256sum] = "34fab7da70994465a64468330b2168a4a0ed90a7de7e4c499b6d127c6c1b1eaf"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.7.4


