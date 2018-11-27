Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C82636C4E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:55:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 00:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,286,1539673200"; d="scan'208";a="103727690"
Received: from asau1-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.138.143])
	by orsmga003.jf.intel.com with ESMTP; 27 Nov 2018 00:55:40 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 16:55:17 +0800
Message-Id: <20181127085524.4826-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127085524.4826-1-anuj.mittal@intel.com>
References: <20181127085524.4826-1-anuj.mittal@intel.com>
Subject: [PATCH 07/14] gstreamer1.0-plugins-bad: upgrade 1.14.3 -> 1.14.4
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
X-List-Received-Date: Tue, 27 Nov 2018 08:55:40 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ugins-bad_1.14.3.bb => gstreamer1.0-plugins-bad_1.14.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.14.3.bb => gstreamer1.0-plugins-bad_1.14.4.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb
index 996a7490fb..8c7c235fd1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb
@@ -9,8 +9,8 @@ SRC_URI = " \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
     file://0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch \
 "
-SRC_URI[md5sum] = "caddacfa4ffff2b3171961ad278507c2"
-SRC_URI[sha256sum] = "b2224e5d9c1b85ad51233f6135524bb9e16a9172d395edc79c73b89094659fd5"
+SRC_URI[md5sum] = "5d20a91d027708abcf924f6c1279dd25"
+SRC_URI[sha256sum] = "910b4e0e2e897e8b6d06767af1779d70057c309f67292f485ff988d087aa0de5"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.17.1


