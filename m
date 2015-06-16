Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7418A758DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 14:22:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jun 2015 07:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,626,1427785200"; d="scan'208";a="744450027"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2015 07:22:40 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 17:22:58 +0300
Message-Id: <864f523c235db3e1df75e35e5fb640e129ad12f3.1434464336.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7ef640d8e47d0705c7f06afdbc1ba24ad52eca5b.1434464336.git.jussi.kukkonen@intel.com>
References: <7ef640d8e47d0705c7f06afdbc1ba24ad52eca5b.1434464336.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1434464336.git.jussi.kukkonen@intel.com>
References: <cover.1434464336.git.jussi.kukkonen@intel.com>
Subject: [PATCH v3 6/6] midori: Depend on Adwaita, not gnome-icon-theme
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
X-List-Received-Date: Tue, 16 Jun 2015 14:22:49 -0000

Adwaita is the current GNOME icon theme.

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


