Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A60857599D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 13:11:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 Jun 2015 06:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,602,1427785200"; d="scan'208";a="507220848"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2015 06:11:24 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jun 2015 16:11:45 +0300
Message-Id: <92679ff5c46cdb6353aa62f8fd859f0edde6e562.1434114213.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7321ee7236ec75dd68269421edafaefc52df6a88.1434114213.git.jussi.kukkonen@intel.com>
References: <7321ee7236ec75dd68269421edafaefc52df6a88.1434114213.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1434114213.git.jussi.kukkonen@intel.com>
References: <cover.1434114213.git.jussi.kukkonen@intel.com>
Subject: [PATCH v2 6/6] midori: Depend on Adwaita, not gnome-icon-theme
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
X-List-Received-Date: Fri, 12 Jun 2015 13:11:55 -0000

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


