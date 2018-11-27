Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E07D76D255
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:55:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 00:55:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,286,1539673200"; d="scan'208";a="103727720"
Received: from asau1-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.138.143])
	by orsmga003.jf.intel.com with ESMTP; 27 Nov 2018 00:55:47 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 16:55:23 +0800
Message-Id: <20181127085524.4826-13-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127085524.4826-1-anuj.mittal@intel.com>
References: <20181127085524.4826-1-anuj.mittal@intel.com>
Subject: [PATCH 13/14] gstreamer1.0-python: upgrade 1.14.3 -> 1.14.4
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
X-List-Received-Date: Tue, 27 Nov 2018 08:55:47 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...amer1.0-python_1.14.3.bb => gstreamer1.0-python_1.14.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.14.3.bb => gstreamer1.0-python_1.14.4.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
index d42c9196e7..8d45ca2668 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
@@ -6,8 +6,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[md5sum] = "af6907b1b6c41a52b27939417e8c5ba9"
-SRC_URI[sha256sum] = "4fc3e76c965384e54fb6be819d606ab304988eb677cf0c5dcc0dd555e3ad8307"
+SRC_URI[md5sum] = "d4c0e3915f547feef49208ee08981e5a"
+SRC_URI[sha256sum] = "d0fdb24f93b6d889f309d2f526b8ea9577e0084ff0a62b4623ef1aed52e85a1b"
 
 DEPENDS = "gstreamer1.0 python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
-- 
2.17.1


