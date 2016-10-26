Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B7A4F71C73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:37:58 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 26 Oct 2016 01:37:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,549,1473145200"; d="scan'208";a="23848444"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 26 Oct 2016 01:37:56 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id E5E2B6A4006;
	Wed, 26 Oct 2016 01:37:21 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 11:37:33 +0300
Message-Id: <0fcd82dd0ef05617f6295ace0df9af55adb55623.1477469885.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
References: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477469885.git.jussi.kukkonen@intel.com>
References: <cover.1477469885.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 10/16] libxi: Upgrade 1.7.6 -> 1.7.7
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
X-List-Received-Date: Wed, 26 Oct 2016 08:37:58 -0000

Tiny bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxi_1.7.6.bb => libxi_1.7.7.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.6.bb => libxi_1.7.7.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.6.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.7.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxi_1.7.6.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.7.7.bb
index 7523479..934de08 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.7.bb
@@ -17,5 +17,6 @@ PE = "1"
 
 XORG_PN = "libXi"
 
-SRC_URI[md5sum] = "510e555ecfffa8d2298a0f42b725e563"
-SRC_URI[sha256sum] = "1f32a552cec0f056c0260bdb32e853cec0673d2f40646ce932ad5a9f0205b7ac"
+SRC_URI[md5sum] = "cc0883a898222d50ff79af3f83595823"
+SRC_URI[sha256sum] = "996f834fa57b9b33ba36690f6f5c6a29320bc8213022943912462d8015b1e030"
+
-- 
2.1.4


