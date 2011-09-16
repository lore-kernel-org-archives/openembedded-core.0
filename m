Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R4O7y-0002ur-JQ
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 04:26:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Sep 2011 19:20:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,391,1312182000"; d="scan'208";a="54273823"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.252])
	by fmsmga002.fm.intel.com with ESMTP; 15 Sep 2011 19:20:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 19:20:45 -0700
Message-Id: <548ec8190fbcc0397f42cb489ccc2cc3dbc0aeb1.1316139554.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316139554.git.sgw@linux.intel.com>
References: <cover.1316139554.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316139554.git.sgw@linux.intel.com>
References: <cover.1316139554.git.sgw@linux.intel.com>
Subject: [RC2 FIXES 1/6] distro-tracking: Update package alias
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
X-List-Received-Date: Fri, 16 Sep 2011 02:26:06 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 13106c0..b150af8 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1570,6 +1570,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-nfs-utils = "02/2010"
 RECIPE_COMMENTS_pn-nfs-utils = ""
 
 RECIPE_STATUS_pn-dropbear = "green"
+DISTRO_PN_ALIAS_pn-dropbear = "Debian=dropbear Ubuntu=dropbear"
 RECIPE_LAST_UPDATE_pn-dropbear = "Jul 5, 2010"
 RECIPE_MAINTAINER_pn-dropbear = "Mei Lei <lei.mei@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-dropbear = "not done"
@@ -4560,6 +4561,7 @@ RECIPE_LAST_UPDATE_pn-librsvg = "Jan 5, 2011"
 RECIPE_MAINTAINER_pn-librsvg = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libx11 = "green"
+DISTRO_PN_ALIAS_pn-libx11 = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
 RECIPE_DEPENDENCY_CHECK_pn-libx11 = "not done"
 RECIPE_LATEST_VERSION_pn-libx11 = "1.3.4"
 RECIPE_NO_OF_PATCHES_pn-libx11 = "3"
@@ -4573,7 +4575,11 @@ RECIPE_COMMENTS_pn-libx11 = ""
 RECIPE_LAST_UPDATE_pn-libx11 = "Jul 9, 2010"
 RECIPE_MAINTAINER_pn-libx11 = "Dexuan Cui <dexuan.cui@intel.com>"
 
+RECIPE_STATUS_pn-libx11-diet = "green"
+DISTRO_PN_ALIAS_pn-libx11-diet = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
+
 RECIPE_STATUS_pn-libx11-trim = "green"
+DISTRO_PN_ALIAS_pn-libx11-trim = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
 RECIPE_DEPENDENCY_CHECK_pn-libx11-trim = "not done"
 RECIPE_LATEST_VERSION_pn-libx11-trim = "1.3.4"
 RECIPE_NO_OF_PATCHES_pn-libx11-trim = "3"
@@ -4621,6 +4627,7 @@ RECIPE_LAST_UPDATE_pn-startup-notification = "Jun 13, 2011"
 RECIPE_MAINTAINER_pn-startup-notification = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-galago-daemon = "green"
+DISTRO_PN_ALIAS_pn-galago-daemon = "Debian=galago-daemon Ubuntu=galago-daemon"
 RECIPE_DEPENDENCY_CHECK_pn-galago-daemon = "not done"
 RECIPE_LATEST_VERSION_pn-galago-daemon = "0.5.1"
 RECIPE_NO_OF_PATCHES_pn-galago-daemon = "0"
@@ -4730,7 +4737,7 @@ RECIPE_LAST_UPDATE_pn-libxpm = "Nov 24, 2010"
 RECIPE_MAINTAINER_pn-libxpm = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxprintapputil = "green"
-DISTRO_PN_ALIAS_pn-libxprintapputil1 = "Debian=libxprintapputil1 Ubuntu=libxprintapputil1 Mandriva=libxprintapputil"
+DISTRO_PN_ALIAS_pn-libxprintapputil = "Debian=libxprintapputil Ubuntu=libxprintapputil1 Mandriva=libxprintapputil"
 RECIPE_DEPENDENCY_CHECK_pn-libxprintapputil = "not done"
 RECIPE_LATEST_VERSION_pn-libxprintapputil = "1.0.1"
 RECIPE_NO_OF_PATCHES_pn-libxprintapputil = "0"
@@ -4765,6 +4772,7 @@ RECIPE_LAST_UPDATE_pn-libxscrnsaver = "Nov 16, 2010"
 RECIPE_MAINTAINER_pn-libxscrnsaver = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxtrap = "green"
+DISTRO_PN_ALIAS_pn-libxtrap = "Debian=libxtrap6 Fedora=libXTrap"
 RECIPE_DEPENDENCY_CHECK_pn-libxtrap = "not done"
 RECIPE_LATEST_VERSION_pn-libxtrap = "1.0.0"
 RECIPE_NO_OF_PATCHES_pn-libxtrap = "0"
@@ -5735,6 +5743,7 @@ RECIPE_MANUAL_CHECK_DATE_pn-mailx = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-mailx = "Kai Kang <kai.kang@windriver.com>"
 
 RECIPE_LATEST_VERSION_pn-libgcc = "4.5.1"
+DISTRO_PN_ALIAS_pn-libgcc = "Debian=libgcc4 Ubuntu=libgcc1 OpenSuSE=libgcc45"
 RECIPE_MANUAL_CHECK_DATE_pn-libgcc = "Feb 28, 2011"
 
 RECIPE_STATUS_pn-transfig = "green"
-- 
1.7.6



