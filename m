Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 989C46C544
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:55:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 00:55:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,286,1539673200"; d="scan'208";a="103727714"
Received: from asau1-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.138.143])
	by orsmga003.jf.intel.com with ESMTP; 27 Nov 2018 00:55:45 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 16:55:21 +0800
Message-Id: <20181127085524.4826-11-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127085524.4826-1-anuj.mittal@intel.com>
References: <20181127085524.4826-1-anuj.mittal@intel.com>
Subject: [PATCH 11/14] gstreamer1.0-rtsp-server: upgrade 1.14.3 -> 1.14.4
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
X-List-Received-Date: Tue, 27 Nov 2018 08:55:44 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...sp-server_1.14.3.bb => gstreamer1.0-rtsp-server_1.14.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.14.3.bb => gstreamer1.0-rtsp-server_1.14.4.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.4.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.4.bb
index 7e75f62c28..7efc1b3534 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.14.4.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz
            file://gtk-doc-tweaks.patch \
            "
 
-SRC_URI[md5sum] = "3da1cd1011d3b826df87c96dbfbb1174"
-SRC_URI[sha256sum] = "1f654c7617af15d13b67bf833f4c81d086ecbfd8cce7f2bf65fe5c1c3519f4e6"
+SRC_URI[md5sum] = "ab0fb5c829266a500e14b46b7bdf06bf"
+SRC_URI[sha256sum] = "3d0ece2afdcd601c175ece24e32a30bc19247b454f4eafd3deeec2533c6884f1"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.17.1


