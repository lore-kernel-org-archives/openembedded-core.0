Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7wvp-0008TJ-FJ
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 23:40:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Apr 2011 14:37:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,319,1299484800"; d="scan'208";a="906923696"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2011 14:37:45 -0700
Message-Id: <84adee72b56f2787f4ab8ed26f0fefa96fdbef8b.1302211549.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302211549.git.sgw@linux.intel.com>
References: <cover.1302211549.git.sgw@linux.intel.com>
Old-Date: Wed, 6 Apr 2011 13:54:33 -0700
Date: Thu, 07 Apr 2011 14:37:45 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 11/11] Update trace-cmd and kernelshark distro_tracking
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
X-List-Received-Date: Thu, 07 Apr 2011 21:40:02 -0000

From: Darren Hart <dvhart@linux.intel.com>

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 5d282fe..8469e96 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -113,11 +113,17 @@ RECIPE_LATEST_VERSION_pn-subversion = "1.6.15"
 RECIPE_MANUAL_CHECK_DATE_pn-subversion = "Jan 25, 2011" 
 RECIPE_MAINTAINER_pn-subversion = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
-RECIPE_STATUS_pn-trace-cmd = "red"
-RECIPE_LATEST_VERSION_pn-trace-cmd = "check"
+RECIPE_STATUS_pn-trace-cmd = "green"
+RECIPE_LATEST_VERSION_pn-trace-cmd = "1.1.1"
 DISTRO_PN_ALIAS_pn-trace-cmd = "Mandriva=trace-cmd Ubuntu=trace-cmd"
-RECIPE_LAST_UPDATE_pn-trace-cmd = "Aug 20, 2010"
-RECIPE_MAINTAINER_pn-trace-cmd = "Bruce"
+RECIPE_LAST_UPDATE_pn-trace-cmd = "Jan 11, 2011"
+RECIPE_MAINTAINER_pn-trace-cmd = "Darren Hart <dvhart@linux.intel.com>"
+
+RECIPE_STATUS_pn-kernelshark = "green"
+RECIPE_LATEST_VERSION_pn-kernelshark = "0.2"
+DISTRO_PN_ALIAS_pn-kernelshark = "Mandriva=kernelshark Ubuntu=kernelshark"
+RECIPE_LAST_UPDATE_pn-kernelshark = "Jan 11, 2011"
+RECIPE_MAINTAINER_pn-kernelshark = "Darren Hart <dvhart@linux.intel.com>"
 
 RECIPE_STATUS_pn-web = "green"
 RECIPE_LATEST_VERSION_pn-web = "0.0+svnr129"
-- 
1.7.1



