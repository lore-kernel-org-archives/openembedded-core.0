Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RT1bL-00066J-VV
	for openembedded-core@openembedded.org; Wed, 23 Nov 2011 02:26:16 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2011 17:18:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,556,1315206000"; d="scan'208";a="88336256"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.15])
	by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2011 17:18:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 22 Nov 2011 17:18:27 -0800
Message-Id: <97b81a15de3f57be11a2ea3c9d3b25171977725c.1322008856.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322008856.git.sgw@linux.intel.com>
References: <cover.1322008856.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322008856.git.sgw@linux.intel.com>
References: <cover.1322008856.git.sgw@linux.intel.com>
Subject: [PATCH 6/7] distro_tracking: update manual checks for recipes
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
X-List-Received-Date: Wed, 23 Nov 2011 01:26:17 -0000

From: Shane Wang <shane.wang@intel.com>

Updating manual checks for jpeg, tinylogin, eggdbus, setserial, acpid, menu-cache, x11vnc, etc.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   38 ++++++++++++--------
 1 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 565d060..700a8dd 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -146,7 +146,7 @@ RECIPE_MAINTAINER_pn-icu = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_STATUS_pn-eggdbus = "yellow" # patch comment
 RECIPE_DEPENDENCY_CHECK_pn-eggdbus = "not done"
 RECIPE_LATEST_VERSION_pn-eggdbus = "0.6"
-RECIPE_MANUAL_CHECK_DATE_pn-eggdbus = "Jun 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-eggdbus = "Nov 22, 2011"
 RECIPE_PATCH_pn-eggdbus+gtk-doc = "local; no comment; poky doesn't have full gtk-doc support, and eggdbus itself references AM_CONDITIONAL in Makefile.am earlier before configure script is run"
 RECIPE_PATCH_pn-eggdbus+marshal = "local; no comment; one binary generated in eggdbus build needs to be invoked. So point to native version"
 RECIPE_INTEL_SECTION_pn-eggdbus = "base libs"
@@ -309,6 +309,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libassuan = "10 months"
 RECIPE_LATEST_RELEASE_DATE_pn-libassuan = "Jun 01, 2011"
 RECIPE_COMMENTS_pn-libassuan = ""
 RECIPE_LAST_UPDATE_pn-libassuan = "Jul 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libassuan = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-libassuan = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-db = "green"
@@ -1052,6 +1053,7 @@ RECIPE_LATEST_VERSION_pn-iptables = "1.4.12.1"
 RECIPE_STATUS_pn-ethtool = "green"
 RECIPE_LATEST_VERSION_pn-ethtool = "2.6.36"
 RECIPE_LAST_UPDATE_pn-ethtool = "Nov 28, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-ethtool = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-ethtool = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-net-tools = "green"
@@ -1259,6 +1261,7 @@ RECIPE_MAINTAINER_pn-libgsf = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-beecrypt = "green"
 RECIPE_LATEST_VERSION_pn-beecrypt = "4.2.1"
 RECIPE_LAST_UPDATE_pn-beecrypt = "Nov 26, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-beecrypt = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-beecrypt = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libacpi = "red"
@@ -1270,6 +1273,7 @@ DISTRO_PN_ALIAS_pn-libacpi="Ubuntu=libacpi Mandriva=libacpi"
 RECIPE_STATUS_pn-acpid = "green"
 RECIPE_LATEST_VERSION_pn-acpid = "1.0.10"
 RECIPE_LAST_UPDATE_pn-acpid = "Nov 26, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-acpid = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-acpid = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-consolekit = "green"
@@ -1740,7 +1744,7 @@ RECIPE_MAINTAINER_pn-tzdata = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-tzdata = "not done"
 RECIPE_INTEL_SECTION_pn-tzdata = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tzdata = "1 month"
-RECIPE_MANUAL_CHECK_DATE_pn-tzdata = "Oct 18, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-tzdata = "Nov 22, 2011"
 RECIPE_COMMENTS_pn-tzdata = ""
 DISTRO_PN_ALIAS_pn-tzcode = "OSPDT"
 
@@ -1754,6 +1758,7 @@ RECIPE_INTEL_SECTION_pn-tinylogin = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tinylogin = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-tinylogin = "n/a"
 RECIPE_COMMENTS_pn-tinylogin = "merged into busybox"
+RECIPE_MANUAL_CHECK_DATE_pn-tinylogin = "Nov 22, 2011"
 DISTRO_PN_ALIAS_pn-tinylogin = "Debian=busybox Ubuntu=busybox Mandriva=busybox"
 
 RECIPE_STATUS_pn-rpm = "red"   # need upgrade
@@ -1889,6 +1894,7 @@ RECIPE_MAINTAINER_pn-aspell = "Mei Lei <lei.mei@intel.com>"
 RECIPE_STATUS_pn-parted = "green"
 RECIPE_LATEST_VERSION_pn-parted = "3.0"
 RECIPE_LAST_UPDATE_pn-parted = "Jul 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-parted = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-parted = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-resolvconf = "green"
@@ -1954,6 +1960,7 @@ RECIPE_MAINTAINER_pn-libexif = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_STATUS_pn-setserial = "red"
 RECIPE_LATEST_VERSION_pn-setserial = "2.17"
 RECIPE_LAST_UPDATE_pn-setserial = "Jul 21, 2006"
+RECIPE_MANUAL_CHECK_DATE_pn-setserial = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-setserial = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-hdparm = "red"
@@ -3224,13 +3231,14 @@ RECIPE_MAINTAINER_pn-xrestop = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-pcmanfm = "green"
 RECIPE_DEPENDENCY_CHECK_pn-pcmanfm = "not done"
-RECIPE_LATEST_VERSION_pn-pcmanfm = "0.9.8"
+RECIPE_LATEST_VERSION_pn-pcmanfm = "0.9.10"
 RECIPE_NO_OF_PATCHES_pn-pcmanfm = "4"
 RECIPE_INTEL_SECTION_pn-pcmanfm = "graphic apps"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pcmanfm = "5 months"
-RECIPE_LATEST_RELEASE_DATE_pn-pcmanfm = "Oct 01, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pcmanfm = "3 months"
+RECIPE_LATEST_RELEASE_DATE_pn-pcmanfm = "Oct 24, 2010"
 RECIPE_COMMENTS_pn-pcmanfm = ""
 RECIPE_LAST_UPDATE_pn-pcmanfm = "Nov 19, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-pcmanfm = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-pcmanfm = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-oh-puzzles = "green" # no update needed
@@ -3251,7 +3259,7 @@ RECIPE_MAINTAINER_pn-gnome-terminal = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-puzzles = "red"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles"
 RECIPE_LATEST_VERSION_pn-puzzles = "r9175"
-RECIPE_MANUAL_CHECK_DATE_pn-puzzles = "Jun 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-puzzles = "Nov 22, 2011"
 RECIPE_LAST_UPDATE_pn-puzzles = "May 31, 2011"
 RECIPE_MAINTAINER_pn-puzzles = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles Fedora=puzzles"
@@ -3327,8 +3335,8 @@ RECIPE_LAST_UPDATE_pn-kf = "Apr 25, 2007"
 RECIPE_MAINTAINER_pn-claws-mail = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-x11vnc = "green"
-RECIPE_LATEST_VERSION_pn-x11vnc = "0.9.12"
-RECIPE_MANUAL_CHECK_DATE_pn-x11vnc = "Jun 28, 2011"
+RECIPE_LATEST_VERSION_pn-x11vnc = "0.9.13"
+RECIPE_MANUAL_CHECK_DATE_pn-x11vnc = "Nov 22, 2011"
 RECIPE_LAST_UPDATE_pn-x11vnc = "Nov 30, 2010"
 RECIPE_MAINTAINER_pn-x11vnc = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-x11vnc = "Fedora=x11vnc Ubuntu=x11vnc"
@@ -5247,7 +5255,7 @@ RECIPE_MAINTAINER_pn-hicolor-icon-theme = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-jpeg = "green"
 RECIPE_DEPENDENCY_CHECK_pn-jpeg = "not done"
 RECIPE_LATEST_VERSION_pn-jpeg = "8c"
-RECIPE_MANUAL_CHECK_DATE_pn-jpeg = "Jun 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-jpeg = "Nov 22, 2011"
 RECIPE_NO_OF_PATCHES_pn-jpeg = "0"
 RECIPE_INTEL_SECTION_pn-jpeg = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-jpeg = "12 months"
@@ -5295,7 +5303,7 @@ RECIPE_MAINTAINER_pn-libsoup-2.4 = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-libxslt = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxslt = "not done"
 RECIPE_LATEST_VERSION_pn-libxslt = "1.1.26"
-RECIPE_MANUAL_CHECK_DATE_pn-libxslt = "Jun 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libxslt = "Nov 22, 2011"
 RECIPE_NO_OF_PATCHES_pn-libxslt = "0"
 RECIPE_INTEL_SECTION_pn-libxslt = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxslt = "1 month"
@@ -5397,12 +5405,12 @@ RECIPE_MAINTAINER_pn-web-webkit = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libfm = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libfm = "not done"
-RECIPE_LATEST_VERSION_pn-libfm = "0.1.14"
-RECIPE_MANUAL_CHECK_DATE_pn-libfm = "Jun 28, 2011"
+RECIPE_LATEST_VERSION_pn-libfm = "0.1.17"
+RECIPE_MANUAL_CHECK_DATE_pn-libfm = "Nov 22, 2011"
 RECIPE_NO_OF_PATCHES_pn-libfm = "0"
 RECIPE_INTEL_SECTION_pn-libfm = "graphic UX"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libfm = "5 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libfm = "Oct 01, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libfm = "3 months"
+RECIPE_LATEST_RELEASE_DATE_pn-libfm = "Oct 24, 2011"
 RECIPE_COMMENTS_pn-libfm = "Add as required when updating pcmanfm"
 RECIPE_LAST_UPDATE_pn-libfm = "Nov 19, 2010"
 RECIPE_MAINTAINER_pn-libfm = "Zhai Edwin <edwin.zhai@intel.com>"
@@ -5410,7 +5418,7 @@ RECIPE_MAINTAINER_pn-libfm = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-menu-cache = "green"
 RECIPE_DEPENDENCY_CHECK_pn-menu-cache = "not done"
 RECIPE_LATEST_VERSION_pn-menu-cache = "0.3.2"
-RECIPE_MANUAL_CHECK_DATE_pn-menu-cache = "Jun 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-menu-cache = "Nov 22, 2011"
 RECIPE_NO_OF_PATCHES_pn-menu-cache = "0"
 RECIPE_INTEL_SECTION_pn-menu-cache = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-menu-cache = "1 month"
-- 
1.7.5.4



