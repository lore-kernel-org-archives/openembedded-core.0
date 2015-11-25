Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 177C76067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:02:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 25 Nov 2015 05:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,342,1444719600"; d="scan'208";a="606912431"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Nov 2015 05:02:07 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	schnitzeltony@googlemail.com
Date: Wed, 25 Nov 2015 15:05:36 +0200
Message-Id: <b23c413682080d988bd163c6df0f439cd41ae7ad.1448455166.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1448455166.git.jussi.kukkonen@intel.com>
References: <cover.1448455166.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/5] connman-gnome: rrecommend connman, don't rdepend
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
X-List-Received-Date: Wed, 25 Nov 2015 13:02:11 -0000

connman-gnome doesn't have a binary dependency on connman, and using
RRECOMMEND is better for multilib builds (connman-gnome works fine
with connman from a different architecture).

Fixes [YOCTO #8586]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-connectivity/connman/connman-gnome_0.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 7b875f0..1849dbd 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 inherit autotools-brokensep gtk-icon-cache pkgconfig distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
-RDEPENDS_${PN} = "connman"
+RRECOMMENDS_${PN} = "connman"
 
 do_install_append() {
     install -m 0644 ${WORKDIR}/images/* ${D}/usr/share/icons/hicolor/22x22/apps/
-- 
2.1.4


