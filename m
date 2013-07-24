Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADA36B276
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 14:08:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2013 07:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,735,1367996400"; d="scan'208";a="350794664"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2013 07:08:00 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 17:15:27 +0300
Message-Id: <88dd1a199ea8f215967f0f73768e18df38932bda.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <99af89e892d80f5ebdbca319decc59aa5e611dfc.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
References: <99af89e892d80f5ebdbca319decc59aa5e611dfc.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374670080.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH v3 04/12] connman-gnome: fix recipe name add GIT revision to PV variable
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
X-List-Received-Date: Wed, 24 Jul 2013 14:08:00 -0000

Git packages should have the following format for the PV variable:
	version_tag+git[r|\-|]?AUTOINC+git_revision

Git recipes should also contain _git token in their name instead of
their version.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../{connman-gnome_0.7.bb => connman-gnome_git.bb} |    2 ++
 1 file changed, 2 insertions(+)
 rename meta/recipes-connectivity/connman/{connman-gnome_0.7.bb => connman-gnome_git.bb} (97%)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_git.bb
similarity index 97%
rename from meta/recipes-connectivity/connman/connman-gnome_0.7.bb
rename to meta/recipes-connectivity/connman/connman-gnome_git.bb
index 6299e70..a755b3c 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_git.bb
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


