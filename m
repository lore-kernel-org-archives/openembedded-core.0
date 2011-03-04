Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PvawC-0006K0-P0
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 20:45:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Mar 2011 11:43:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,265,1297065600"; d="scan'208";a="716309877"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by orsmga001.jf.intel.com with ESMTP; 04 Mar 2011 11:42:10 -0800
Message-Id: <3a5fed48f3254ac6aafb4a5c7fa4015ad87b02e7.1299267630.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299267630.git.sgw@linux.intel.com>
References: <cover.1299267630.git.sgw@linux.intel.com>
Old-Date: Fri, 4 Mar 2011 09:14:48 -0800
Date: Fri, 04 Mar 2011 11:42:10 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 01/13] distro tracking: Updates to Tracking infor for clutter and other changes
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
X-List-Received-Date: Fri, 04 Mar 2011 19:45:21 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   32 ++++++++++---------
 1 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 1dab90a..1b05341 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2590,11 +2590,11 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libmusicbrainz="2 years"
 RECIPE_LAST_UPDATE_pn-libmusicbrainz = "Nov 16, 2010"
 RECIPE_MAINTAINER_pn-libmusicbrainz = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
-RECIPE_STATUS_pn-clutter-gst-1.0 = "red"
-DISTRO_PN_ALIAS_pn-clutter-gst-1.0 = "OpenSuSE=clutter-gst Debian=clutter-gst"
-RECIPE_LATEST_VERSION_pn-clutter-gst-1.0 = "0.11.0+git0+d48c6fc67b48304f90e51b520631c1ecc10410af"
-RECIPE_LAST_UPDATE_pn-clutter-gst = "Feb 4, 2010"
-RECIPE_MAINTAINER_pn-clutter-gst-1.0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
+RECIPE_STATUS_pn-clutter-gst-1.4 = "red"
+DISTRO_PN_ALIAS_pn-clutter-gst-1.4 = "OpenSuSE=clutter-gst Debian=clutter-gst"
+RECIPE_LATEST_VERSION_pn-clutter-gst-1.4 = "0.11.0+git0+d48c6fc67b48304f90e51b520631c1ecc10410af"
+RECIPE_LAST_UPDATE_pn-clutter-gst-1.4 = "Feb 4, 2010"
+RECIPE_MAINTAINER_pn-clutter-gst-1.4 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-farsight2 = "red"
 RECIPE_LATEST_VERSION_pn-farsight2 = "0.0.20"
@@ -5216,10 +5216,10 @@ RECIPE_STATUS_pn-clutter-box2d = "red"
 RECIPE_LATEST_VERSION_pn-clutter-box2d = "0.10.0"
 RECIPE_MAINTAINER_pn-clutter-box2d = "Edwin Zhai <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-clutter-gtk-1.0 = "red"
-DISTRO_PN_ALIAS_pn-clutter-gtk-1.0 = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
-RECIPE_LATEST_VERSION_pn-clutter-gtk-1.0 = "0.90.0+git0+e8d828ba1d87937baa571e68fdff22f3e2d79ca8"
-RECIPE_MAINTAINER_pn-clutter-gtk-1.0 = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_STATUS_pn-clutter-gtk-1.4 = "red"
+DISTRO_PN_ALIAS_pn-clutter-gtk-1.4 = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
+RECIPE_LATEST_VERSION_pn-clutter-gtk-1.4 = "0.90.0+git0+e8d828ba1d87937baa571e68fdff22f3e2d79ca8"
+RECIPE_MAINTAINER_pn-clutter-gtk-1.4 = "Edwin Zhai <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-tidy = "red"
 RECIPE_LATEST_VERSION_pn-tidy = "0.1.0+git0+e25416e1293e1074bfa6727c80527dcff5b1f3cb"
@@ -5236,14 +5236,14 @@ RECIPE_LATEST_VERSION_pn-libgalago = "0.5.2"
 RECIPE_LAST_UPDATE_pn-libgalago = "Apr 11, 2007"
 RECIPE_MAINTAINER_pn-libgalago = "Edwin Zhai <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-clutter-1.0 = "red"
-DISTRO_PN_ALIAS_pn-clutter-1.0 = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
-RECIPE_LATEST_VERSION_pn-clutter-1.0 = "1.0+git0+ce5025d0a2b701541ca9343686f9dac858905da4"
-RECIPE_LAST_UPDATE_pn-clutter-1.0 = "Jan 29, 2010"
-RECIPE_MAINTAINER_pn-clutter-1.0 = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_STATUS_pn-clutter-1.4 = "red"
+DISTRO_PN_ALIAS_pn-clutter-1.4 = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
+RECIPE_LATEST_VERSION_pn-clutter-1.4 = "1.0+git0+ce5025d0a2b701541ca9343686f9dac858905da4"
+RECIPE_LAST_UPDATE_pn-clutter-1.4 = "Jan 29, 2010"
+RECIPE_MAINTAINER_pn-clutter-1.4 = "Edwin Zhai <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-clutter = "red"
-DISTRO_PN_ALIAS_pn-clutter-gtk-1.0 = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
+DISTRO_PN_ALIAS_pn-clutter = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
 RECIPE_LATEST_VERSION_pn-clutter = "1.2.8"
 RECIPE_MAINTAINER_pn-clutter = "Edwin Zhai <edwin.zhai@intel.com>"
 
@@ -5489,6 +5489,7 @@ RECIPE_COMMENTS_pn-lighttpd = ""
 
 RECIPE_LATEST_VERSION_pn-adt-installer = "1.0"
 RECIPE_MANUAL_CHECK_DATE_adt-installer = "Jan 17, 2011"
+DISTRO_PN_ALIAS_pn-adt-installer = "Intel"
 RECIPE_LATEST_VERSION_pn-glew = "1.5.7"
 RECIPE_MANUAL_CHECK_DATE_pn-glew = "Feb 28, 2011"
 RECIPE_LATEST_VERSION_pn-mpeg2dec = "0.4.1"
@@ -5605,6 +5606,7 @@ RECIPE_MAINTAINER_pn-docbook-utils = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_LATEST_VERSION_pn-task-qte-toolchain-target = "1.0"
 RECIPE_MANUAL_CHECK_DATE_pn-task-qte-toolchain-target = "Feb 28, 2011"
+DISTRO_PN_ALIAS_pn-task-qte-toolchain-target = "Intel"
 RECIPE_LATEST_VERSION_pn-mailx = "12.4"
 RECIPE_MANUAL_CHECK_DATE_pn-mailx = "Feb 28, 2011"
 RECIPE_LATEST_VERSION_pn-libgcc = "4.5.1"
-- 
1.7.1.1



