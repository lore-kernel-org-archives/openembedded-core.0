Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1StfZn-0001F0-HI
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 15:55:03 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Jul 2012 06:43:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="126272707"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jul 2012 06:43:33 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 16:43:40 +0300
Message-Id: <1343137420-30809-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Connectivity and multimedia manual packages
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
X-List-Received-Date: Tue, 24 Jul 2012 13:55:03 -0000

Upstream updates checked.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../conf/distro/include/upstream_tracking.inc      |   28 ++++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-yocto/conf/distro/include/upstream_tracking.inc b/meta-yocto/conf/distro/include/upstream_tracking.inc
index 98e7d16..ba52d02 100644
--- a/meta-yocto/conf/distro/include/upstream_tracking.inc
+++ b/meta-yocto/conf/distro/include/upstream_tracking.inc
@@ -187,7 +187,7 @@ RECIPE_UPSTREAM_VERSION_pn-eds-tools = "git"
 RECIPE_UPSTREAM_VERSION_pn-eee-acpi-scripts = "1.1.12+9d4cdedca25b396405f8587f9c4fbf8229e041c2"
 RECIPE_UPSTREAM_VERSION_pn-eggdbus = "0.6"
 RECIPE_UPSTREAM_DATE_pn-eggdbus = "Nov 01, 2009"
-CHECK_DATE_pn-eggdbus = "Jul 06, 2012"
+CHECK_DATE_pn-eggdbus = "Jul 24, 2012"
 RECIPE_UPSTREAM_VERSION_pn-eglibc = "git:16540"
 CHECK_DATE_pn-eglibc = "Jan 01, 2012"
 RECIPE_UPSTREAM_VERSION_pn-elfutils="0.148"
@@ -217,7 +217,7 @@ RECIPE_UPSTREAM_VERSION_pn-fixesproto = "5.0"
 RECIPE_UPSTREAM_DATE_pn-fixesproto = "Mar 8, 2011"
 RECIPE_UPSTREAM_VERSION_pn-flac="1.2.1"
 RECIPE_UPSTREAM_DATE_pn-flac= "Sep 8, 2007"
-CHECK_DATE_pn-flac = "Jul 06, 2012"
+CHECK_DATE_pn-flac = "Jul 24, 2012"
 RECIPE_UPSTREAM_DATE_pn-flac="Sep 16, 2007"
 RECIPE_UPSTREAM_VERSION_pn-flex = "2.5.35"
 RECIPE_UPSTREAM_DATE_pn-flex = "Feb 02, 2008"
@@ -345,7 +345,7 @@ RECIPE_UPSTREAM_DATE_pn-iptables = "Apr 28, 2012"
 RECIPE_UPSTREAM_VERSION_pn-iputils="s20100418"
 RECIPE_UPSTREAM_VERSION_pn-irda-utils = "0.9.18"
 RECIPE_UPSTREAM_DATE_pn-irda-utils="Jul 10, 2006"
-CHECK_DATE_pn-irda-utils = "Jul 06, 2012"
+CHECK_DATE_pn-irda-utils = "Jul 24, 2012"
 RECIPE_UPSTREAM_VERSION_pn-iso-codes = "3.16"
 RECIPE_UPSTREAM_VERSION_pn-jpeg = "8c"
 CHECK_DATE_pn-jpeg = "Dec 24, 2011"
@@ -448,7 +448,7 @@ CHECK_DATE_pn-libgsmd = "Jul 06, 2012"
 RECIPE_UPSTREAM_VERSION_pn-libgtkstylus = "0.5"
 RECIPE_UPSTREAM_VERSION_pn-libical = "0.48"
 RECIPE_UPSTREAM_DATE_pn-libical ="Dec 13, 2011"
-CHECK_DATE_pn-libical = "Jul 06, 2012"
+CHECK_DATE_pn-libical = "Jul 24, 2012"
 RECIPE_UPSTREAM_DATE_pn-libical = "Dec 13, 2011"
 RECIPE_UPSTREAM_VERSION_pn-libice = "1.0.6"
 RECIPE_UPSTREAM_DATE_pn-libice = "Aug 01, 2009"
@@ -486,7 +486,7 @@ RECIPE_UPSTREAM_VERSION_pn-liboil = "0.3.17"
 RECIPE_UPSTREAM_DATE_pn-liboil = "Feb 01, 2010"
 RECIPE_UPSTREAM_VERSION_pn-libomxil = "0.9.3"
 RECIPE_UPSTREAM_DATE_pn-libomxil = "May 20, 2011"
-CHECK_DATE_pn-libomxil = "Jul 06, 2012"
+CHECK_DATE_pn-libomxil = "Jul 24, 2012"
 RECIPE_UPSTREAM_VERSION_pn-libopensync-plugin-evolution2 = "0.39"
 RECIPE_UPSTREAM_VERSION_pn-libopensync = "0.39"
 RECIPE_UPSTREAM_DATE_pn-libowl-av = "Dec 01, 2008"
@@ -499,9 +499,9 @@ RECIPE_UPSTREAM_VERSION_pn-libpcap="1.2.0"
 RECIPE_UPSTREAM_DATE_pn-libpcap="Jul 24, 2011"
 RECIPE_UPSTREAM_VERSION_pn-libpciaccess = "0.13.1"
 RECIPE_UPSTREAM_DATE_pn-libpciaccess = "Apr 09, 2012"
-RECIPE_UPSTREAM_VERSION_pn-libpcre = "8.30"
-RECIPE_UPSTREAM_DATE_pn-libpcre = "Mar 01, 2012"
-CHECK_DATE_pn-libpcre = "Jul 06, 2012"
+RECIPE_UPSTREAM_VERSION_pn-libpcre = "8.31"
+RECIPE_UPSTREAM_DATE_pn-libpcre = "Jul 23, 2012"
+CHECK_DATE_pn-libpcre = "Jul 24, 2012"
 RECIPE_NO_UPDATE_REASON_pn-libpng = "1.4.3 and later changes the API and breaks libmatchbox. Sticking with the 1.2.x series instead"
 RECIPE_UPSTREAM_VERSION_pn-libpng = "1.5.11"
 RECIPE_UPSTREAM_DATE_pn-libpng = "Jun 14, 2012"
@@ -514,7 +514,7 @@ RECIPE_UPSTREAM_VERSION_pn-librsvg = "2.32.1"
 RECIPE_UPSTREAM_DATE_pn-librsvg = "Nov 13, 2010"
 RECIPE_UPSTREAM_VERSION_pn-libsamplerate0 = "0.1.8"
 RECIPE_UPSTREAM_DATE_pn-libsamplerate0 = "Aug 15, 2011"
-CHECK_DATE_pn-libsamplerate0 = "Jul 06, 2012"
+CHECK_DATE_pn-libsamplerate0 = "Jul 24, 2012"
 RECIPE_UPSTREAM_VERSION_pn-libsdl = "1.2.15"
 CHECK_DATE_pn-libsdl = "Mar 14, 2012"
 RECIPE_UPSTREAM_VERSION_pn-libsm = "1.1.1"
@@ -531,7 +531,7 @@ RECIPE_UPSTREAM_VERSION_pn-libtheora = "1.2.0"
 RECIPE_UPSTREAM_VERSION_pn-libtimedate-perl = "1.20"
 RECIPE_UPSTREAM_VERSION_pn-libtirpc = "0.2.2"
 RECIPE_UPSTREAM_DATE_pn-libtirpc = "May 02, 2011"
-CHECK_DATE_pn-libtirpc = "Jul 06, 2012"
+CHECK_DATE_pn-libtirpc = "Jul 24, 2012"
 RECIPE_UPSTREAM_VERSION_pn-libtool="2.4.2"
 CHECK_DATE_pn-libtool = "Nov 28, 2011"
 RECIPE_UPSTREAM_VERSION_pn-libunique = "2.91.4"
@@ -671,7 +671,7 @@ RECIPE_UPSTREAM_VERSION_pn-mdadm = "3.2.5"
 RECIPE_UPSTREAM_DATE_pn-mdadm = "May 18, 2012"
 RECIPE_UPSTREAM_VERSION_pn-menu-cache = "0.3.3"
 RECIPE_UPSTREAM_DATE_pn-menu-cache = "May 20, 2012"
-CHECK_DATE_pn-minicom = "Jul 06, 2012"
+CHECK_DATE_pn-minicom = "Jul 24, 2012"
 RECIPE_UPSTREAM_DATE_pn-mesa-dri="Jun 17, 2010"
 RECIPE_UPSTREAM_VERSION_pn-meta-ide-support = "check"
 RECIPE_UPSTREAM_VERSION_pn-metacity = "2.30.3"
@@ -826,7 +826,7 @@ RECIPE_UPSTREAM_DATE_pn-quicky = "Jun 18, 2008"
 RECIPE_UPSTREAM_VERSION_pn-quilt="0.60"
 RECIPE_UPSTREAM_VERSION_pn-quota = "4.00"
 RECIPE_UPSTREAM_DATE_pn-quota = "Aug 17, 2011"
-CHECK_DATE_pn-quota = "Jul 06, 2012"
+CHECK_DATE_pn-quota = "Jul 24, 2012"
 RECIPE_UPSTREAM_VERSION_pn-randrproto = "1.3.2"
 RECIPE_UPSTREAM_DATE_pn-randrproto = "Oct 29, 2010"
 RECIPE_UPSTREAM_VERSION_pn-readline = "6.2"
@@ -841,7 +841,7 @@ RECIPE_UPSTREAM_VERSION_pn-resourceproto = "1.2.0"
 RECIPE_UPSTREAM_DATE_pn-resourceproto = "May 27, 2011"
 RECIPE_UPSTREAM_VERSION_pn-rpcbind = "0.2.0"
 RECIPE_UPSTREAM_DATE_pn-rpcbind = "May 29, 2009"
-CHECK_DATE_pn-rpcbind = "Jul 06, 2012"
+CHECK_DATE_pn-rpcbind = "Jul 24, 2012"
 RECIPE_UPSTREAM_DATE_pn-rpcbind = "May 01, 2009"
 RECIPE_UPSTREAM_VERSION_pn-rpm = "5.1.10"
 RECIPE_UPSTREAM_DATE_pn-rpm = "Jan 01, 2010"
@@ -996,7 +996,7 @@ RECIPE_UPSTREAM_DATE_pn-which = "Aug 01, 2008"
 CHECK_DATE_pn-which = "Nov 22, 2011"
 RECIPE_UPSTREAM_VERSION_pn-wireless-tools = "29"
 RECIPE_UPSTREAM_DATE_pn-wireless-tools="Sep 18, 2007"
-CHECK_DATE_pn-wireless-tools = "Jul 06, 2012"
+CHECK_DATE_pn-wireless-tools = "Jul 24, 2012"
 RECIPE_UPSTREAM_DATE_pn-wpa-supplicant="Sep 07, 2010"
 RECIPE_UPSTREAM_VERSION_pn-wv = "1.2.1"
 RECIPE_UPSTREAM_DATE_pn-x11-common="Sep 22, 2008"
-- 
1.7.9.5



