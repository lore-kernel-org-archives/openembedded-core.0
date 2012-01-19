Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoL6-0004od-Qy
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:31:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:23:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472149"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:23:07 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:53 -0800
Message-Id: <b9031e3261c74e36437b66bcb8df53448d0c78e6.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 32/33] distro-tracking: add data for newer recipes
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
X-List-Received-Date: Thu, 19 Jan 2012 09:31:25 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 0aed343..90924ed 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -37,6 +37,27 @@ RECIPE_MANUAL_CHECK_DATE_pn-libpcre = "Jan 10, 2012"
 RECIPE_MAINTAINER_pn-libpcre = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-libpcre = "Mandriva=libpcre0 Fedora=pcre"
 
+RECIPE_LATEST_VERSION_pn-bdwgc = "20110107"
+RECIPE_LAST_UPDATE_pn-bdwgc = "Jan 17, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-bdwgc = "Jan 17, 2012"
+RECIPE_MAINTAINER_pn-bdwgc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+
+RECIPE_LATEST_VERSION_pn-libunistring = "0.9.3"
+RECIPE_LAST_UPDATE_pn-libunistring = "Jan 17, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libunistring = "Jan 17, 2012"
+RECIPE_MAINTAINER_pn-libunistring = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+
+RECIPE_LATEST_VERSION_pn-guile = "2.0.3"
+RECIPE_LAST_UPDATE_pn-guile = "Jan 17, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-guile = "Jan 17, 2012"
+RECIPE_MAINTAINER_pn-guile = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+
+RECIPE_LATEST_VERSION_pn-autogen = "5.12"
+RECIPE_NO_UPDATE_REASON_pn-autogen = "newer versions are dumping core while building, and no distro has picked up the newer versions yet"
+RECIPE_LAST_UPDATE_pn-autogen = "Jan 17, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-autogen = "Jan 17, 2012"
+RECIPE_MAINTAINER_pn-autogen = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+
 RECIPE_STATUS_pn-libsoup = "red"
 RECIPE_LATEST_VERSION_pn-libsoup = "check"
 RECIPE_LAST_UPDATE_pn-libsoup = "Sep 22, 2008"
-- 
1.7.6.5



