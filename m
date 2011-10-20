Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGnV0-0002oE-F9
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 09:57:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 00:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64982239"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 00:51:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 00:51:02 -0700
Message-Id: <9038645773928fc2db5bcee770ee07b08be56eaa.1319096633.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL - v2 26/26] distro-tracking-fields: update fields for tzdata and gst-plugins-good
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
X-List-Received-Date: Thu, 20 Oct 2011 07:57:14 -0000

From: Joshua Lock <josh@linux.intel.com>

These recipes were each updated and so should their tracking data be.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 770f835..1f3540e 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1714,14 +1714,14 @@ RECIPE_LATEST_RELEASE_DATE_pn-udev = "06/2010"
 RECIPE_COMMENTS_pn-udev = "may need different versions for different kernels"
 
 RECIPE_STATUS_pn-tzdata = "green"
-RECIPE_LATEST_VERSION_pn-tzdata = "2011k"
-RECIPE_LATEST_RELEASE_DATE_pn-tzdata = "Sep 26, 2011"
-RECIPE_LAST_UPDATE_pn-tzdata = "Oct 6, 2011"
+RECIPE_LATEST_VERSION_pn-tzdata = "2011l"
+RECIPE_LATEST_RELEASE_DATE_pn-tzdata = "Oct 10, 2011"
+RECIPE_LAST_UPDATE_pn-tzdata = "Oct 18, 2011"
 RECIPE_MAINTAINER_pn-tzdata = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-tzdata = "not done"
 RECIPE_INTEL_SECTION_pn-tzdata = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tzdata = "1 month"
-RECIPE_MANUAL_CHECK_DATE_pn-tzdata = "Oct 6, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-tzdata = "Oct 18, 2011"
 RECIPE_COMMENTS_pn-tzdata = ""
 DISTRO_PN_ALIAS_pn-tzcode = "OSPDT"
 
@@ -2585,11 +2585,11 @@ RECIPE_MAINTAINER_pn-gst-plugins-base = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gst-plugins-good="green"
 DISTRO_PN_ALIAS_pn-gst-plugins-good = "Meego=gst-plugins-good Fedora=gstreamer-plugins-good OpenSuSE=gstreamer-plugins-good Ubuntu=gst-plugins-good0.10 Mandriva=gstreamer0.10-plugins-good Debian=gst-plugins-good0.10"
-RECIPE_LATEST_VERSION_pn-gst-plugins-good="0.10.28"
+RECIPE_LATEST_VERSION_pn-gst-plugins-good="0.10.30"
 RECIPE_NO_OF_PATCHES_pn-gst-plugins-good="0"
-RECIPE_LATEST_RELEASE_DATE_pn-gst-plugins-good="2011/03/08"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-plugins-good="2 month"
-RECIPE_LAST_UPDATE_pn-gst-plugins-good = "Apr 15, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-gst-plugins-good="Jun 15, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-plugins-good="1 month"
+RECIPE_LAST_UPDATE_pn-gst-plugins-good = "Oct 19, 2011"
 RECIPE_MAINTAINER_pn-gst-plugins-good = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gst-plugins-ugly="green"
-- 
1.7.6.2



