Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 84EDE71C7D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:16 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP; 26 Oct 2016 06:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="24249114"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 26 Oct 2016 06:28:07 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 474806A4006;
	Wed, 26 Oct 2016 06:27:33 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:49 +0300
Message-Id: <6d1742dfa941d57c9a6dcb5c1d4ec303cda022b9.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
References: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477488358.git.jussi.kukkonen@intel.com>
References: <cover.1477488358.git.jussi.kukkonen@intel.com>
Subject: [PATCH 08/14] at-spi2-atk: Upgrade 2.20.1 -> 2.22.0
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
X-List-Received-Date: Wed, 26 Oct 2016 13:28:16 -0000

Six-monthly release, mostly bug fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../atk/{at-spi2-atk_2.20.1.bb => at-spi2-atk_2.22.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.20.1.bb => at-spi2-atk_2.22.0.bb} (81%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.20.1.bb b/meta/recipes-support/atk/at-spi2-atk_2.22.0.bb
similarity index 81%
rename from meta/recipes-support/atk/at-spi2-atk_2.20.1.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.22.0.bb
index d4120b6..80ba642 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.20.1.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.22.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "23309b6f8e1623871ace6347fb734dce"
-SRC_URI[sha256sum] = "2358a794e918e8f47ce0c7370eee8fc8a6207ff1afe976ec9ff547a03277bf8e"
+SRC_URI[md5sum] = "aa62aed21b8e03dc44ab81ae49d893ca"
+SRC_URI[sha256sum] = "e8bdedbeb873eb229eb08c88e11d07713ec25ae175251648ad1a9da6c21113c1"
 
 DEPENDS = "dbus glib-2.0 atk at-spi2-core"
 
-- 
2.1.4


