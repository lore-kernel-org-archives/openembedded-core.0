Return-Path: <jussi.kukkonen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 47AE771CA2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 26 Oct 2016 06:28:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="894198374"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 26 Oct 2016 06:28:05 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 8F8276A4006;
	Wed, 26 Oct 2016 06:27:30 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:47 +0300
Message-Id: <61984f78d1dde60944dca4602b0e06166724c5ce.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
References: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477488358.git.jussi.kukkonen@intel.com>
References: <cover.1477488358.git.jussi.kukkonen@intel.com>
Subject: [PATCH 06/14] atk: Upgrade 2.20.0 -> 2.22.0
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
X-List-Received-Date: Wed, 26 Oct 2016 13:28:03 -0000

Six-monthly release, mostly bug fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/atk/{atk_2.20.0.bb => atk_2.22.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{atk_2.20.0.bb => atk_2.22.0.bb} (79%)

diff --git a/meta/recipes-support/atk/atk_2.20.0.bb b/meta/recipes-support/atk/atk_2.22.0.bb
similarity index 79%
rename from meta/recipes-support/atk/atk_2.20.0.bb
rename to meta/recipes-support/atk/atk_2.22.0.bb
index 0422354..bc80f95 100644
--- a/meta/recipes-support/atk/atk_2.20.0.bb
+++ b/meta/recipes-support/atk/atk_2.22.0.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
-SRC_URI[archive.md5sum] = "5187b0972f4d3905f285540b31395e20"
-SRC_URI[archive.sha256sum] = "493a50f6c4a025f588d380a551ec277e070b28a82e63ef8e3c06b3ee7c1238f0"
+SRC_URI[archive.md5sum] = "c7f2adcf75e4058727174cde970e9129"
+SRC_URI[archive.sha256sum] = "d349f5ca4974c9c76a4963e5b254720523b0c78672cbc0e1a3475dbd9b3d44b6"
 
 BBCLASSEXTEND = "native"
 
-- 
2.1.4


