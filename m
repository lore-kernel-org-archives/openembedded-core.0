Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkUmm-00042N-36
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 07:02:16 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 21:54:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110535270"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.28])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2012 21:54:23 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2012 21:54:16 -0800
Message-Id: <306378b612418ba777b34f3c903b8053a27b47df.1326174744.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 22/22] distro_tracking_fields.inc: upgrade tcf-agent
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
X-List-Received-Date: Tue, 10 Jan 2012 06:04:36 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Upgraded the field RECIPE_MANUAL_CHECK_DATE.
Also changed the MAINTAINER to Lianhao who volunteered to take the recipe.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index bc61353..c0bfe8a 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2891,8 +2891,8 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tcf-agent = "1+ years"
 RECIPE_LATEST_RELEASE_DATE_pn-tcf-agent = "Jul 07, 2011"
 RECIPE_COMMENTS_pn-tcf-agent = ""
 RECIPE_LAST_UPDATE_pn-tcf-agent = "Jul 21, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent = "Nov 17, 2011"
-RECIPE_MAINTAINER_pn-tcf-agent = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent = "Jan 10, 2012"
+RECIPE_MAINTAINER_pn-tcf-agent = "Lianhao Lu <lianhao.lu@intel.com>"
 
 RECIPE_STATUS_pn-liburcu = "green"
 DISTRO_PN_ALIAS_pn-liburcu = "Fedora=userspace-rcu Ubuntu=liburcu0"
-- 
1.7.6.5



