Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C5FB473EF0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 19:33:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 05 May 2015 12:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,374,1427785200"; d="scan'208";a="690381510"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 05 May 2015 12:33:28 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 May 2015 22:33:11 +0300
Message-Id: <32c70a3ab2f5ab06f67de7f71399dd202e4ec88b.1430854134.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <24c5746bad8f22cc3d79ae2e3a6ded92ae2653af.1430854134.git.jussi.kukkonen@intel.com>
References: <24c5746bad8f22cc3d79ae2e3a6ded92ae2653af.1430854134.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1430854134.git.jussi.kukkonen@intel.com>
References: <cover.1430854134.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/3] kbproto: Upgrade 1.0.6 -> 1.0.7
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
X-List-Received-Date: Tue, 05 May 2015 19:33:27 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-proto/{kbproto_1.0.6.bb => kbproto_1.0.7.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{kbproto_1.0.6.bb => kbproto_1.0.7.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-proto/kbproto_1.0.6.bb b/meta/recipes-graphics/xorg-proto/kbproto_1.0.7.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-proto/kbproto_1.0.6.bb
rename to meta/recipes-graphics/xorg-proto/kbproto_1.0.7.bb
index 07c8e42..46f5c92 100644
--- a/meta/recipes-graphics/xorg-proto/kbproto_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-proto/kbproto_1.0.7.bb
@@ -14,5 +14,5 @@ PE = "1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "677ea8523eec6caca86121ad2dca0b71"
-SRC_URI[sha256sum] = "037cac0aeb80c4fccf44bf736d791fccb2ff7fd34c558ef8f03ac60b61085479"
+SRC_URI[md5sum] = "94afc90c1f7bef4a27fdd59ece39c878"
+SRC_URI[sha256sum] = "f882210b76376e3fa006b11dbd890e56ec0942bc56e65d1249ff4af86f90b857"
-- 
2.1.4


