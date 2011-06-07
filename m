Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTqLf-0003ik-74
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 09:05:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jun 2011 00:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,331,1304319600"; 
   d="scan'208";a="8298990"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 07 Jun 2011 00:01:51 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2011 00:01:37 -0700
Message-Id: <1866af3863d544cce34933407c34b6543f040568.1307429530.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [CONSOLIDATED PULL 01/13] distro-tracking: updates
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
X-List-Received-Date: Tue, 07 Jun 2011 07:05:11 -0000

From: Scott Garman <scott.a.garman@intel.com>

Update the distro tracking fields for:

* apmd
* at
* blktool
* cpio
* dosfstools
* gzip
* libatomics-ops
* shadow

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   34 +++++++++++--------
 1 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 73e6782..cd1ee9d 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -817,7 +817,7 @@ RECIPE_NO_OF_PATCHES_pn-blktool = "0"
 RECIPE_INTEL_SECTION_pn-blktool = "base utils"
 RECIPE_LATEST_RELEASE_DATE_pn-blktool = "02/2010"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-blktool = "3 years"
-RECIPE_LAST_UPDATE_pn-blktool = "Jan 4, 2011"
+RECIPE_LAST_UPDATE_pn-blktool = "Jun 4, 2011"
 RECIPE_MAINTAINER_pn-blktool = "Scott Garman <scott.a.garman@intel.com>"
 DISTRO_PN_ALIAS_pn-blktool = "Debian=blktool Mandriva=blktool"
 
@@ -910,7 +910,7 @@ RECIPE_INTEL_SECTION_pn-apmd = "base utils"
 RECIPE_LATEST_RELEASE_DATE_pn-apmd = "07/2009"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-apmd = "1 year"
 RECIPE_COMMENTS_pn-apmd = ""
-RECIPE_LAST_UPDATE_pn-apmd = "Jan 4, 2011"
+RECIPE_LAST_UPDATE_pn-apmd = "Jun 4, 2011"
 RECIPE_MAINTAINER_pn-apmd = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-gperf = "green"
@@ -1010,9 +1010,13 @@ RECIPE_LAST_UPDATE_pn-screen = "Aug 31, 2010"
 RECIPE_MAINTAINER_pn-screen = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-gzip = "green"
-RECIPE_LAST_UPDATE_pn-gzip = "Jul 23, 2010"
-RECIPE_MAINTAINER_pn-gzip = "Scott Garman <scott.a.garman@intel.com>"
+RECIPE_DEPENDENCY_CHECK_pn-gzip = "not done"
 RECIPE_LATEST_VERSION_pn-gzip = "1.4"
+RECIPE_NO_OF_PATCHES_pn-gzip = "0"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gzip = "4 months"
+RECIPE_LATEST_RELEASE_DATE_pn-gzip = "Jan 20, 2010"
+RECIPE_LAST_UPDATE_pn-gzip = "Jun 4, 2011"
+RECIPE_MAINTAINER_pn-gzip = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-iptables = "green"
 RECIPE_LAST_UPDATE_pn-iptables = "Nov 10, 2010"
@@ -1032,13 +1036,12 @@ RECIPE_LATEST_VERSION_pn-net-tools = "1.60-23"
 
 RECIPE_STATUS_pn-shadow = "green"
 RECIPE_DEPENDENCY_CHECK_pn-shadow = "not done"
-RECIPE_LAST_UPDATE_pn-shadow = "Aug 6, 2010"
-RECIPE_MAINTAINER_pn-shadow = "Scott Garman <scott.a.garman@intel.com>"
-RECIPE_LATEST_VERSION_pn-shadow = "4.1.4.2"
+RECIPE_LATEST_VERSION_pn-shadow = "4.1.4.3"
 RECIPE_INTEL_SECTION_pn-shadow = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-shadow = "2 months"
-RECIPE_LATEST_RELEASE_DATE_pn-shadow = "07/2009"
-RECIPE_COMMENTS_pn-formfactor = ""
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-shadow = "7 months"
+RECIPE_LATEST_RELEASE_DATE_pn-shadow = "Feb 15, 2011"
+RECIPE_LAST_UPDATE_pn-shadow = "Jun 4, 2011"
+RECIPE_MAINTAINER_pn-shadow = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-coreutils = "green"
 RECIPE_LAST_UPDATE_pn-coreutils = "Jan 20, 2011"
@@ -1123,7 +1126,7 @@ RECIPE_INTEL_SECTION_pn-libatomics-ops = "optional"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libatomics-ops = "unknown"
 RECIPE_LATEST_RELEASE_DATE_pn-libatomics-ops = "unknown"
 DISTRO_PN_ALIAS_pn-libatomics-ops = "Meego=libatomic-ops Debian=libatomic-ops Ubuntu=libatomic-ops OpenSuSE=libatomic-ops Mandriva=libatomic-ops"
-RECIPE_LAST_UPDATE_pn-libatomics-ops = "Nov 22, 2010"
+RECIPE_LAST_UPDATE_pn-libatomics-ops = "Jun 4, 2011"
 RECIPE_MAINTAINER_pn-libatomics-ops = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-libffi  = "red"
@@ -1162,8 +1165,11 @@ RECIPE_LAST_UPDATE_pn-chrpath = "Dec 15, 2009"
 RECIPE_MAINTAINER_pn-chrpath = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-dosfstools = "red"
+RECIPE_DEPENDENCY_CHECK_pn-dosfstools = "not done"
 RECIPE_LATEST_VERSION_pn-dosfstools = "2.11"
-RECIPE_LAST_UPDATE_pn-dosfstools = "Oct 11, 2007"
+RECIPE_LATEST_RELEASE_DATE_pn-dosfstools = "Mar 12, 2005"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dosfstools = "15 months"
+RECIPE_LAST_UPDATE_pn-dosfstools = "Jun 4, 2011"
 RECIPE_MAINTAINER_pn-dosfstools = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-eee-acpi-scripts = "green"
@@ -1949,7 +1955,7 @@ RECIPE_INTEL_SECTION_pn-at = "base"
 RECIPE_NO_OF_PATCHES_pn-at = "3"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-at = "13 months"
 RECIPE_LATEST_RELEASE_DATE_pn-at = "11/2009"
-RECIPE_LAST_UPDATE_pn-at = "Jul 23, 2010"
+RECIPE_LAST_UPDATE_pn-at = "Jun 4, 2011"
 RECIPE_MAINTAINER_pn-at = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-cpio = "green"
@@ -1959,7 +1965,7 @@ RECIPE_INTEL_SECTION_pn-cpio = "base"
 RECIPE_NO_OF_PATCHES_pn-cpio = "0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-cpio = "9 months"
 RECIPE_LATEST_RELEASE_DATE_pn-cpio = "03/2010"
-RECIPE_LAST_UPDATE_pn-cpio = "Sep 25, 2010"
+RECIPE_LAST_UPDATE_pn-cpio = "Jun 4, 2011"
 RECIPE_MAINTAINER_pn-cpio = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-cronie = "green"
-- 
1.7.3.4



