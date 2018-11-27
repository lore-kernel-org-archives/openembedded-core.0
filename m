Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 003866D143
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:55:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 00:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,286,1539673200"; d="scan'208";a="103727721"
Received: from asau1-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.138.143])
	by orsmga003.jf.intel.com with ESMTP; 27 Nov 2018 00:55:48 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 16:55:24 +0800
Message-Id: <20181127085524.4826-14-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127085524.4826-1-anuj.mittal@intel.com>
References: <20181127085524.4826-1-anuj.mittal@intel.com>
Subject: [PATCH 14/14] gst-validate: upgrade 1.14.2 -> 1.14.4
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
X-List-Received-Date: Tue, 27 Nov 2018 08:55:48 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gst-validate_1.14.2.bb => gst-validate_1.14.4.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.14.2.bb => gst-validate_1.14.4.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.14.4.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.14.2.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.14.4.bb
index f4438dc5a2..a4b3b465cc 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.14.4.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
-SRC_URI[md5sum] = "f334102b0e706008505d00f7f5b5e023"
-SRC_URI[sha256sum] = "ea9e423e5470ef85ef8a0aea1714e7abfc49deb2ed282057367484cdeba6f19f"
+SRC_URI[md5sum] = "1f4fc5308695adfdc11d13046aa4888c"
+SRC_URI[sha256sum] = "18dccca94bdc0bab3cddb07817bd280df7ab4abbec9a83b92620367a22d955c7"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.17.1


