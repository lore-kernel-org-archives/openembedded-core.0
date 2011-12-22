Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddbt-0005N8-S9
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:42 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233726"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:07 -0800
Message-Id: <83c2a7660c0ae9c5e37ecdda73be5a5c32535ec9.1324540322.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/26] distro tracking: update man-pages, gts-plugin-bluetooth, usbutils,
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:42 -0000

and libcap

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   25 ++++++++++++++-----
 1 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index ba261be..fc54e33 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -531,14 +531,15 @@ RECIPE_INTEL_SECTION_pn-attr = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-attr = "Aug 01, 2009"
 
 RECIPE_STATUS_pn-libcap = "yellow"   # hand crafted Makefiles
-RECIPE_LAST_UPDATE_pn-libcap = "Jul 7, 2010"
+RECIPE_LATEST_VERSION_pn-libcap = "2.22"
+RECIPE_LATEST_RELEASE_DATE_pn-libcap = "Jan 01, 2010"
+RECIPE_LAST_UPDATE_pn-libcap = "Jul 25, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libcap = "Dec 15, 2011"
 RECIPE_MAINTAINER_pn-libcap = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libcap = "done"
-RECIPE_LATEST_VERSION_pn-libcap = "2.19"
 RECIPE_INTEL_SECTION_pn-libcap = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libcap = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-libcap = "Jan 01, 2010"
-RECIPE_COMMENTS_pn-libcap = ""
+RECIPE_COMMENTS_pn-libcap = "Not available on kernel.org right now"
 
 RECIPE_STATUS_pn-libevent = "green"
 RECIPE_LAST_UPDATE_pn-libevent = "Jul 7, 2010"
@@ -1795,15 +1796,15 @@ RECIPE_MANUAL_CHECK_DATE_pn-util-linux = "Dec 01, 2011"
 RECIPE_COMMENTS_pn-util-linux = "kernel.org still has this off-line"
 
 RECIPE_STATUS_pn-usbutils = "green"
+RECIPE_LATEST_VERSION_pn-usbutils = "0.91"
+RECIPE_LATEST_RELEASE_DATE_pn-usbutils = "Oct 22, 2010"
 RECIPE_LAST_UPDATE_pn-usbutils = "May 20, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-usbutils = "May 24, 2011"
 RECIPE_MAINTAINER_pn-usbutils = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-usbutils = "done"
-RECIPE_LATEST_VERSION_pn-usbutils = "0.91"
 RECIPE_INTEL_SECTION_pn-usbutils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-usbutils = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-usbutils = "Oct 22, 2010"
 RECIPE_COMMENTS_pn-usbutils = ""
-RECIPE_MANUAL_CHECK_DATE_pn-usbutils = "May 24, 2011"
 
 RECIPE_STATUS_pn-pciutils = "yellow"    # custom build system, several hacks
 RECIPE_LAST_UPDATE_pn-pciutils = "Nov 10, 2010"
@@ -5828,9 +5829,19 @@ RECIPE_LAST_UPDATE_pn-libgdata = "Dec 29, 2010"
 RECIPE_MAINTAINER_pn-libgdata = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_LATEST_VERSION_pn-man-pages = "3.32"
+RECIPE_LATEST_RELEASE_DATE_pn-man-pages = "Sep 02, 2011"
+RECIPE_LAST_UPDATE_pn-man-pages = "Dec 29, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-man-pages = "Dec 15, 2011"
+RECIPE_COMMENTS_pn-man-pages = "Kernel.org is down"
 RECIPE_LATEST_VERSION_pn-sysprof = "6b5b8432711ef5c747f8375073cd9af88922d3c6"
 RECIPE_LATEST_VERSION_pn-table = "d42a44938699ee30a998fc42bc149aebf69389db"
 
+RECIPE_LATEST_VERSION_pn-gst-plugin-bluetooh = "4.96"
+RECIPE_LATEST_RELEASE_DATE_pn-gst-plugin-bluetooh = "Sep 02, 2011"
+RECIPE_LAST_UPDATE_pn-gst-plugin-bluetooh = "Dec 29, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-gst-plugin-bluetooh = "Dec 15, 2011"
+RECIPE_COMMENTS_pn-gst-plugin-bluetooth = "Kernel.org is down"
+
 RECIPE_STATUS_pn-qmmp = "green"
 RECIPE_LATEST_VERSION_pn-qmmp = "0.5.2"
 RECIPE_LATEST_RELEASE_DATE_pn-qmmp = "Sep 02, 2011"
-- 
1.7.6.4



