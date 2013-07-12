Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0B81F60896
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 15:04:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2013 08:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,653,1367996400"; d="scan'208";a="344585554"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2013 08:03:16 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 18:10:33 +0300
Message-Id: <d435ed5e673366f82fe756e9c61a4795b1e164dc.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <03982e313990aad86cd24f5cbcb4994448ab58a0.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
References: <03982e313990aad86cd24f5cbcb4994448ab58a0.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1373641734.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH 5/6] connman-gnome: add PV variable into recipe
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
X-List-Received-Date: Fri, 12 Jul 2013 15:04:39 -0000

Git packages should include git token inside the PV variable.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../connman/connman-gnome_0.7.bb                   |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 6299e70..a755b3c 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -10,6 +10,8 @@ DEPENDS = "gtk+ dbus-glib intltool-native"
 
 # 0.7 tag
 SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
+PV = "0.7+git${SRCPV}"
+
 SRC_URI = "git://github.com/connectivity/connman-gnome.git;protocol=git \
 	   file://0001-Removed-icon-from-connman-gnome-about-applet.patch \
 	   file://images/* \
-- 
1.7.9.5


