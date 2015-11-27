Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B1327605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 12:07:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2015 04:07:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="860460872"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2015 04:07:11 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 14:10:35 +0200
Message-Id: <1cb8cedd0b82aec43d767cb140bff752f07e650d.1448625307.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
References: <338e77cbca9b7de1c5638e59b440f0da85087835.1448625307.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1448625307.git.jussi.kukkonen@intel.com>
References: <cover.1448625307.git.jussi.kukkonen@intel.com>
Subject: [PATCH 02/10] clutter-1.0: Upgrade 1.24.2
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
X-List-Received-Date: Fri, 27 Nov 2015 12:07:10 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../clutter/{clutter-1.0_1.22.4.bb => clutter-1.0_1.24.2.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-1.0_1.22.4.bb => clutter-1.0_1.24.2.bb} (59%)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.22.4.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.24.2.bb
similarity index 59%
rename from meta/recipes-graphics/clutter/clutter-1.0_1.22.4.bb
rename to meta/recipes-graphics/clutter/clutter-1.0_1.24.2.bb
index 418cdfd..093bf6e 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0_1.22.4.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.0_1.24.2.bb
@@ -2,9 +2,8 @@ require clutter-1.0.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[archive.md5sum] = "26494256c980d49703a553916e3083cd"
-SRC_URI[archive.sha256sum] = "1d77ce16025f87667a1d00dc4fa617a1935156f63fd17635fdadf138866c9e1e"
-
+SRC_URI[archive.md5sum] = "3b98e1b33719982a5736ae42cbf7183e"
+SRC_URI[archive.sha256sum] = "9631c98cb4bcbfec15e1bbe9eaa6eef0f127201552fce40d7d28f2133803cd63"
 SRC_URI += "file://install-examples.patch \
             file://run-installed-tests-with-tap-output.patch \
             file://run-ptest"
-- 
2.1.4


