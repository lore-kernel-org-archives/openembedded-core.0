Return-Path: <jussi.kukkonen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 30155783F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 10:33:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 15 Aug 2017 03:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="1205826683"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 15 Aug 2017 03:33:24 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 2154758061A;
	Tue, 15 Aug 2017 03:33:22 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 13:33:17 +0300
Message-Id: <81a1a97156f63566d8d129d75166647e47faad38.1502792828.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1502792828.git.jussi.kukkonen@intel.com>
References: <cover.1502792828.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/4] cairo: Upgrade 1.14.8 -> 1.14.10
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
X-List-Received-Date: Tue, 15 Aug 2017 10:33:23 -0000

Small bug fix update.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/cairo/{cairo_1.14.8.bb => cairo_1.14.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/cairo/{cairo_1.14.8.bb => cairo_1.14.10.bb} (92%)

diff --git a/meta/recipes-graphics/cairo/cairo_1.14.8.bb b/meta/recipes-graphics/cairo/cairo_1.14.10.bb
similarity index 92%
rename from meta/recipes-graphics/cairo/cairo_1.14.8.bb
rename to meta/recipes-graphics/cairo/cairo_1.14.10.bb
index af6be56..ba38c34 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.8.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.10.bb
@@ -6,8 +6,8 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \ 
           "
 
-SRC_URI[md5sum] = "4ef0db2eacb271c74f8a3fd87822aa98"
-SRC_URI[sha256sum] = "d1f2d98ae9a4111564f6de4e013d639cf77155baf2556582295a0f00a9bc5e20"
+SRC_URI[md5sum] = "146f5f4d0b4439fc3792fd3452b7b12a"
+SRC_URI[sha256sum] = "7e87878658f2c9951a14fc64114d4958c0e65ac47530b8ac3078b2ce41b66a09"
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
-- 
2.1.4


