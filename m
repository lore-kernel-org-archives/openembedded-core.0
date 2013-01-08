Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TsaRs-0000Tj-8L
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 15:46:53 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jan 2013 06:30:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,430,1355126400"; d="scan'208";a="269277010"
Received: from unknown (HELO localhost) ([10.255.14.51])
	by orsmga002.jf.intel.com with ESMTP; 08 Jan 2013 06:31:28 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 08:31:21 -0600
Message-Id: <498933f77996df0cf9fa92b38358086bef6ce22c.1357655073.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <e47be218eb0e9f08110720f412a517226670d0d0.1357655073.git.tom.zanussi@intel.com>
References: <e47be218eb0e9f08110720f412a517226670d0d0.1357655073.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1357655073.git.tom.zanussi@intel.com>
References: <cover.1357655073.git.tom.zanussi@intel.com>
Subject: [PATCH 4/5] lttng: remove references to legacy lttng recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 14:47:01 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

'legacy' lttng was removed, so we need to remove the references to
the legacy lttng recipes, namely lttng-control and lttng-viewer.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta-yocto/conf/distro/include/distro_alias.inc | 2 --
 meta-yocto/conf/distro/include/maintainers.inc  | 2 --
 meta-yocto/conf/distro/include/recipe_color.inc | 2 --
 3 files changed, 6 deletions(-)

diff --git a/meta-yocto/conf/distro/include/distro_alias.inc b/meta-yocto/conf/distro/include/distro_alias.inc
index 1994e27..879ae60 100644
--- a/meta-yocto/conf/distro/include/distro_alias.inc
+++ b/meta-yocto/conf/distro/include/distro_alias.inc
@@ -221,11 +221,9 @@ DISTRO_PN_ALIAS_pn-lsbinitscripts = "Windriver"
 DISTRO_PN_ALIAS_pn-lsbsetup = "Windriver"
 DISTRO_PN_ALIAS_pn-lsbtest = "Windriver"
 DISTRO_PN_ALIAS_pn-ltp = "Ubuntu=ltp"
-DISTRO_PN_ALIAS_pn-lttng-control = "OSPDT upstream=http://lttng.org/"
 DISTRO_PN_ALIAS_pn-lttng-modules = "OSPDT upstream=http://lttng.org/"
 DISTRO_PN_ALIAS_pn-lttng-tools = "OSPDT upstream=http://lttng.org/"
 DISTRO_PN_ALIAS_pn-lttng-ust = "OSPDT upstream=http://lttng.org/"
-DISTRO_PN_ALIAS_pn-lttng-viewer = "OSPDT upstream=http://lttng.org/"
 DISTRO_PN_ALIAS_pn-makedepend = "Mandriva=makedepend Ubuntu=xutils-dev"
 DISTRO_PN_ALIAS_pn-makedevs = "OE-Core"
 DISTRO_PN_ALIAS_pn-matchbox-config-gtk = "OpenedHand"
diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
index 6de57dc..69595b3 100644
--- a/meta-yocto/conf/distro/include/maintainers.inc
+++ b/meta-yocto/conf/distro/include/maintainers.inc
@@ -490,11 +490,9 @@ RECIPE_MAINTAINER_pn-lsbtest = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-lsb = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-lsof = "Bogdan Marinescu <bogdan.a.marinescu@intel.com>"
 RECIPE_MAINTAINER_pn-ltp = "Mihai Lindner <mihaix.lindner@linux.intel.com>"
-RECIPE_MAINTAINER_pn-lttng-control = "Bogdan Marinescu <bogdan.a.marinescu@intel.com>"
 RECIPE_MAINTAINER_pn-lttng-modules = "Bogdan Marinescu <bogdan.a.marinescu@intel.com>"
 RECIPE_MAINTAINER_pn-lttng-tools = "Bogdan Marinescu <bogdan.a.marinescu@intel.com>"
 RECIPE_MAINTAINER_pn-lttng-ust = "Bogdan Marinescu <bogdan.a.marinescu@intel.com>"
-RECIPE_MAINTAINER_pn-lttng-viewer = "Constantin Musca <constantinx.musca@intel.com>"
 RECIPE_MAINTAINER_pn-lzop-native = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-lzop = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-lzo = "Radu Moisan <radu.moisan@intel.com>"
diff --git a/meta-yocto/conf/distro/include/recipe_color.inc b/meta-yocto/conf/distro/include/recipe_color.inc
index 012f5e2..2c9a5c6 100644
--- a/meta-yocto/conf/distro/include/recipe_color.inc
+++ b/meta-yocto/conf/distro/include/recipe_color.inc
@@ -250,9 +250,7 @@ RECIPE_COLOR_pn-lighttpd = "yellow"
 RECIPE_COLOR_pn-linuxdoc-tools = "yellow"
 RECIPE_COLOR_pn-loudmouth = "red"
 RECIPE_COLOR_pn-lrzsz="yellow"
-RECIPE_COLOR_pn-lttng-control = "yellow"
 RECIPE_COLOR_pn-lttng-ust = "yellow"
-RECIPE_COLOR_pn-lttng-viewer = "yellow"
 RECIPE_COLOR_pn-makedevs = "yellow"
 RECIPE_COLOR_pn-man = "red"
 RECIPE_COLOR_pn-man-pages = "red"
-- 
1.7.11.4



