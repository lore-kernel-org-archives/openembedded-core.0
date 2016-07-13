Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 88EEA606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 12:55:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jul 2016 05:54:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,357,1464678000"; d="scan'208";a="994378675"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 13 Jul 2016 05:54:12 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 15:54:04 +0300
Message-Id: <f6465d54e9cfd03eedf3e34d4e9583d67598cc6c.1468414127.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1713be02079bf9785e79492a1d81554e7cbcb372.1468414127.git.jussi.kukkonen@intel.com>
References: <1713be02079bf9785e79492a1d81554e7cbcb372.1468414127.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468414126.git.jussi.kukkonen@intel.com>
References: <cover.1468414126.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/7] cairo: Remove unnecessary UPSTREAM_CHECK_REGEX
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
X-List-Received-Date: Wed, 13 Jul 2016 12:55:09 -0000

This overwrites the regex set by upstream-version-is-even.bbclass.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/cairo/cairo_1.14.6.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.14.6.bb b/meta/recipes-graphics/cairo/cairo_1.14.6.bb
index 20b4668..d2c1e12 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.6.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.6.bb
@@ -7,8 +7,6 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 SRC_URI[md5sum] = "23a0b2f0235431d35238df1d3a517fdb"
 SRC_URI[sha256sum] = "613cb38447b76a93ff7235e17acd55a78b52ea84a9df128c3f2257f8eaa7b252"
 
-UPSTREAM_CHECK_REGEX = "cairo-(?P<pver>\d+(\.\d+)+)\.tar"
-
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
 SUMMARY_${PN} = "The Cairo 2D vector graphics library"
-- 
2.1.4


