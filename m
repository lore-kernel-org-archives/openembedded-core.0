Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QUXHE-00062A-N0
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 06:55:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Jun 2011 21:52:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,340,1304319600"; 
   d="scan'208";a="9690425"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by azsmga001.ch.intel.com with ESMTP; 08 Jun 2011 21:52:09 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 13:01:38 +0800
Message-Id: <1979b63659a98ef7a1238e54b9ee7037d2beca0a.1307595269.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <cover.1307595269.git.lei.mei@intel.com>
References: <cover.1307595269.git.lei.mei@intel.com>
In-Reply-To: <cover.1307595269.git.lei.mei@intel.com>
References: <cover.1307595269.git.lei.mei@intel.com>
Subject: [PATCH 1/1] distro_tracking_fields.inc: Fix a incorrect date format
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
X-List-Received-Date: Thu, 09 Jun 2011 04:55:29 -0000

One incorrect date format caused a checking failure in package report system.

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 38e0c4d..8e8453e 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5747,7 +5747,7 @@ RECIPE_MANUAL_CHECK_DATE_pn-alsa-tools = "Jun 7, 2011"
 
 RECIPE_STATUS_pn-mesa-demos = "red"
 RECIPE_LATEST_VERSION_pn-mesa-demos = "8.0.1"
-RECIPE_LAST_UPDATE_pn-mesa-demos = "July 13, 2010"
+RECIPE_LAST_UPDATE_pn-mesa-demos = "Jul 13, 2010"
 RECIPE_MANUAL_CHECK_DATE_pn-mesa-demos = "Jun 7, 2011" 
 
 RECIPE_STATUS_pn-gettext = "red"
-- 
1.6.3.3



