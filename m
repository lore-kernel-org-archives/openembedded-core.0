Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qy6wW-00008A-BQ
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 20:52:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Aug 2011 11:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,297,1312182000"; d="scan'208";a="12194774"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.171])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Aug 2011 11:47:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2011 19:47:20 +0100
Message-Id: <fbd404a3dc57aa14f4e8ba0d594d00f024a3516b.1314643520.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1314643520.git.paul.eggleton@linux.intel.com>
References: <cover.1314643520.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1314643520.git.paul.eggleton@linux.intel.com>
References: <cover.1314643520.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] distro_tracking_fields: update binutils to 2.21.1a
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
X-List-Received-Date: Mon, 29 Aug 2011 18:52:20 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 22042b1..6f1a462 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2876,9 +2876,9 @@ RECIPE_LAST_UPDATE_pn-sysprof = "Dec 8, 2010"
 RECIPE_MAINTAINER_pn-sysprof = "Tom Zanussi <tom.zanussi@intel.com>"
 
 RECIPE_STATUS_pn-binutils="green"
-RECIPE_LATEST_VERSION_pn-binutils="2.21.1"
-RECIPE_LAST_UPDATE_pn-binutils = "Jul 06, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-binutils = "Jul 06, 2011" 
+RECIPE_LATEST_VERSION_pn-binutils="2.21.1a"
+RECIPE_LAST_UPDATE_pn-binutils = "Aug 29, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-binutils = "Aug 29, 2011"
 RECIPE_MAINTAINER_pn-binutils = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-ldconfig-native = "red"
-- 
1.7.4.1



