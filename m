Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0CFDF606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 12:16:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2015 05:16:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,549,1422950400"; d="scan'208";a="706187178"
Received: from heimdall.fi.intel.com ([10.237.72.168])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2015 05:16:47 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 15:16:22 +0300
Message-Id: <485fdf3973998af90c36e6f70ece2255c98067ea.1428577515.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d3d9f4037e97ba885958f3d527ab8bea2f2261dd.1428577515.git.jussi.kukkonen@intel.com>
References: <d3d9f4037e97ba885958f3d527ab8bea2f2261dd.1428577515.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1428577515.git.jussi.kukkonen@intel.com>
References: <cover.1428577515.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/7] cairo: Upgrade to 1.14.2
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
X-List-Received-Date: Thu, 09 Apr 2015 12:16:46 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/cairo/{cairo_1.12.18.bb => cairo_1.14.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/cairo/{cairo_1.12.18.bb => cairo_1.14.2.bb} (92%)

diff --git a/meta/recipes-graphics/cairo/cairo_1.12.18.bb b/meta/recipes-graphics/cairo/cairo_1.14.2.bb
similarity index 92%
rename from meta/recipes-graphics/cairo/cairo_1.12.18.bb
rename to meta/recipes-graphics/cairo/cairo_1.14.2.bb
index fd0bd8c..3272eb3 100644
--- a/meta/recipes-graphics/cairo/cairo_1.12.18.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.2.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "8e4ff32b82c3b39387eb6f5c59ef848e"
-SRC_URI[sha256sum] = "dc59f0b7ac945ce4e138a03c227a29260915a8b05a4226c1f6f1be586ba7f5b6"
+SRC_URI[md5sum] = "e1cdfaf1c6c995c4d4c54e07215b0118"
+SRC_URI[sha256sum] = "c919d999ddb1bbbecd4bbe65299ca2abd2079c7e13d224577895afa7005ecceb"
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
-- 
2.1.4


