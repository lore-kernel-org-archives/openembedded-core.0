Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKy-0004ka-SB
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:31:17 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:23:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472132"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:23:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:47 -0800
Message-Id: <1afbf4631f6192da8ef364e8260842dfe504e520.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 26/33] distro-tracking-fields: claim responsibility for udev, dpkg, apt, v86d
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
X-List-Received-Date: Thu, 19 Jan 2012 09:31:17 -0000

From: Joshua Lock <josh@linux.intel.com>

Nominate myself to be on the hook for updates to the udev, dpkg, apt and v86d
recipes.

Add a copy of the clutter-1.8 metadata without the namespace to keep the
tools happy when they find the clutter_git recipe.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   38 +++++++++++--------
 1 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index a4aacfb..0aed343 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -778,13 +778,13 @@ DISTRO_PN_ALIAS_pn-opkg_nogpg = "OSPDT upstream=http://svn.openmoko.org/trunk/s
 
 
 RECIPE_STATUS_pn-dpkg = "green"
-RECIPE_LATEST_VERSION_pn-dpkg = "1.16.0.3"
+RECIPE_LATEST_VERSION_pn-dpkg = "1.16.1.2"
 RECIPE_INTEL_SECTION_pn-dpkg = "base utils"
-RECIPE_LATEST_RELEASE_DATE_pn-dpkg = "May 04, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-dpkg = "Nov 25, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dpkg = "1 months"
 RECIPE_LAST_UPDATE_pn-dpkg = "Dec 30, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-dpkg = "Jun 29, 2011"
-RECIPE_MAINTAINER_pn-dpkg = "Dongxiao Xu <dongxiao.xu@intel.com"
+RECIPE_MANUAL_CHECK_DATE_pn-dpkg = "Jan 18, 2012"
+RECIPE_MAINTAINER_pn-dpkg = "Joshua Lock <josh@linux.intel.com"
 
 RECIPE_STATUS_pn-opkg-utils = "green"
 RECIPE_DEPENDENCY_CHECK_pn-opkg-utils = "not done"
@@ -1201,8 +1201,8 @@ RECIPE_STATUS_pn-apt = "red"
 RECIPE_LATEST_VERSION_pn-apt = "0.8.15.9"
 RECIPE_LATEST_RELEASE_DATE_pn-apt = "Oct 14, 2011"
 RECIPE_LAST_UPDATE_pn-apt = "Oct 6, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-apt = "Nov 08, 2011"
-RECIPE_NO_UPDATE_REASON_pn-apt="similar to zypper, defer the upgrading"
+RECIPE_MANUAL_CHECK_DATE_pn-apt = "Jan 18, 2012"
+RECIPE_MAINTAINER_pn-apt = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_STATUS_pn-chrpath = "red"
 RECIPE_DEPENDENCY_CHECK_pn-chrpath = "not done"
@@ -1451,7 +1451,7 @@ RECIPE_COMMENTS_pn-update-modules = ""
 
 RECIPE_STATUS_pn-udev-extraconf = "green"
 RECIPE_LAST_UPDATE_pn-udev-extraconf = "Jul 19, 2008"
-RECIPE_MAINTAINER_pn-udev-extraconf = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_MAINTAINER_pn-udev-extraconf = "Joshua Lock <josh@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-udev-extraconf = "not done"
 RECIPE_LATEST_VERSION_pn-udev-extraconf = "0.0"
 RECIPE_PATCH_pn-udev-extraconf+mount.blacklist = "add mount blacklist"
@@ -1735,26 +1735,25 @@ RECIPE_INTEL_SECTION_pn-dhcp = "base utils"
 RECIPE_COMMENTS_pn-dhcp = "several major release, others are 3.1.3, 4.0.2-P1, need to identify"
 
 RECIPE_STATUS_pn-v86d = "yellow"   # self written configure
-RECIPE_LAST_UPDATE_pn-udev = "Jul 6, 2010"
-RECIPE_MAINTAINER_pn-v86d = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_LAST_UPDATE_pn-v86d = "Oct 11, 2011"
+RECIPE_MAINTAINER_pn-v86d = "Joshua Lock <josh@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-v86d = "not done"
-RECIPE_LATEST_VERSION_pn-v86d = "0.1.9"
+RECIPE_LATEST_VERSION_pn-v86d = "0.1.10"
 RECIPE_PATCH_pn-v86d+fbsetup = "init script"
 RECIPE_INTEL_SECTION_pn-v86d = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-v86d = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-v86d = "Oct 01, 2008"
+RECIPE_LATEST_RELEASE_DATE_pn-v86d = "Feb 25, 2011"
 RECIPE_COMMENTS_pn-v86d = "contains code under other licenses"
 DISTRO_PN_ALIAS_pn-v86d = "Debian=v86d Ubuntu=v86d"
 
 RECIPE_STATUS_pn-udev = "yellow"   # needs to delete old versions
 RECIPE_LAST_UPDATE_pn-udev = "Dec 7, 2010"
-RECIPE_MAINTAINER_pn-udev = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_MAINTAINER_pn-udev = "Joshua Lock <josh@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-udev = "not done"
-RECIPE_LATEST_VERSION_pn-udev = "158"
+RECIPE_LATEST_VERSION_pn-udev = "164"
 RECIPE_INTEL_SECTION_pn-udev = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-udev = "<1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-udev = "Jun 01, 2010"
-RECIPE_COMMENTS_pn-udev = "may need different versions for different kernels"
+RECIPE_LATEST_RELEASE_DATE_pn-udev = "Jan 11, 2012"
+RECIPE_COMMENTS_pn-udev = "udev updates will require extra testing in the transition to kmod, etc"
 
 RECIPE_STATUS_pn-tzdata = "green"
 RECIPE_LATEST_VERSION_pn-tzdata = "2011n"
@@ -5525,6 +5524,13 @@ RECIPE_LATEST_VERSION_pn-clutter-1.8 = "1.8.2"
 RECIPE_MANUAL_CHECK_DATE_pn-clutter-1.8 = "Dec 13, 2011"
 RECIPE_LAST_UPDATE_pn-clutter-1.8 = "Dec 13, 2011"
 RECIPE_MAINTAINER_pn-clutter-1.8 = "Joshua Lock <josh@linux.intel.com>"
+# Non namespaced version for git recipe
+RECIPE_STATUS_pn-clutter = "green"
+DISTRO_PN_ALIAS_pn-clutter = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
+RECIPE_LATEST_VERSION_pn-clutter = "1.8.2"
+RECIPE_MANUAL_CHECK_DATE_pn-clutter = "Dec 13, 2011"
+RECIPE_LAST_UPDATE_pn-clutter = "Dec 13, 2011"
+RECIPE_MAINTAINER_pn-clutter = "Joshua Lock <josh@linux.intel.com>"
 
 RECIPE_STATUS_pn-clutter-gtk-1.8 = "red"
 DISTRO_PN_ALIAS_pn-clutter-gtk-1.8 = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
-- 
1.7.6.5



