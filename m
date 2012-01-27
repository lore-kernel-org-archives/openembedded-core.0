Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RqgYV-0004sX-TO
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 08:49:08 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Jan 2012 23:41:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="103271883"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 26 Jan 2012 23:41:14 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 15:54:57 +0800
Message-Id: <db7f4ce12b317d2b30eb978fa4c49dd550c3cc42.1327650817.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1327650817.git.shane.wang@intel.com>
References: <cover.1327650817.git.shane.wang@intel.com>
In-Reply-To: <cover.1327650817.git.shane.wang@intel.com>
References: <cover.1327650817.git.shane.wang@intel.com>
Subject: [PATCH 1/1] distro_tracking_fields: fix the typos in the field of maintainer.
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
X-List-Received-Date: Fri, 27 Jan 2012 07:49:08 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index a047315..1eb08a2 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -85,7 +85,7 @@ RECIPE_MAINTAINER_pn-logrotate = "Xiaofeng.Yan <xiaofeng@windriver.com>"
 
 RECIPE_STATUS_pn-loudmouth = "red"
 RECIPE_LATEST_VERSION_pn-loudmouth = "check"
-RECIPE_MAINTAINER_pn-loudmouth = "Dongxiao Xu <dongxiao.xu@intel.com"
+RECIPE_MAINTAINER_pn-loudmouth = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-makedepend = "green"
 RECIPE_LATEST_VERSION_pn-makedepend = "1.0.3"
@@ -127,7 +127,7 @@ RECIPE_MAINTAINER_pn-python-imaging = "Nitin A Kamble <nitin.a.kamble@intel.com>
 RECIPE_STATUS_pn-run-postinsts = "red"
 RECIPE_LATEST_VERSION_pn-run-postinsts = "check"
 RECIPE_LAST_UPDATE_pn-run-postinsts = "Nov 22, 2010"
-RECIPE_MAINTAINER_pn-run-postinsts = "Dongxiao Xu <dongxiao.xu@intel.com"
+RECIPE_MAINTAINER_pn-run-postinsts = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-subversion = "green"
 RECIPE_LATEST_VERSION_pn-subversion = "1.6.15"
@@ -782,7 +782,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-opkg = "Feb 01, 2010"
 RECIPE_COMMENTS_pn-opkg = ""
 RECIPE_LAST_UPDATE_pn-opkg = "Jul 21, 2010"
 RECIPE_MANUAL_CHECK_DATE_pn-opkg = "Nov 22, 2011"
-RECIPE_MAINTAINER_pn-opkg = "Dongxiao Xu <dongxiao.xu@intel.com"
+RECIPE_MAINTAINER_pn-opkg = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-opkg = "OSPDT upstream=http://svn.openmoko.org/trunk/src/tar"
 
 
@@ -794,7 +794,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opkg_nogpg = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-opkg_nogpg = "Feb 01, 2010"
 RECIPE_COMMENTS_pn-opkg_nogpg = ""
 RECIPE_LAST_UPDATE_pn-opkg_nogpg = "Jul 21, 2010"
-RECIPE_MAINTAINER_pn-opkg_nogpg = "Dongxiao Xu <dongxiao.xu@intel.com"
+RECIPE_MAINTAINER_pn-opkg_nogpg = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-opkg_nogpg = "OSPDT upstream=http://svn.openmoko.org/trunk/s
 
 
@@ -805,7 +805,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-dpkg = "Nov 25, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dpkg = "1 months"
 RECIPE_LAST_UPDATE_pn-dpkg = "Dec 30, 2010"
 RECIPE_MANUAL_CHECK_DATE_pn-dpkg = "Jan 18, 2012"
-RECIPE_MAINTAINER_pn-dpkg = "Joshua Lock <josh@linux.intel.com"
+RECIPE_MAINTAINER_pn-dpkg = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_STATUS_pn-opkg-utils = "green"
 RECIPE_DEPENDENCY_CHECK_pn-opkg-utils = "not done"
@@ -815,7 +815,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opkg-utils = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-opkg-utils = "Nov 01, 2008"
 RECIPE_COMMENTS_pn-opkg-utils = ""
 RECIPE_LAST_UPDATE_pn-opkg-utils = "Jul 21, 2010"
-RECIPE_MAINTAINER_pn-opkg-utils = "Dongxiao Xu <dongxiao.xu@intel.com"
+RECIPE_MAINTAINER_pn-opkg-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-opkg-utils = "OSPDT upstream=http://svn.openmoko.org/trunk/src/target/opkg/"
 
 RECIPE_STATUS_pn-polkit = "green"
@@ -3598,7 +3598,7 @@ RECIPE_LATEST_VERSION_pn-qt4-x11-free = "4.8.0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-x11-free = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-qt4-x11-free = "Dec 15, 2011"
 RECIPE_LAST_UPDATE_pn-qt4-x11-free = "Dec 15, 2011"
-RECIPE_MAINTAINER_pn-qt4-x11-free = "Paul Eggleton <paul.eggleton@linux.intel.com"
+RECIPE_MAINTAINER_pn-qt4-x11-free = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-qt4-x11-free = "Ubuntu=qt-x11-free Debian=qt-x11-free"
 
 RECIPE_STATUS_pn-quicky = "green" # no update needed
-- 
1.7.6



