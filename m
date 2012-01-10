Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RkTLX-0006WX-Nw
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 05:30:05 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 20:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105343488"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jan 2012 20:22:33 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 12:22:33 +0800
Message-Id: <6bf0833652d572e4de886d0e7f2725ad8da0ff84.1326169288.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1326169288.git.dexuan.cui@intel.com>
References: <cover.1326169288.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1326169288.git.dexuan.cui@intel.com>
References: <cover.1326169288.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] distro_tracking_fields.inc: upgrade tcf-agent
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
X-List-Received-Date: Tue, 10 Jan 2012 04:30:05 -0000

Upgraded the field RECIPE_MANUAL_CHECK_DATE.
Also changed the MAINTAINER to Lianhao who volunteered to take the recipe.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index cc87d5c..d1f0c82 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2891,8 +2891,8 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tcf-agent = "1+ years"
 RECIPE_LATEST_RELEASE_DATE_pn-tcf-agent = "Jul 07, 2011"
 RECIPE_COMMENTS_pn-tcf-agent = ""
 RECIPE_LAST_UPDATE_pn-tcf-agent = "Jul 21, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent = "Nov 17, 2011"
-RECIPE_MAINTAINER_pn-tcf-agent = "Dexuan Cui <dexuan.cui@intel.com>"
+RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent = "Jan 10, 2011"
+RECIPE_MAINTAINER_pn-tcf-agent = "Lianhao Lu <lianhao.lu@intel.com>"
 
 RECIPE_STATUS_pn-liburcu = "green"
 DISTRO_PN_ALIAS_pn-liburcu = "Fedora=userspace-rcu Ubuntu=liburcu0"
-- 
1.7.6



