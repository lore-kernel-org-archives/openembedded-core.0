Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt6VY-0002eM-18
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 00:56:04 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 15:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113486102"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 15:48:08 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 15:47:53 -0800
Message-Id: <cc3a6f625278d8ec9a61be1170823c3ec4302e61.1328226197.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
Subject: [PATCH 14/14] distro_track: Track Updates
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
X-List-Received-Date: Thu, 02 Feb 2012 23:56:04 -0000

openssl: Update to 1.0.0g
openssl: Update to 0.9.8t (gplv2)
gnutls: Update to 2.12.16
rxvt-unicode: Update to 9.15
gnupg: Add gplv2 version 1.4.7
file: Update to version 5.10
libidn: Update to 1.24
libdrm: Update to 2.4.30
xinit: Update to 1.3.2
xf86-input-keyboard: Update to 1.6.1
xf87-input-evdev: 2.6.0

Manual Checks:
util-linux - NO Update reason

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   53 ++++++++++----------
 1 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index a214a37..1b4e00b 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -294,9 +294,9 @@ RECIPE_MANUAL_CHECK_DATE_pn-libpng = "Jan 19, 2012"
 RECIPE_MAINTAINER_pn-libpng = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-libidn = "green"
-RECIPE_LATEST_VERSION_pn-libidn = "1.23"
-RECIPE_LATEST_RELEASE_DATE_pn-libidn = "Nov 25, 2010"
-RECIPE_LAST_UPDATE_pn-libidn = "Dec 18, 2011"
+RECIPE_LATEST_VERSION_pn-libidn = "1.24"
+RECIPE_LATEST_RELEASE_DATE_pn-libidn = "Jan 10, 2012"
+RECIPE_LAST_UPDATE_pn-libidn = "Feb 02, 2012"
 RECIPE_INTEL_SECTION_pn-libidn = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libidn = "3 months"
 RECIPE_COMMENTS_pn-libidn = ""
@@ -464,9 +464,9 @@ RECIPE_COMMENTS_pn-libgcrypt = ""
 RECIPE_MANUAL_CHECK_DATE_pn-libgcrypt = "Nov 23, 2011"
 
 RECIPE_STATUS_pn-gnutls = "yellow"   # need explict pre configure
-RECIPE_LATEST_VERSION_pn-gnutls = "2.12.14"
-RECIPE_LATEST_RELEASE_DATE_pn-gnutls = "Nov 08, 2011"
-RECIPE_LAST_UPDATE_pn-gnutls = "Nov 28, 2011"
+RECIPE_LATEST_VERSION_pn-gnutls = "2.12.16"
+RECIPE_LATEST_RELEASE_DATE_pn-gnutls = "Jan 06, 2012"
+RECIPE_LAST_UPDATE_pn-gnutls = "Feb 02, 2012"
 RECIPE_MAINTAINER_pn-gnutls = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-gnutls = "done"
 RECIPE_PATCH_pn-gnutls+gnutls-openssl = "unkown"
@@ -497,12 +497,12 @@ RECIPE_COMMENTS_pn-libtasn1 = ""
 RECIPE_MANUAL_CHECK_DATE_pn-libtasn1 = "Nov 29, 2011"
 
 RECIPE_STATUS_pn-openssl = "green"
-RECIPE_LATEST_VERSION_pn-openssl = "1.0.0e"
-RECIPE_LATEST_RELEASE_DATE_pn-openssl = "Sep 06, 2010"
-RECIPE_LAST_UPDATE_pn-openssl = "Nov 28, 2011"
+RECIPE_LATEST_VERSION_pn-openssl = "1.0.1"
+RECIPE_LATEST_RELEASE_DATE_pn-openssl = "Jan 18, 2012"
+RECIPE_LAST_UPDATE_pn-openssl = "Feb 02, 2012"
 RECIPE_MAINTAINER_pn-openssl = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-openssl = "base libs"
-RECIPE_NO_UPDATE_REASON_pn-openssl = "1.0.0e is latest"
+RECIPE_NO_UPDATE_REASON_pn-openssl = "1.0.1 is beta 1.0.0g is latest"
 
 RECIPE_STATUS_pn-libnss-mdns = "green"
 DISTRO_PN_ALIAS_pn-libnss-mdns = "Meego=nss-mdns OpenSuSE=nss-mdns Ubuntu=nss-mdns Mandriva=nss_mdns Debian=nss-mdns"
@@ -1607,9 +1607,9 @@ RECIPE_LATEST_RELEASE_DATE_pn-findutils = "Jun 01, 2009"
 RECIPE_COMMENTS_pn-findutils = ""
 
 RECIPE_STATUS_pn-file = "green"
-RECIPE_LATEST_VERSION_pn-file = "5.09"
+RECIPE_LATEST_VERSION_pn-file = "5.15"
 RECIPE_LATEST_RELEASE_DATE_pn-file = "Sep 16, 2011"
-RECIPE_LAST_UPDATE_pn-file = "Jul 12, 2011"
+RECIPE_LAST_UPDATE_pn-file = "Feb 02, 2012"
 RECIPE_MAINTAINER_pn-file = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-file = "done"
 RECIPE_PATCH_pn-file+dump = "some new magic data"
@@ -1827,7 +1827,7 @@ RECIPE_LAST_UPDATE_pn-util-linux = "Dec 27, 2011"
 RECIPE_MAINTAINER_pn-util-linux = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-util-linux = "base utils"
 RECIPE_MANUAL_CHECK_DATE_pn-util-linux = "Dec 01, 2011"
-RECIPE_COMMENTS_pn-util-linux = "kernel.org still has this off-line"
+RECIPE_NO_UPDATE_REASON_pn-uti-linux ="2.21 is still RC1"
 
 RECIPE_STATUS_pn-usbutils = "green"
 RECIPE_LATEST_VERSION_pn-usbutils = "0.91"
@@ -3460,9 +3460,9 @@ RECIPE_MAINTAINER_pn-xhost="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xhost = "Ubuntu=x11-xserver-utils Fedora=xorg-x11-server-utils"
 
 RECIPE_STATUS_pn-xinit="green" # no update needed
-RECIPE_LATEST_VERSION_pn-xinit="1.3.1"
-RECIPE_LATEST_RELEASE_DATE_pn-xinit="Jul 24, 2011"
-RECIPE_LAST_UPDATE_pn-xinit = "Nov 28, 2011"
+RECIPE_LATEST_VERSION_pn-xinit="1.3.2"
+RECIPE_LATEST_RELEASE_DATE_pn-xinit="Jan 27, 2012"
+RECIPE_LAST_UPDATE_pn-xinit = "Feb 02, 2012"
 RECIPE_NO_OF_PATCHES_pn-xinit="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xinit="4 monthes"
 RECIPE_INTEL_SECTION_pn-xinit="graphic app"
@@ -3654,12 +3654,12 @@ RECIPE_MAINTAINER_pn-x11-common="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xf86-input-keyboard="green" # no update needed
 DISTRO_PN_ALIAS_pn-xf86-input-keyboard = "Meego=xorg-x11-drv-keyboard Fedora=xorg-x11-drv-keyboard Mandriva=x11-driver-input-keyboard Debian=xserver-xorg-input-keyboard"
-RECIPE_LATEST_VERSION_pn-xf86-input-keyboard="1.4.0"
+RECIPE_LATEST_VERSION_pn-xf86-input-keyboard="1.6.1"
 RECIPE_NO_OF_PATCHES_pn-xf86-input-keyboard="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-input-keyboard="9 monthes"
-RECIPE_LATEST_RELEASE_DATE_pn-xf86-input-keyboard="Oct 07, 2009"
+RECIPE_LATEST_RELEASE_DATE_pn-xf86-input-keyboard="Jan 03, 2012"
 RECIPE_INTEL_SECTION_pn-xf86-input-keyboard="graphic core"
-RECIPE_LAST_UPDATE_pn-xf86-input-keyboard = "Jan 18, 2011"
+RECIPE_LAST_UPDATE_pn-xf86-input-keyboard = "Feb 02, 2012"
 RECIPE_MAINTAINER_pn-xf86-input-keyboard="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xf86-input-mouse="green" # no update needed
@@ -3683,9 +3683,9 @@ RECIPE_LAST_UPDATE_pn-xf86-input-vmmouse = "Nov 12, 2010"
 RECIPE_MAINTAINER_pn-xf86-input-vmmouse="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-libdrm="green" # no update needed
-RECIPE_LATEST_VERSION_pn-libdrm="2.4.29"
-RECIPE_LATEST_RELEASE_DATE_pn-libdrm="Dec 13, 2011"
-RECIPE_LAST_UPDATE_pn-libdrm = "Dec 18, 2011"
+RECIPE_LATEST_VERSION_pn-libdrm = "2.4.30"
+RECIPE_LATEST_RELEASE_DATE_pn-libdrm = "Jan 06, 2012"
+RECIPE_LAST_UPDATE_pn-libdrm = "Feb 02, 2012"
 RECIPE_NO_OF_PATCHES_pn-libdrm="1"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libdrm="1 month"
 RECIPE_INTEL_SECTION_pn-libdrm="graphic core"
@@ -3713,13 +3713,14 @@ DISTRO_PN_ALIAS_pn-libxfontcache = "Mandriva=libxfontcache Debian=libxfontcache"
 
 RECIPE_STATUS_pn-xf86-input-evdev="green" # no update needed
 DISTRO_PN_ALIAS_pn-xf86-input-evdev = "Ubuntu=xserver-xorg-input-evdev Mandriva=x11-driver-input-evdev Debian=xserver-xorg-input-evdev Fedora=xorg-x11-drv-evdev Meego=xorg-x11-drv-evdev"
-RECIPE_LATEST_VERSION_pn-xf86-input-evdev="2.5.0"
+RECIPE_LATEST_VERSION_pn-xf86-input-evdev="2.6.0"
 RECIPE_NO_OF_PATCHES_pn-xf86-input-evdev="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-input-evdev="1 monthes"
 RECIPE_LATEST_RELEASE_DATE_pn-xf86-input-evdev="Aug 23, 2010"
 RECIPE_INTEL_SECTION_pn-xf86-input-evdev="graphic core"
 RECIPE_LAST_UPDATE_pn-xf86-input-evdev = "Jan 18, 2011"
 RECIPE_MAINTAINER_pn-xf86-input-evdev="Saul Wold <sgw@linux.intel.com>"
+RECIPE_NO_UPDATE_REASON_pn-xf86-input-evdev = "Do not update to *99* unstable versions"
 
 RECIPE_STATUS_pn-xf86-video-vmware="green" # no update needed
 DISTRO_PN_ALIAS_pn-xf86-video-vmware = "Debian=xserver-xorg-video-vmware Fedora=xorg-x11-drv-vmware Mandriva=x11-driver-video-vmware Ubuntu=xserver-xorg-video-vmware"
@@ -6119,13 +6120,13 @@ DISTRO_PN_ALIAS_pn-cdrtools = "OpenSUSE=cdrtools OSPDT"
 
 RECIPE_STATUS_pn-rxvt-unicode = "green"
 RECIPE_DEPENDENCY_CHECK_pn-rxvt-unicode = "not done"
-RECIPE_LATEST_VERSION_pn-rxvt-unicode = "9.11"
+RECIPE_LATEST_VERSION_pn-rxvt-unicode = "9.15"
+RECIPE_LATEST_RELEASE_DATE_pn-rxvt-unicode = "Jan 21, 2012"
+RECIPE_LAST_UPDATE_pn-rxvt-unicode = "Fev 02, 2012"
 RECIPE_NO_UPDATE_REASON_pn-rxvt-unicode = ""
 RECIPE_NO_OF_PATCHES_pn-rxvt-unicode = "1"
-RECIPE_LATEST_RELEASE_DATE_pn-rxvt-unicode = "May 02, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-rxvt-unicode = ""
 RECIPE_COMMENTS_pn-rxvt-unicode = ""
-RECIPE_LAST_UPDATE_pn-rxvt-unicode = "May 25, 2011"
 RECIPE_MAINTAINER_pn-rxvt-unicode = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-alsa-tools = "green"
-- 
1.7.6.5



