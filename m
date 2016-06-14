Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 05CCA731ED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:15:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 14 Jun 2016 01:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="718727925"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2016 01:15:14 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 11:14:35 +0300
Message-Id: <ba3d418654f84126b485a2b8c7acccdd3a243369.1465891164.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
References: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465891164.git.jussi.kukkonen@intel.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
Subject: [PATCHv3 11/30] matchbox-terminal: Upgrade to 0.1
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
X-List-Received-Date: Tue, 14 Jun 2016 08:15:14 -0000

New version uses Gtk+3 and a more modern Vte.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{matchbox-terminal_git.bb => matchbox-terminal_0.1.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-sato/matchbox-terminal/{matchbox-terminal_git.bb => matchbox-terminal_0.1.bb} (76%)

diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
similarity index 76%
rename from meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
rename to meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
index c8cbd57..e0a899c 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_git.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
@@ -6,15 +6,15 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://main.c;endline=20;md5=96e39176d9e355639a0b8b1c7a840820"
 
-DEPENDS = "gtk+ vte"
+DEPENDS = "gtk+3 vte"
 SECTION = "x11/utils"
-SRCREV = "452bca253492a97a587f440289b9ab27d217353e"
-PV = "0.0+git${SRCPV}"
 
+#SRCREV tagged 0.1
+SRCREV = "3ad357db2302760b8a8817b5f4478dd87479442f"
 SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig distro_features_check
 
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-- 
2.1.4


