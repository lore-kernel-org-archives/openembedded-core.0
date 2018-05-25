Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B32FA74623
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 06:20:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 23:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,439,1520924400"; d="scan'208";a="61569634"
Received: from anmitta2-mobl1.png.intel.com ([10.221.23.24])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2018 23:20:39 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 14:20:12 +0800
Message-Id: <20180525062014.22022-10-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180525062014.22022-1-anuj.mittal@intel.com>
References: <20180525062014.22022-1-anuj.mittal@intel.com>
Subject: [PATCH 10/12] gstreamer1.0-omx: upgrade 1.14.0 -> 1.14.1
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
X-List-Received-Date: Fri, 25 May 2018 06:20:39 -0000

Bugfixes only. Please see:

https://gstreamer.freedesktop.org/releases/1.14/#1.14.1

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...{gstreamer1.0-omx_1.14.0.bb => gstreamer1.0-omx_1.14.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.14.0.bb => gstreamer1.0-omx_1.14.1.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.1.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.1.bb
index 792b1e182d..065e0f02b2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.14.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "2bca3bd68540a97122450d78576ad2be"
-SRC_URI[sha256sum] = "4d43c354087cb77924982943e34e0d47294b5570304db11fd8b268b53bcff693"
+SRC_URI[md5sum] = "bec524f2a415af865a895fe12bcf0462"
+SRC_URI[sha256sum] = "7cb6c39301dfa3960abce195305c7cf431736bf6b47bde1fd4412c81c3e75cd8"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.17.0


