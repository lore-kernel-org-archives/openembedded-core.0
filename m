Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 80CD26C544
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:55:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 00:55:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,286,1539673200"; d="scan'208";a="103727707"
Received: from asau1-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.138.143])
	by orsmga003.jf.intel.com with ESMTP; 27 Nov 2018 00:55:44 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 16:55:20 +0800
Message-Id: <20181127085524.4826-10-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127085524.4826-1-anuj.mittal@intel.com>
References: <20181127085524.4826-1-anuj.mittal@intel.com>
Subject: [PATCH 10/14] gstreamer1.0-vaapi: upgrade 1.14.3 -> 1.14.4
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
X-List-Received-Date: Tue, 27 Nov 2018 08:55:43 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...reamer1.0-vaapi_1.14.3.bb => gstreamer1.0-vaapi_1.14.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.14.3.bb => gstreamer1.0-vaapi_1.14.4.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
index a852f0a938..fdca0b9565 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch \
           "
 
-SRC_URI[md5sum] = "c3aeaf8a7fdcbe37d9f40390b620775d"
-SRC_URI[sha256sum] = "8f5e65cb96aa6e44ff80926366d4a6fef9b8da68a04bab4bf2cbed93941c74f0"
+SRC_URI[md5sum] = "2fae3442f5f23e7354a0c592bc7b9065"
+SRC_URI[sha256sum] = "ce18dbfe961c6a8d31270231686075586bf7a7df62b778c8e7f5ec148251d0a3"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.17.1


