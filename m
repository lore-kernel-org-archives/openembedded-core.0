Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B56DA617AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 13:51:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 06:51:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,951,1389772800"; d="scan'208";a="531596666"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 06:51:08 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 16:29:44 +0300
Message-Id: <b46b6d312a1191901b19dd0430c0caf3473d1c2b.1398775392.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1398775392.git.laurentiu.palcu@intel.com>
References: <cover.1398775392.git.laurentiu.palcu@intel.com>
Subject: [PATCH 02/12] libdrm: upgrade to 2.4.53
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
X-List-Received-Date: Tue, 29 Apr 2014 13:51:10 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../drm/{libdrm_2.4.52.bb => libdrm_2.4.53.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.52.bb => libdrm_2.4.53.bb} (46%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.52.bb b/meta/recipes-graphics/drm/libdrm_2.4.53.bb
similarity index 46%
rename from meta/recipes-graphics/drm/libdrm_2.4.52.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.53.bb
index 75b1846..323bef5 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.52.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.53.bb
@@ -3,6 +3,6 @@ require libdrm.inc
 SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
            "
-SRC_URI[md5sum] = "01b75624a5da3a7543923e54c3547a24"
-SRC_URI[sha256sum] = "fa693c2f1f61befcefbdcc396673e38481110bac9db610afa4b8afb2be0218c1"
+SRC_URI[md5sum] = "342886a137ddd9ed4341675d132388ad"
+SRC_URI[sha256sum] = "1b0c28fd2f2b92d2df0a73d1aed88f43cb0dee1267aea6bc52ccb5fca5757a08"
 
-- 
1.7.9.5


