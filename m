Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4BEE773CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 13:57:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Sep 2015 06:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,539,1437462000"; d="scan'208";a="806420626"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 16 Sep 2015 06:57:25 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Sep 2015 16:59:18 +0300
Message-Id: <1442411958-15485-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] adwaita-icon-theme: RREPLACE gnome-icon-theme
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
X-List-Received-Date: Wed, 16 Sep 2015 13:57:28 -0000

RREPLACE, RCONFLICT and RPROVIDE gnome-icon-theme to make on-device
upgrades work.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

 meta/recipes-gnome/gnome/adwaita-icon-theme_3.16.2.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.16.2.1.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.16.2.1.bb
index 526e699..0d7fa0c 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.16.2.1.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.16.2.1.bb
@@ -27,6 +27,10 @@ do_install_append() {
 
 PACKAGES = "${PN}-cursors ${PN}-symbolic ${PN}-hires ${PN}"
 
+RREPLACES_${PN} = "gnome-icon-theme"
+RCONFLICTS_${PN} = "gnome-icon-theme"
+RPROVIDES_${PN} = "gnome-icon-theme"
+
 FILES_${PN}-cursors = "${prefix}/share/icons/Adwaita/cursors/"
 FILES_${PN}-symbolic = "${prefix}/share/icons/Adwaita/*/*/*.symbolic.png"
 FILES_${PN}-hires = "${prefix}/share/icons/Adwaita/256x256/"
-- 
2.1.4


