Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 12C2171F1D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 15:07:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 16 Feb 2015 06:59:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,588,1418112000"; d="scan'208";a="528207466"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga003.jf.intel.com with ESMTP; 16 Feb 2015 06:58:03 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Feb 2015 17:06:15 +0200
Message-Id: <316d58d88cb7bd70e0aea24cd3a8a64c896de50c.1424098977.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424098977.git.cristian.iorga@intel.com>
References: <cover.1424098977.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1424098977.git.cristian.iorga@intel.com>
References: <cover.1424098977.git.cristian.iorga@intel.com>
Subject: [PATCH 05/11] neard: select distro preference for bluez provider
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
 meta/recipes-connectivity/neard/neard.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard.inc b/meta/recipes-connectivity/neard/neard.inc
index 31bc6dd..6b6b1da 100644
--- a/meta/recipes-connectivity/neard/neard.inc
+++ b/meta/recipes-connectivity/neard/neard.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
  file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
  "
 
-inherit autotools pkgconfig systemd update-rc.d
+inherit autotools pkgconfig systemd update-rc.d bluetooth
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
@@ -45,7 +45,7 @@ RDEPENDS_${PN} = "dbus python python-dbus python-pygobject"
 
 # Bluez & Wifi are not mandatory except for handover
 RRECOMMENDS_${PN} = "\
-                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)} \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
                      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
                     "
 
-- 
2.1.0


