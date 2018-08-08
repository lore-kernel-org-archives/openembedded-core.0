Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F226278C29
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 07:15:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2018 00:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,456,1526367600"; d="scan'208";a="247087769"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.20.118])
	by orsmga005.jf.intel.com with ESMTP; 08 Aug 2018 00:15:33 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 15:15:15 +0800
Message-Id: <20180808071515.25581-11-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180808071515.25581-1-anuj.mittal@intel.com>
References: <20180808071515.25581-1-anuj.mittal@intel.com>
Subject: [PATCH 11/11] gst-validate: 1.14.1 -> 1.14.2
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
X-List-Received-Date: Wed, 08 Aug 2018 07:15:33 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gstreamer/{gst-validate_1.14.1.bb => gst-validate_1.14.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.14.1.bb => gst-validate_1.14.2.bb} (86%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.14.2.bb
similarity index 86%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.14.1.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.14.2.bb
index 7517580..cad64b2 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.14.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            "
-SRC_URI[md5sum] = "293262badee41357e029e5f2664354d7"
-SRC_URI[sha256sum] = "68e3f38f66e0d04837b60090fe5d9ca1127f5df124669f34ca82e241209171e4"
+SRC_URI[md5sum] = "f334102b0e706008505d00f7f5b5e023"
+SRC_URI[sha256sum] = "ea9e423e5470ef85ef8a0aea1714e7abfc49deb2ed282057367484cdeba6f19f"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.7.4


