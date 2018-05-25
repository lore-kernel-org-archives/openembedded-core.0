Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DFB5774D5B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 06:20:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 23:20:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,439,1520924400"; d="scan'208";a="61569629"
Received: from anmitta2-mobl1.png.intel.com ([10.221.23.24])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2018 23:20:37 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 14:20:10 +0800
Message-Id: <20180525062014.22022-8-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180525062014.22022-1-anuj.mittal@intel.com>
References: <20180525062014.22022-1-anuj.mittal@intel.com>
Subject: [PATCH 08/12] gstreamer1.0-libav: upgrade 1.14.0 -> 1.14.1
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
X-List-Received-Date: Fri, 25 May 2018 06:20:37 -0000

Bugfixes only. Please see:

https://gstreamer.freedesktop.org/releases/1.14/#1.14.1

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...reamer1.0-libav_1.14.0.bb => gstreamer1.0-libav_1.14.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.14.0.bb => gstreamer1.0-libav_1.14.1.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.1.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.1.bb
index ee2a043f81..69be590d2f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.14.1.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://0001-configure-check-for-armv7ve-variant.patch \
            file://0001-fix-host-contamination.patch \
            "
-SRC_URI[md5sum] = "943045b9e937ffc5c6cfa0bd5c44230d"
-SRC_URI[sha256sum] = "fb134b4d3e054746ef8b922ff157b0c7903d1fdd910708a45add66954da7ef89"
+SRC_URI[md5sum] = "d57b0052f6eccb8e6762def05995133c"
+SRC_URI[sha256sum] = "eff80a02d2f2fb9f34b67e9a26e9954d3218c7aa18e863f2a47805fa7066029d"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.17.0


