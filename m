Return-Path: <anuj.mittal@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6831078493
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 06:47:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 22:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,537,1511856000"; d="scan'208";a="35991183"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.104])
	by orsmga002.jf.intel.com with ESMTP; 19 Feb 2018 22:47:14 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2018 14:47:06 +0800
Message-Id: <1519109226-24570-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gst-validate: inherit upstream-version-is-even
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
X-List-Received-Date: Tue, 20 Feb 2018 06:47:14 -0000

gst-validate follows GStreamer versioning. Inherit class to make
sure development releases aren't marked as latest.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb
index d2dbb41..0f2585a 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.4.bb
@@ -15,7 +15,7 @@ RRECOMMENDS_${PN} = "git"
 
 FILES_${PN} += "${datadir}/gstreamer-1.0/* ${libdir}/gst-validate-launcher/* ${libdir}/gstreamer-1.0/*"
 
-inherit pkgconfig gettext autotools gobject-introspection gtk-doc
+inherit pkgconfig gettext autotools gobject-introspection gtk-doc upstream-version-is-even
 
 # With gtk-doc enabled this recipe fails to build, so forcibly disable it:
 # WORKDIR/build/docs/validate/gst-validate-scan: line 117:
-- 
2.7.4


