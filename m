Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RVt3Z-0002DJ-Qz
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:55:14 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Nov 2011 14:48:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,272,1320652800"; d="scan'208";a="42682075"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.113])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Nov 2011 14:48:30 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 14:48:28 -0800
Message-Id: <249c7d8f3735815f1fedfa9efd1e384d39afea30.1322693022.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322693022.git.josh@linux.intel.com>
References: <cover.1322693022.git.josh@linux.intel.com>
In-Reply-To: <cover.1322693022.git.josh@linux.intel.com>
References: <cover.1322693022.git.josh@linux.intel.com>
Subject: [PATCH 2/2] distro_tracking_fields: update gthumb and claim some recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 22:55:14 -0000

Update tracking info for gthumb and add untracked recipes mx,
json-glib and xdg-utils - I'm volunteering to maintain these.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   19 +++++++++++++++++--
 1 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 785114d..62e03ed 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5788,9 +5788,24 @@ RECIPE_MAINTAINER_pn-lsbsetup = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libxml-simple-perl = "2.18"
 RECIPE_LATEST_VERSION_pn-talloc = "2.0.5"
+
 RECIPE_STATUS_pn-gthumb = "red"
-RECIPE_LATEST_VERSION_pn-gthumb = "2.12.2"
-RECIPE_MAINTAINER_pn-gthumb = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_LATEST_VERSION_pn-gthumb = "2.12.4"
+RECIPE_LAST_UPDATE_pn-gthumb = "Nov 30, 2011"
+RECIPE_MAINTAINER_pn-gthumb = "Joshua Lock <josh@linux.intel.com>"
+
+RECIPE_LATEST_VERSION_pn-mx = "1.3.2"
+RECIPE_LAST_UPDATE_pn-mx = "Nov 16, 2011"
+RECIPE_MAINTAINER_pn-mx = "Joshua Lock <josh@linux.intel.com>"
+
+RECIPE_LATEST_VERSION_pn-json-glib = "0.14.2"
+RECIPE_LAST_UPDATE_pn-json-glib = "Nov 16, 2011"
+RECIPE_MAINTAINER_pn-json-glib = "Joshua Lock <josh@linux.intel.com>"
+
+RECIPE_LATEST_VERSION_pn-xdg-utils = "1.0.2"
+RECIPE_LAST_UPDATE_pn-xdg-utils = "Nov 16, 2011"
+RECIPE_NO_UPDATE_REASON_pn-xdg-utils = "Latest release is a release candidate - 1.1.0rc1"
+RECIPE_MAINTAINER_pn-xdg-utils = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libtheora = "1.2.0"
 RECIPE_NO_UPDATE_REASON_pn-libtheora = "1.1.1 is latest stable release not 1.2.0alpha1"
-- 
1.7.7.3



