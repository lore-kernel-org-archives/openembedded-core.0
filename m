Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2812A731A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 11:52:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Jun 2016 04:52:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; d="scan'208";a="1002968748"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 22 Jun 2016 04:52:33 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2016 14:52:21 +0300
Message-Id: <e4c88ba3234e24f4eaf3e062fd31c6e8cfc47218.1466595928.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
References: <d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1466595928.git.jussi.kukkonen@intel.com>
References: <cover.1466595928.git.jussi.kukkonen@intel.com>
Subject: [PATCH 02/10] atk: Upgrade 2.18.0 -> 2.20.0
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
X-List-Received-Date: Wed, 22 Jun 2016 11:52:34 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/atk/{atk_2.18.0.bb => atk_2.20.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/atk/{atk_2.18.0.bb => atk_2.20.0.bb} (69%)

diff --git a/meta/recipes-support/atk/atk_2.18.0.bb b/meta/recipes-support/atk/atk_2.20.0.bb
similarity index 69%
rename from meta/recipes-support/atk/atk_2.18.0.bb
rename to meta/recipes-support/atk/atk_2.20.0.bb
index 3c0e82d..0422354 100644
--- a/meta/recipes-support/atk/atk_2.18.0.bb
+++ b/meta/recipes-support/atk/atk_2.20.0.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 
 DEPENDS = "glib-2.0"
 
-inherit gnomebase gtk-doc upstream-version-is-even gobject-introspection
+inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
-SRC_URI[archive.md5sum] = "fd3678f35004b4c92e3da39356996054"
-SRC_URI[archive.sha256sum] = "ce6c48d77bf951083029d5a396dd552d836fff3c1715d3a7022e917e46d0c92b"
+SRC_URI[archive.md5sum] = "5187b0972f4d3905f285540b31395e20"
+SRC_URI[archive.sha256sum] = "493a50f6c4a025f588d380a551ec277e070b28a82e63ef8e3c06b3ee7c1238f0"
 
 BBCLASSEXTEND = "native"
 
-- 
2.1.4


