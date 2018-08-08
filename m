Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C444578C0B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 07:15:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2018 00:15:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,456,1526367600"; d="scan'208";a="247087721"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.20.118])
	by orsmga005.jf.intel.com with ESMTP; 08 Aug 2018 00:15:29 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 15:15:11 +0800
Message-Id: <20180808071515.25581-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180808071515.25581-1-anuj.mittal@intel.com>
References: <20180808071515.25581-1-anuj.mittal@intel.com>
Subject: [PATCH 07/11] gstreamer1.0-rtsp-server: upgrade 1.14.1 -> 1.14.2
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
X-List-Received-Date: Wed, 08 Aug 2018 07:15:28 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...er1.0-rtsp-server_1.14.1.bb => gstreamer1.0-rtsp-server_1.14.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.14.1.bb => gstreamer1.0-rtsp-server_1.14.2.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.2.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.2.bb
index 1ae1b5b..6766e25 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.2.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz
            file://gtk-doc-tweaks.patch \
            "
 
-SRC_URI[md5sum] = "baa721c289880c2cc0e9c5cbebca5201"
-SRC_URI[sha256sum] = "38634f3b25c2bf2967b1ff914b54ff384f8612f5aefc18accd72c78bf3b02d7c"
+SRC_URI[md5sum] = "c26b59dd2ea8b1a4a25e9f7e0f57a50e"
+SRC_URI[sha256sum] = "f7387755cf6ac5f334d4610f1f5aa7da4ff396a487dd5b789bb707f160222c98"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.7.4


