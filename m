Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 040EA758F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 13:24:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Jun 2015 06:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,595,1427785200"; d="scan'208";a="744929111"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 11 Jun 2015 06:24:30 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 16:24:50 +0300
Message-Id: <fafb8fcc291dcda89a88f8b88d86b0f0195d182c.1434028277.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <bb62c4c42bf4e34d21678cb7a84f453b93c4fb5a.1434028277.git.jussi.kukkonen@intel.com>
References: <bb62c4c42bf4e34d21678cb7a84f453b93c4fb5a.1434028277.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1434028277.git.jussi.kukkonen@intel.com>
References: <cover.1434028277.git.jussi.kukkonen@intel.com>
Subject: [PATCH 6/6] midori: Depend on Adwaita, not gnome-icon-theme
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
X-List-Received-Date: Thu, 11 Jun 2015 13:24:59 -0000

Adwaita is the current GNOME icon theme and provides the
symbolic icons gnome-icon-theme does not.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-sato/midori/midori_0.5.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/midori/midori_0.5.8.bb b/meta/recipes-sato/midori/midori_0.5.8.bb
index aa1b395..1c027fe4 100644
--- a/meta/recipes-sato/midori/midori_0.5.8.bb
+++ b/meta/recipes-sato/midori/midori_0.5.8.bb
@@ -26,6 +26,6 @@ EXTRA_OECMAKE = " \
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-RRECOMMENDS_${PN} += "glib-networking ca-certificates gnome-icon-theme"
+RRECOMMENDS_${PN} += "glib-networking ca-certificates adwaita-icon-theme"
 
 FILES_${PN} += "${datadir}/appdata"
-- 
2.1.4


