Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R94Ls-0001OC-SQ
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 02:19:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Sep 2011 17:14:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,458,1312182000"; d="scan'208";a="71858356"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.50])
	by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2011 17:14:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 17:14:18 -0700
Message-Id: <6381d369f242bf74045fbb0a7db568ecaa79742e.1317255206.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317255206.git.sgw@linux.intel.com>
References: <cover.1317255206.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317255206.git.sgw@linux.intel.com>
References: <cover.1317255206.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] distro_tracking: Fix Month typo
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
X-List-Received-Date: Thu, 29 Sep 2011 00:19:49 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 47fa7bf..f91a923 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -419,7 +419,7 @@ RECIPE_INTEL_SECTION_pn-readline = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-readline = "11 months"
 RECIPE_LATEST_RELEASE_DATE_pn-readline = "Feb 13, 2011"
 RECIPE_COMMENTS_pn-readline = ""
-RECIPE_MANUAL_CHECK_DATE_pn-readline = "Sept 27, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-readline = "Sep 27, 2011"
 
 RECIPE_STATUS_pn-libgcrypt = "green"
 RECIPE_LAST_UPDATE_pn-libgcrypt = "Jul 29, 2010"
-- 
1.7.6



