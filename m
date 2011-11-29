Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8J-0005pV-8y
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:43 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:26:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419478"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:26:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:51 -0800
Message-Id: <986b2e3870b2f152b6ceecca4f0418c79edf9a4c.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/23] distro_tracking: update tracking fields for gettext and eds-tools
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:44 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

Add maintainer and update manual_check_date, status fields.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index b95578c..df776c9 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5707,10 +5707,10 @@ DISTRO_PN_ALIAS_pn-table = "Intel"
 
 RECIPE_STATUS_pn-eds-tools = "red"
 DISTRO_PN_ALIAS_pn-eds-tools = "OpenedHand"
-RECIPE_LATEST_VERSION_pn-eds-tools = "bzr"
+RECIPE_LATEST_VERSION_pn-eds-tools = "git"
 RECIPE_LAST_UPDATE_pn-eds-tools = "Sep 12, 2007"
-RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "Nov 08, 2011"
-RECIPE_NO_UPDATE_REASON_pn-eds-tools = "Possibly convert to GIT based fetch"
+RECIPE_MANUAL_CHECK_DATE_pn-eds-tools = "Nov 25, 2011"
+RECIPE_MAINTAINER_pn-eds-tools = "Wenzong Fan <wenzong.fan@windriver.com>"
 
 RECIPE_STATUS_pn-abiword-embedded = "red"
 DISTRO_PN_ALIAS_pn-abiword-embedded = "Fedora=abiword Ubuntu=abiword"
@@ -6017,11 +6017,12 @@ RECIPE_LATEST_VERSION_pn-mesa-demos = "8.0.1"
 RECIPE_LAST_UPDATE_pn-mesa-demos = "Jul 13, 2010"
 RECIPE_MANUAL_CHECK_DATE_pn-mesa-demos = "Jun 7, 2011" 
 
-RECIPE_STATUS_pn-gettext = "red"
+RECIPE_STATUS_pn-gettext = "green"
 RECIPE_LATEST_VERSION_pn-gettext = "0.18.1.1"
 RECIPE_LATEST_RELEASE_DATE_pn-gettext = "Jun 06, 2010"
 RECIPE_LAST_UPDATE_pn-gettext = "May 24, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-gettext = "Sep 29, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-gettext = "Nov 25, 2011"
+RECIPE_MAINTAINER_pn-gettext = "Wenzong Fan <wenzong.fan@windriver.com>"
 
 RECIPE_STATUS_pn-pseudo = "green"
 RECIPE_LATEST_VERSION_pn-pseudo = "1.2"
-- 
1.7.6.4



