Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6D97726D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:35:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2016 05:35:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,373,1477983600"; d="scan'208";a="800013200"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Dec 2016 05:35:58 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 88D716A4080;
	Mon, 19 Dec 2016 05:35:09 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2016 15:35:43 +0200
Message-Id: <5d362d469c5831f1aed58010fdfd41dff61a9033.1482154012.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1482154012.git.jussi.kukkonen@intel.com>
References: <cover.1482154012.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/8] cairo: Upgrade 1.14.6 -> 1.14.8
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
X-List-Received-Date: Mon, 19 Dec 2016 13:35:57 -0000

Small bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/cairo/{cairo_1.14.6.bb => cairo_1.14.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/cairo/{cairo_1.14.6.bb => cairo_1.14.8.bb} (92%)

diff --git a/meta/recipes-graphics/cairo/cairo_1.14.6.bb b/meta/recipes-graphics/cairo/cairo_1.14.8.bb
similarity index 92%
rename from meta/recipes-graphics/cairo/cairo_1.14.6.bb
rename to meta/recipes-graphics/cairo/cairo_1.14.8.bb
index d2c1e12..5a3c74f 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.6.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.8.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "23a0b2f0235431d35238df1d3a517fdb"
-SRC_URI[sha256sum] = "613cb38447b76a93ff7235e17acd55a78b52ea84a9df128c3f2257f8eaa7b252"
+SRC_URI[md5sum] = "4ef0db2eacb271c74f8a3fd87822aa98"
+SRC_URI[sha256sum] = "d1f2d98ae9a4111564f6de4e013d639cf77155baf2556582295a0f00a9bc5e20"
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
-- 
2.1.4


