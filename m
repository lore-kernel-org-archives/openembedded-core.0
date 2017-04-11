Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7895A77D19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 10:55:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 11 Apr 2017 03:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,185,1488873600"; d="scan'208";a="1154304285"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2017 03:55:32 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 895586A4006;
	Tue, 11 Apr 2017 03:55:22 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 13:55:22 +0300
Message-Id: <4aa441aa78d3d1ba2fb27b559a97e2afa433aa1f.1491907553.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1491907553.git.jussi.kukkonen@intel.com>
References: <cover.1491907553.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 2/4] mkfontscale: Remove x11 requirement for -native
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
X-List-Received-Date: Tue, 11 Apr 2017 10:55:31 -0000

Make sure we can build native tools without "x11" feature.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb
index 31cf186..d1aa9b3 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.2.bb
@@ -10,6 +10,8 @@ is used by the mkfontdir program."
 
 DEPENDS = "util-macros-native zlib libfontenc freetype xproto"
 
+REQUIRED_DISTRO_FEATURES_class-native = ""
+
 BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e0d129d05305176d1a790e0ac1acb7f"
-- 
2.1.4


