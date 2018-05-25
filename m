Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BE21574BF4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 06:20:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 23:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,439,1520924400"; d="scan'208";a="61569637"
Received: from anmitta2-mobl1.png.intel.com ([10.221.23.24])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2018 23:20:40 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 14:20:13 +0800
Message-Id: <20180525062014.22022-11-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180525062014.22022-1-anuj.mittal@intel.com>
References: <20180525062014.22022-1-anuj.mittal@intel.com>
Subject: [PATCH 11/12] gstreamer1.0-rtsp-server: upgrade 1.14.0 -> 1.14.1
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
X-List-Received-Date: Fri, 25 May 2018 06:20:40 -0000

Bugfixes only. Please see:

https://gstreamer.freedesktop.org/releases/1.14/#1.14.1

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...sp-server_1.14.0.bb => gstreamer1.0-rtsp-server_1.14.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.14.0.bb => gstreamer1.0-rtsp-server_1.14.1.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.1.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.1.bb
index 64906e1abb..1ae1b5b890 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.1.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz
            file://gtk-doc-tweaks.patch \
            "
 
-SRC_URI[md5sum] = "8a505c88f7469c3a0d1e9f4e9a315e53"
-SRC_URI[sha256sum] = "6b65a077bed815f6d3157ebea503cc9f3c32d289af2756b7ff7e3958744d9756"
+SRC_URI[md5sum] = "baa721c289880c2cc0e9c5cbebca5201"
+SRC_URI[sha256sum] = "38634f3b25c2bf2967b1ff914b54ff384f8612f5aefc18accd72c78bf3b02d7c"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.17.0


