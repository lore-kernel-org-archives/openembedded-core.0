Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1Qswal-0007QH-64
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 14:48:32 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Aug 2011 05:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="37873750"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 15 Aug 2011 05:43:53 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2011 20:40:45 +0800
Message-Id: <9751eb3a0aca3cfb81dcadf615bcea50f392929a.1313411859.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1313411858.git.edwin.zhai@intel.com>
References: <cover.1313411858.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1313411858.git.edwin.zhai@intel.com>
References: <cover.1313411858.git.edwin.zhai@intel.com>
Subject: [PATCH 1/2] distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade.
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
X-List-Received-Date: Mon, 15 Aug 2011 12:48:32 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   48 ++++++++++---------
 1 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 3a3991d..c7e5db5 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -199,18 +199,19 @@ RECIPE_INTEL_SECTION_pn-libgpg-error = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libgpg-error = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-libgpg-error = "07/2010"
 RECIPE_COMMENTS_pn-libgpg-error = ""
+RECIPE_MANUAL_CHECK_DATE_pn-libgpg-error = "July 28, 2011"
 RECIPE_LAST_UPDATE_pn-libgpg-error = "Nov 18, 2010"
 RECIPE_MAINTAINER_pn-libgpg-error = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-gpgme = "green"
 RECIPE_DEPENDENCY_CHECK_pn-gpgme = "not done"
-RECIPE_LATEST_VERSION_pn-gpgme = "1.3.0"
+RECIPE_LATEST_VERSION_pn-gpgme = "1.3.1"
 RECIPE_INTEL_SECTION_pn-gpgme = "base libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gpgme = "6 months"
-RECIPE_LATEST_RELEASE_DATE_pn-gpgme = "01/2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gpgme = "5 months"
+RECIPE_LATEST_RELEASE_DATE_pn-gpgme = "06/2011"
 RECIPE_COMMENTS_pn-gpgme = ""
-RECIPE_MANUAL_CHECK_DATE_pn-gpgme = "Jun 28, 2011"
-RECIPE_LAST_UPDATE_pn-gpgme = "Jul 21, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-gpgme = "Jul 28, 2011"
+RECIPE_LAST_UPDATE_pn-gpgme = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-gpgme = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-expat = "green"
@@ -299,13 +300,13 @@ RECIPE_MAINTAINER_pn-liboil = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libassuan = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libassuan = "not done"
-RECIPE_LATEST_VERSION_pn-libassuan = "2.0.1"
+RECIPE_LATEST_VERSION_pn-libassuan = "2.0.2"
 RECIPE_NO_OF_PATCHES_pn-libassuan = "0"
 RECIPE_INTEL_SECTION_pn-libassuan = "base libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libassuan = "7 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libassuan = "08/2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libassuan = "10 months"
+RECIPE_LATEST_RELEASE_DATE_pn-libassuan = "06/2011"
 RECIPE_COMMENTS_pn-libassuan = ""
-RECIPE_LAST_UPDATE_pn-libassuan = "Nov 19, 2010"
+RECIPE_LAST_UPDATE_pn-libassuan = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-libassuan = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-db = "green"
@@ -1151,13 +1152,13 @@ RECIPE_LAST_UPDATE_pn-libgdbus = "Jan 4, 2011"
 RECIPE_MAINTAINER_pn-libgdbus = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-apr = "green"
-RECIPE_LATEST_VERSION_pn-apr = "1.4.2"
-RECIPE_LAST_UPDATE_pn-apr = "Dec 17, 2010"
+RECIPE_LATEST_VERSION_pn-apr = "1.4.5"
+RECIPE_LAST_UPDATE_pn-apr = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-apr = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-apr-util = "green"
-RECIPE_LATEST_VERSION_pn-apr-util = "1.3.10"
-RECIPE_LAST_UPDATE_pn-apr-util = "Dec 29, 2010"
+RECIPE_LATEST_VERSION_pn-apr-util = "1.3.12"
+RECIPE_LAST_UPDATE_pn-apr-util = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-apr-util = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-apt = "red"
@@ -1839,6 +1840,7 @@ RECIPE_LATEST_VERSION_pn-sed = "4.2.1"
 RECIPE_INTEL_SECTION_pn-sed = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sed = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-sed = "06/2009"
+RECIPE_MANUAL_CHECK_DATE_pn-sed = "Jul 28, 2011"
 RECIPE_COMMENTS_pn-sed = "Qing maintains GPLv2 sed, while Dongxiao maintains GPLv3 sed"
 
 RECIPE_STATUS_pn-aspell = "red"
@@ -1847,8 +1849,8 @@ RECIPE_LAST_UPDATE_pn-aspell = "Aug 16, 2010"
 RECIPE_MAINTAINER_pn-aspell = "Mei Lei <lei.mei@intel.com>"
 
 RECIPE_STATUS_pn-parted = "green"
-RECIPE_LATEST_VERSION_pn-parted = "2.3"
-RECIPE_LAST_UPDATE_pn-parted = "Dec 30, 2010"
+RECIPE_LATEST_VERSION_pn-parted = "3.0"
+RECIPE_LAST_UPDATE_pn-parted = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-parted = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-resolvconf = "green"
@@ -5157,13 +5159,13 @@ RECIPE_MAINTAINER_pn-libglade = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-libsoup-2.4 = "green"
 DISTRO_PN_ALIAS_pn-libsoup-2.4 = "Meego=libsoup Fedora=libsoup OpenSuSE=libsoup Ubuntu=libsoup2.4 Mandriva=libsoup Debian=libsoup2.4"
 RECIPE_DEPENDENCY_CHECK_pn-libsoup-2.4 = "not done"
-RECIPE_LATEST_VERSION_pn-libsoup-2.4 = "2.32.1"
+RECIPE_LATEST_VERSION_pn-libsoup-2.4 = "2.34.2"
 RECIPE_NO_OF_PATCHES_pn-libsoup-2.4 = "0"
 RECIPE_INTEL_SECTION_pn-libsoup-2.4 = "graphic UX"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libsoup-2.4 = "2 month"
-RECIPE_LATEST_RELEASE_DATE_pn-libsoup-2.4 = "11/2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libsoup-2.4 = "1 month"
+RECIPE_LATEST_RELEASE_DATE_pn-libsoup-2.4 = "08/2011"
 RECIPE_COMMENTS_pn-libsoup-2.4 = ""
-RECIPE_LAST_UPDATE_pn-libsoup-2.4 = "Nov 19, 2010"
+RECIPE_LAST_UPDATE_pn-libsoup-2.4 = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-libsoup-2.4 = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libxslt = "green"
@@ -5564,14 +5566,14 @@ RECIPE_NO_UPDATE_REASON_pn-groff = "1.18.1.4 is latest GPLv2 Version no 1.21"
 RECIPE_STATUS_pn-eglibc = "red"
 
 RECIPE_STATUS_pn-lighttpd = "red"
-RECIPE_LAST_UPDATE_pn-lighttpd = "Sep 28, 2010"
+RECIPE_LAST_UPDATE_pn-lighttpd = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-lighttpd = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-lighttpd = "not done"
-RECIPE_LATEST_VERSION_pn-lighttpd = "1.4.28"
+RECIPE_LATEST_VERSION_pn-lighttpd = "1.4.29"
 RECIPE_NO_OF_PATCHES_pn-lighttpd = "0"
 RECIPE_INTEL_SECTION_pn-lighttpd = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lighttpd = "10 days"
-RECIPE_LATEST_RELEASE_DATE_pn-lighttpd = "08/2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-lighttpd = "11 month"
+RECIPE_LATEST_RELEASE_DATE_pn-lighttpd = "07/2011"
 RECIPE_COMMENTS_pn-lighttpd = ""
 
 RECIPE_LATEST_VERSION_pn-adt-installer = "1.0"
-- 
1.7.1



