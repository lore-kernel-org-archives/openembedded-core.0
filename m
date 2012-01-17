Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4ax-0006h6-Ci
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:44 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632961"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:15 -0800
Message-Id: <bf7a691c3ddce7cea7424705eb579e4113998688.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 30/62] distro_tracking_fields.inc: Modify the status of eds-tools and mingetty
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:45 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Update the status of eds-tools and mingetty.
mingetty has still not been updated since 2008.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>

[Fixed Date format]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 974f8f0..614d980 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -79,7 +79,8 @@ RECIPE_MAINTAINER_pn-meta-ide-support = "Joshua Lock <joshua.lock@intel.com>"
 
 RECIPE_STATUS_pn-mingetty = "red"
 RECIPE_LATEST_VERSION_pn-mingetty = "1.08"
-RECIPE_LAST_UPDATE_pn-mingetty = "Sep 1, 2010"
+RECIPE_LAST_UPDATE_pn-mingetty = "Jan 1, 2008"
+RECIPE_MANUAL_CHECK_DATE_pn-mingetty = "Jan 12, 2012"
 RECIPE_MAINTAINER_pn-mingetty = "Xiaofeng.Yan <xiaofeng@windriver.com>"
 
 RECIPE_STATUS_pn-minicom = "green"
@@ -5752,8 +5753,8 @@ DISTRO_PN_ALIAS_pn-table = "Intel"
 RECIPE_STATUS_pn-eds-tools = "red"
 DISTRO_PN_ALIAS_pn-eds-tools = "OpenedHand"
 RECIPE_LATEST_VERSION_pn-eds-tools = "git"
-RECIPE_LAST_UPDATE_pn-eds-tools = "Sep 12, 2007"
-RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "Nov 25, 2011"
+RECIPE_LAST_UPDATE_pn-eds-tools = "Oct 10, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "Jan 12, 2012"
 RECIPE_MAINTAINER_pn-eds-tools = "Wenzong Fan <wenzong.fan@windriver.com>"
 
 RECIPE_STATUS_pn-abiword-embedded = "red"
-- 
1.7.6.5



