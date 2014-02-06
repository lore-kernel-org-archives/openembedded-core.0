Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9340D6E9A3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 15:29:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2014 07:29:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,793,1384329600"; d="scan'208";a="450785160"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2014 07:29:43 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 17:29:25 +0200
Message-Id: <c10614ec838659488ecd0cf2e5381fe7464890d2.1391699953.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1391699953.git.laurentiu.palcu@intel.com>
References: <cover.1391699953.git.laurentiu.palcu@intel.com>
Subject: [PATCH 06/13] libdrm: upgrade to 2.4.52
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
X-List-Received-Date: Thu, 06 Feb 2014 15:30:00 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../drm/{libdrm_2.4.49.bb => libdrm_2.4.52.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.49.bb => libdrm_2.4.52.bb} (46%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.49.bb b/meta/recipes-graphics/drm/libdrm_2.4.52.bb
similarity index 46%
rename from meta/recipes-graphics/drm/libdrm_2.4.49.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.52.bb
index 6047d7c..75b1846 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.49.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.52.bb
@@ -3,6 +3,6 @@ require libdrm.inc
 SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
            "
-SRC_URI[md5sum] = "454fe27645152cbd8be8ccda21acaa24"
-SRC_URI[sha256sum] = "25d7d3fd30d8c350d3b87b3048f1c0cf0be295a40197a49acc374d4f4ae97a7d"
+SRC_URI[md5sum] = "01b75624a5da3a7543923e54c3547a24"
+SRC_URI[sha256sum] = "fa693c2f1f61befcefbdcc396673e38481110bac9db610afa4b8afb2be0218c1"
 
-- 
1.7.9.5


