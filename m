Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7596C18F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 08:55:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 00:55:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,286,1539673200"; d="scan'208";a="103727686"
Received: from asau1-mobl.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.138.143])
	by orsmga003.jf.intel.com with ESMTP; 27 Nov 2018 00:55:39 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 16:55:16 +0800
Message-Id: <20181127085524.4826-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127085524.4826-1-anuj.mittal@intel.com>
References: <20181127085524.4826-1-anuj.mittal@intel.com>
Subject: [PATCH 06/14] gstreamer1.0-plugins-good: upgrade 1.14.3 -> 1.14.4
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
X-List-Received-Date: Tue, 27 Nov 2018 08:55:38 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ins-good_1.14.3.bb => gstreamer1.0-plugins-good_1.14.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.14.3.bb => gstreamer1.0-plugins-good_1.14.4.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bb
index 77ccb4cc18..8306605796 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.4.bb
@@ -8,8 +8,8 @@ SRC_URI = " \
             file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
             "
 
-SRC_URI[md5sum] = "01904b7f000cfa6a8e96de0fa1b3ceca"
-SRC_URI[sha256sum] = "5112bce6af0be62760687ca47873c90ce4d65d3fe920a3adf8145db7b07bff5d"
+SRC_URI[md5sum] = "6e3b247097366cf2639f22abfece7113"
+SRC_URI[sha256sum] = "5f8b553260cb0aac56890053d8511db1528d53cae10f0287cfce2cb2acc70979"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.17.1


