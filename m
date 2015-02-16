Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C53F371F1D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 15:07:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 16 Feb 2015 06:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,588,1418112000"; d="scan'208";a="528207443"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga003.jf.intel.com with ESMTP; 16 Feb 2015 06:58:02 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Feb 2015 17:06:14 +0200
Message-Id: <d909dcc616fab16a58a76079542759f56b6a217a.1424098977.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424098977.git.cristian.iorga@intel.com>
References: <cover.1424098977.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1424098977.git.cristian.iorga@intel.com>
References: <cover.1424098977.git.cristian.iorga@intel.com>
Subject: [PATCH 04/11] qt-mobility: select distro preference for bluez provider
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
X-List-Received-Date: Mon, 16 Feb 2015 15:07:14 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index ae1769d..b3d23d4 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -1,9 +1,11 @@
 HOMEPAGE = "http://qt-project.org/"
 DEPENDS = "gstreamer util-linux"
 
+inherit bluetooth
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
-PACKAGECONFIG[bluetooth] = ",,bluez4"
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
+PACKAGECONFIG[bluez4] = ",,bluez4"
 PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
 
 LICENSE = "LGPLv2.1"
-- 
2.1.0


