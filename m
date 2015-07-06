Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DE8C775D71
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 12:28:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jul 2015 05:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,414,1432623600"; d="scan'208";a="741416780"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2015 05:28:21 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 15:29:00 +0300
Message-Id: <2cb5e94b9880dc09dc13420d75c74308ce3fa0d2.1436184775.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a446be1baf28f8ba1d89f00c5b78e47a81a2ac11.1436184775.git.jussi.kukkonen@intel.com>
References: <a446be1baf28f8ba1d89f00c5b78e47a81a2ac11.1436184775.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1436184775.git.jussi.kukkonen@intel.com>
References: <cover.1436184775.git.jussi.kukkonen@intel.com>
Subject: [PATCH v4 7/7] midori: Depend on Adwaita, not gnome-icon-theme
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
X-List-Received-Date: Mon, 06 Jul 2015 12:28:22 -0000

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


