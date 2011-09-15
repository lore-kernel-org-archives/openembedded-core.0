Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R42Uz-0001UW-0E
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 05:20:25 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2011 20:15:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,384,1312182000"; d="scan'208";a="17264365"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.252])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Sep 2011 20:15:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 20:15:02 -0700
Message-Id: <79c56ecfb76e8dad9e52d63b3e083cb12383828e.1316056194.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
Subject: [RC2 PULL 13/13] distro-tracking: Update alias
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
X-List-Received-Date: Thu, 15 Sep 2011 03:20:25 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   28 +++++++++++++++-----
 1 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index b8dc982..13106c0 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2648,11 +2648,11 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libmusicbrainz="2 years"
 RECIPE_LAST_UPDATE_pn-libmusicbrainz = "Nov 16, 2010"
 RECIPE_MAINTAINER_pn-libmusicbrainz = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
-RECIPE_STATUS_pn-clutter-gst-1.4 = "red"
-DISTRO_PN_ALIAS_pn-clutter-gst-1.4 = "OpenSuSE=clutter-gst Debian=clutter-gst"
-RECIPE_LATEST_VERSION_pn-clutter-gst-1.4 = "0.11.0+git0+d48c6fc67b48304f90e51b520631c1ecc10410af"
-RECIPE_LAST_UPDATE_pn-clutter-gst-1.4 = "Feb 4, 2010"
-RECIPE_MAINTAINER_pn-clutter-gst-1.4 = "Dongxiao Xu <dongxiao.xu@intel.com>"
+RECIPE_STATUS_pn-clutter-gst-1.6 = "red"
+DISTRO_PN_ALIAS_pn-clutter-gst-1.6 = "Fedora=clutter-gst Debian=libclutter-gst"
+RECIPE_LATEST_VERSION_pn-clutter-gst-1.6 = "1.3.8"
+RECIPE_LAST_UPDATE_pn-clutter-gst-1.6 = "Mar 28, 2011"
+RECIPE_MAINTAINER_pn-clutter-gst-1.6 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-farsight2 = "red"
 RECIPE_LATEST_VERSION_pn-farsight2 = "0.0.20"
@@ -2715,7 +2715,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-gst-fluendo-mp3 = "2010/10/21"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gst-fluendo-mp3 = "3 months"
 RECIPE_LAST_UPDATE_pn-gst-fluendo-mp3 = "Dec 7, 2010"
 RECIPE_MAINTAINER_pn-gst-fluendo-mp3 = "Dongxiao Xu <dongxiao.xu@intel.com>"
-DISTRO_PN_ALIAS_pn-gst-fluendo-mp3 = "Debian=gstreamer0.10-fluendo-mp3  Ubuntu=gstreamer0.10-fluendo-mp3"
+DISTRO_PN_ALIAS_pn-gst-fluendo-mp3 = "Debian=gstreamer0.10-fluendo-mp3 Ubuntu=gstreamer0.10-fluendo-mp3"
 
 RECIPE_STATUS_pn-gst-fluendo-mpegdemux = "green"
 RECIPE_LATEST_VERSION_pn-gst-fluendo-mpegdemux = "0.10.67"
@@ -2957,10 +2957,17 @@ RECIPE_MANUAL_CHECK_DATE_pn-libtool = "Jul 06, 2011"
 RECIPE_MAINTAINER_pn-libtool = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-linux-libc-headers="green" 
+DISTRO_PN_ALIAS_pn-linux-libc-headers = "Debian=linux-kernel-headers Ubuntu=linux-kernel-headers"
 RECIPE_LATEST_VERSION_pn-linux-libc-headers="2.6.36"
 RECIPE_LAST_UPDATE_pn-linux-libc-headers = "Nov 8, 2010"
 RECIPE_MAINTAINER_pn-linux-libc-headers = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
+RECIPE_STATUS_pn-linux-libc-headers-yocto = "green" 
+DISTRO_PN_ALIAS_pn-linux-libc-headers-yocto = "Debian=linux-kernel-headers Ubuntu=linux-kernel-headers"
+RECIPE_LATEST_VERSION_pn-linux-libc-headers-yocto = "2.6.36"
+RECIPE_LAST_UPDATE_pn-linux-libc-headers-yocto = "Nov 8, 2010"
+RECIPE_MAINTAINER_pn-linux-libc-headers-yocto = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+
 RECIPE_STATUS_pn-lsof="green" 
 RECIPE_LATEST_VERSION_pn-lsof="4.84"
 RECIPE_LAST_UPDATE_pn-lsof = "Nov 8, 2010"
@@ -4957,6 +4964,7 @@ RECIPE_LAST_UPDATE_pn-screenshot = "Jun 25, 2010"
 RECIPE_MAINTAINER_pn-screenshot = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-tasks = "green"
+DISTRO_PN_ALIAS_pn-tasks = "Debian=tasks Fedora=tasks"
 RECIPE_DEPENDENCY_CHECK_pn-tasks = "not done"
 RECIPE_LATEST_VERSION_pn-tasks = "0.18"
 RECIPE_NO_OF_PATCHES_pn-tasks = "1"
@@ -4968,6 +4976,7 @@ RECIPE_LAST_UPDATE_pn-tasks = "Nov 19, 2010"
 RECIPE_MAINTAINER_pn-tasks = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-contacts = "green"
+DISTRO_PN_ALIAS_pn-contacts = "Debian=contacts Fedora=contacts"
 RECIPE_DEPENDENCY_CHECK_pn-contacts = "not done"
 RECIPE_LATEST_VERSION_pn-contacts = "0.12+git0+19853893fdb595de6aa59db0d9dc2f9451ed2933"
 RECIPE_NO_OF_PATCHES_pn-contacts = "1"
@@ -4979,6 +4988,7 @@ RECIPE_LAST_UPDATE_pn-contacts = "Jun 25, 2010"
 RECIPE_MAINTAINER_pn-contacts = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-dates = "green"
+DISTRO_PN_ALIAS_pn-dates = "Debian=dates Fedora=dates"
 RECIPE_DEPENDENCY_CHECK_pn-dates = "not done"
 RECIPE_LATEST_VERSION_pn-dates = "0.4.11+git0+514185dc1f6588085fda41eb59898b93d0487dd4"
 RECIPE_NO_OF_PATCHES_pn-dates = "1"
@@ -5036,6 +5046,7 @@ RECIPE_NO_UPDATE_REASON_pn-gtk+ = "Do not upgrade to version: 2.99.2 because pre
 RECIPE_MAINTAINER_pn-gtk+ = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-gdk-pixbuf = "green"
+DISTRO_PN_ALIAS_pn-gdk-pixbuf = "Debian=libgdk-pixbuf2.0 Fedora=gdk-pixbuf"
 RECIPE_LATEST_VERSION_pn-gdk-pixbuf = "2.22.1"
 RECIPE_LAST_UPDATE_pn-gdk-pixbuf = "Nov 25, 2010"
 RECIPE_MAINTAINER_pn-gdk-pixbuf = "Zhai Edwin <edwin.zhai@intel.com>"
@@ -5207,6 +5218,7 @@ RECIPE_LAST_UPDATE_pn-matchbox-config-gtk = "Jul 6, 2010"
 RECIPE_MAINTAINER_pn-matchbox-config-gtk = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-matchbox-keyboard = "green"
+DISTRO_PN_ALIAS_pn-matchbox-keyboard = "Debian=matchbox-keyboard Fedora=matchbox-keyboard"
 RECIPE_DEPENDENCY_CHECK_pn-matchbox-keyboard = "not done"
 RECIPE_LATEST_VERSION_pn-matchbox-keyboard = "0.0+svnr2075"
 RECIPE_NO_OF_PATCHES_pn-matchbox-keyboard = "0"
@@ -5385,6 +5397,7 @@ RECIPE_LAST_UPDATE_pn-gtk-doc = "Jun 10, 2009"
 RECIPE_MAINTAINER_pn-gtk-doc = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-gtkhtml2 = "red"
+DISTRO_PN_ALIAS_pn-gtkhtml2 = "Debian=libgtkhtml2-0 Fedora=gtkhtml2"
 RECIPE_LATEST_VERSION_pn-gtkhtml2 = "2.11.1"
 RECIPE_LAST_UPDATE_pn-gtkhtml2 = "Aug 9, 2007"
 RECIPE_MAINTAINER_pn-gtkhtml2 = "Zhai Edwin <edwin.zhai@intel.com>"
@@ -5751,6 +5764,7 @@ RECIPE_MANUAL_CHECK_DATE_pn-slang = "Jun 28, 2011"
 RECIPE_MAINTAINER_pn-slang = "Kai Kang <kai.kang@windriver.com>"
 
 RECIPE_STATUS_pn-libnewt = "green"
+DISTRO_PN_ALIAS_pn-libnewt = "Debian=libnewt0.52 Fedora=newt"
 RECIPE_LATEST_VERSION_pn-libnewt = "0.52.13"
 RECIPE_MAINTAINER_pn-libnewt = "Kai Kang <kai.kang@windriver.com>"
 RECIPE_LAST_UPDATE_pn-libnewt = "Jul 27, 2011"
@@ -5809,7 +5823,7 @@ RECIPE_COMMENTS_pn-pseudo = "Yocto Project maintained"
 RECIPE_MANUAL_CHECK_DATE_pn-pseudo = "Jun 06, 2011" 
 
 DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
-DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu =rt-tests"
+DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu=rt-tests"
 DISTRO_PN_ALIAS_pn-xserver-xf86-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-xserver-xf86-dri-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-xserver-kdrive = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
-- 
1.7.6



