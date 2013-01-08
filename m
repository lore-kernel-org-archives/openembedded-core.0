Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TsaRr-0000TZ-Cr
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 15:46:53 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Jan 2013 06:31:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,430,1355126400"; d="scan'208";a="188863184"
Received: from unknown (HELO localhost) ([10.255.14.51])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Jan 2013 06:31:29 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 08:31:22 -0600
Message-Id: <8cdd9aa5967fd00620c906fd8135ce6714d1bbed.1357655073.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <e47be218eb0e9f08110720f412a517226670d0d0.1357655073.git.tom.zanussi@intel.com>
References: <e47be218eb0e9f08110720f412a517226670d0d0.1357655073.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1357655073.git.tom.zanussi@intel.com>
References: <cover.1357655073.git.tom.zanussi@intel.com>
Subject: [PATCH 5/5] recipe_color.inc: add lttng recipes
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

Add entries for the new lttng-2.0 recipes lttng-modules, lttng-tools,
and babeltrace, to maintain consistency.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta-yocto/conf/distro/include/recipe_color.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-yocto/conf/distro/include/recipe_color.inc b/meta-yocto/conf/distro/include/recipe_color.inc
index 2c9a5c6..9402a93 100644
--- a/meta-yocto/conf/distro/include/recipe_color.inc
+++ b/meta-yocto/conf/distro/include/recipe_color.inc
@@ -250,7 +250,10 @@ RECIPE_COLOR_pn-lighttpd = "yellow"
 RECIPE_COLOR_pn-linuxdoc-tools = "yellow"
 RECIPE_COLOR_pn-loudmouth = "red"
 RECIPE_COLOR_pn-lrzsz="yellow"
+RECIPE_COLOR_pn-lttng-modules = "yellow"
+RECIPE_COLOR_pn-lttng-tools = "yellow"
 RECIPE_COLOR_pn-lttng-ust = "yellow"
+RECIPE_COLOR_pn-babeltrace = "yellow"
 RECIPE_COLOR_pn-makedevs = "yellow"
 RECIPE_COLOR_pn-man = "red"
 RECIPE_COLOR_pn-man-pages = "red"
-- 
1.7.11.4



