Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RQl3T-0007yW-Ep
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 20:21:55 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Nov 2011 11:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,522,1315206000"; d="scan'208";a="86068972"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 16 Nov 2011 11:14:53 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2011 11:14:42 -0800
Message-Id: <6d422c58fdac62e1c0fc9796b622b38fb77ba1d2.1321470759.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
References: <806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1321470758.git.nitin.a.kamble@intel.com>
References: <cover.1321470758.git.nitin.a.kamble@intel.com>
Subject: [PATCH 7/8] update distro tracking recipe information
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
X-List-Received-Date: Wed, 16 Nov 2011 19:21:56 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   49 +++++++++++---------
 1 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 5cd4c37..7dc6f27 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -31,8 +31,9 @@ RECIPE_MAINTAINER_pn-gtk-theme-torturer = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-gtk-theme-torturer = "OSPDT upstream=http://wiki.laptop.org/go/GTK_for_OLPC"
 
 RECIPE_STATUS_pn-libpcre = "green"
-RECIPE_LATEST_VERSION_pn-libpcre = "8.10"
-RECIPE_LAST_UPDATE_pn-libpcre = "Jul 13, 2010"
+RECIPE_LATEST_VERSION_pn-libpcre = "8.20"
+RECIPE_LAST_UPDATE_pn-libpcre = "Nov 15, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libpcre = "Nov 15, 2011"
 RECIPE_MAINTAINER_pn-libpcre = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-libpcre = "Mandriva=libpcre0 Fedora=pcre"
 
@@ -93,7 +94,7 @@ RECIPE_MAINTAINER_pn-minicom = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-patch = "green"
 RECIPE_LATEST_VERIONS_pn-patch = "2.6.1"
 RECIPE_LAST_UPDATE_pn-patch = "Dec 7, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-patch = "Apr 7, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-patch = "Nov 16, 2011" 
 RECIPE_MAINTAINER_pn-patch = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-python-imaging = "green"
@@ -2961,6 +2962,7 @@ DISTRO_PN_ALIAS_pn-distcc = "Debian=distcc Fedora=distcc"
 RECIPE_STATUS_pn-flex="green" 
 RECIPE_LATEST_VERSION_pn-flex="2.5.35"
 RECIPE_LAST_UPDATE_pn-flex = "Jun 20, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-flex = "Nov 16, 2011" 
 RECIPE_MAINTAINER_pn-flex = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-fstests="green"  
@@ -2982,9 +2984,9 @@ RECIPE_LAST_UPDATE_pn-intltool = "Jun 21, 2010"
 RECIPE_MAINTAINER_pn-intltool = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-libtool="green" 
-RECIPE_LATEST_VERSION_pn-libtool="2.4"
-RECIPE_LAST_UPDATE_pn-libtool = "Nov 8, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-libtool = "Jul 06, 2011" 
+RECIPE_LATEST_VERSION_pn-libtool="2.4.2"
+RECIPE_LAST_UPDATE_pn-libtool = "Nov 16, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libtool = "Nov 16, 2011" 
 RECIPE_MAINTAINER_pn-libtool = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-linux-libc-headers="green" 
@@ -3017,7 +3019,7 @@ RECIPE_MAINTAINER_pn-postinsts = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-nasm="green"
 RECIPE_LATEST_VERSION_pn-nasm="2.07"
-RECIPE_MANUAL_CHECK_DATE_pn-nasm = "Oct 18, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-nasm = "Nov 16, 2011"
 RECIPE_LAST_UPDATE_pn-nasm = "Jun 23, 2010"
 RECIPE_MAINTAINER_pn-nasm = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
@@ -3028,14 +3030,15 @@ RECIPE_LAST_UPDATE_pn-btrfs-tools = "Jun 09, 2011"
 RECIPE_MAINTAINER_pn-btrfs-tools = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
 
-RECIPE_STATUS_pn-perl="red" # upgrade needed
-RECIPE_LATEST_VERSION_pn-perl="5.12.1"
-RECIPE_LAST_UPDATE_pn-perl = "May 27, 2007"
+RECIPE_STATUS_pn-perl="green" 
+RECIPE_LATEST_VERSION_pn-perl="5.14.2"
+RECIPE_LAST_UPDATE_pn-perl = "Oct 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-perl = "Nov 16, 2011"
 RECIPE_MAINTAINER_pn-perl = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-prelink="red" 
 RECIPE_LATEST_VERSION_pn-prelink="1.0+git0+0x909470ee441237563d6236c505cb2d02ddc48704"
-RECIPE_LAST_UPDATE_pn-perl = "Jul 23, 2010"
+RECIPE_LAST_UPDATE_pn-prelink = "Jul 23, 2010"
 RECIPE_MAINTAINER_pn-prelink = "Mark Hatle <mark.hatle@windriver.com>"
 
 RECIPE_STATUS_pn-python-dbus="green" 
@@ -3045,9 +3048,10 @@ RECIPE_MAINTAINER_pn-python-dbus = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-python-dbus = "Ubuntu=python-dbus Debian=python-dbus Mandriva=python-dbus"
 
 RECIPE_STATUS_pn-python-gst="red" 
-RECIPE_LATEST_VERSION_pn-python-gst="0.10.21"
+RECIPE_LATEST_VERSION_pn-python-gst="0.10.22"
 DISTRO_PN_ALIAS_pn-python-gst = "OpenSuSE=python-gstreamer Ubuntu=gst0.10-python Debian=gst0.10-python"
-RECIPE_LAST_UPDATE_pn-python-gst = "Nov 8, 2010"
+RECIPE_LAST_UPDATE_pn-python-gst = "Nov 16, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-python-gst = "Nov 16, 2011"
 RECIPE_MAINTAINER_pn-python-gst = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-python-imaging="green"
@@ -3083,7 +3087,7 @@ RECIPE_STATUS_pn-python-scons="green"
 RECIPE_LATEST_VERSION_pn-python-scons="2.1.0"
 RECIPE_LAST_UPDATE_pn-python-scons = "Oct 18, 2011"
 DISTRO_PN_ALIAS_pn-python-scons = "Fedora=scons OpenSuSE=scons Ubuntu=scons Mandriva=scons Debian=scons"
-RECIPE_LAST_UPDATE_pn-python-scons = "Nov 8, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-python-scons = "Nov 16, 2011" 
 RECIPE_MAINTAINER_pn-python-scons = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-python="red"
@@ -3097,8 +3101,9 @@ RECIPE_LAST_UPDATE_pn-quilt = "Jun 22, 2010"
 RECIPE_MAINTAINER_pn-quilt = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-tcl="green"
-RECIPE_LATEST_VERSION_pn-tcl="8.5.9"
-RECIPE_LAST_UPDATE_pn-tcl = "Dec 1, 2010"
+RECIPE_LATEST_VERSION_pn-tcl="8.5.11"
+RECIPE_LAST_UPDATE_pn-tcl = "Nov 16, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-tcl = "Nov 16, 2011" 
 RECIPE_MAINTAINER_pn-tcl = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-unifdef="green" # poky local source files
@@ -3109,13 +3114,13 @@ RECIPE_STATUS_pn-gnu-config="green"
 RECIPE_LATEST_VERSION_pn-gnu-config="svn"
 DISTRO_PN_ALIAS_pn-gnu-config = "OpenedHand"
 RECIPE_LAST_UPDATE_pn-gnu-config = "Jun 21, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-gnu-config = "Oct 18, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-gnu-config = "Nov 16, 2011" 
 RECIPE_MAINTAINER_pn-gnu-config = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-mpfr="green"
-RECIPE_LATEST_VERSION_pn-mpfr="3.0.1"
-RECIPE_MANUAL_CHECK_DATE_pn-mpfr = "Oct 18, 2011" 
-RECIPE_LAST_UPDATE_pn-mpfr = "Apr 07, 2011"
+RECIPE_LATEST_VERSION_pn-mpfr="3.1.0"
+RECIPE_MANUAL_CHECK_DATE_pn-mpfr = "Nov 15, 2011" 
+RECIPE_LAST_UPDATE_pn-mpfr = "Nov 15, 2011"
 RECIPE_MAINTAINER_pn-mpfr = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-gmp="green"
@@ -3131,8 +3136,8 @@ RECIPE_MAINTAINER_pn-libmpc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-libmpc = "Fedora=libmpc OpenSuse=libmpc2"
 
 RECIPE_STATUS_pn-byacc="green" 
-RECIPE_LATEST_VERSION_pn-byacc="20101229"
-RECIPE_MANUAL_CHECK_DATE_pn-byacc = "Oct 18, 2011" 
+RECIPE_LATEST_VERSION_pn-byacc="20110908"
+RECIPE_MANUAL_CHECK_DATE_pn-byacc = "Nov 15, 2011" 
 RECIPE_LAST_UPDATE_pn-byacc = "Oct 18, 2010"
 RECIPE_MAINTAINER_pn-byacc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
-- 
1.7.6.4



