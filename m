Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4aq-0006h2-O5
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632882"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:31:59 -0800
Message-Id: <b2b4b899943b8bd9756f222889b0c51a4d5ba96a.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/62] distro_tracking: update manual_check_date fields
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:37 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   36 +++++++++++---------
 1 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 14eff32..dbcfd2b 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -31,9 +31,9 @@ RECIPE_MAINTAINER_pn-gtk-theme-torturer = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-gtk-theme-torturer = "OSPDT upstream=http://wiki.laptop.org/go/GTK_for_OLPC"
 
 RECIPE_STATUS_pn-libpcre = "green"
-RECIPE_LATEST_VERSION_pn-libpcre = "8.20"
-RECIPE_LAST_UPDATE_pn-libpcre = "Nov 15, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libpcre = "Nov 15, 2011"
+RECIPE_LATEST_VERSION_pn-libpcre = "8.21"
+RECIPE_LAST_UPDATE_pn-libpcre = "Jan 10, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libpcre = "Jan 10, 2012"
 RECIPE_MAINTAINER_pn-libpcre = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-libpcre = "Mandriva=libpcre0 Fedora=pcre"
 
@@ -2979,13 +2979,20 @@ RECIPE_STATUS_pn-ldconfig-native = "red"
 RECIPE_LAST_UPDATE_pn-ldconfig-native = "Nov 23, 2007"
 DISTRO_PN_ALIAS_pn-ldconfig-native = "Ubuntu=libc-bin Fedora=glibc"
 
-RECIPE_STATUS_pn-gcc="red" 
-RECIPE_LATEST_VERSION_pn-gcc="4.6.1"
+RECIPE_LATEST_VERSION_pn-gcc="4.6.2+git"
 RECIPE_LAST_UPDATE_pn-gcc = "May 1, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-gcc = "Jul 06, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-gcc = "Jan 10, 2012" 
 RECIPE_MAINTAINER_pn-gcc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-gcc-runtime = "Ubuntu=gcc Fedora=gcc"
 
+RECIPE_LATEST_VERSION_pn-libgcc = "4.6.2+git"
+RECIPE_LAST_UPDATE_pn-libgcc = "May 1, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libgcc = "Jan 10, 2012" 
+DISTRO_PN_ALIAS_pn-libgcc = "Debian=libgcc4 Ubuntu=libgcc1 OpenSuSE=libgcc46"
+
+RECIPE_LATEST_VERSION_pn-gcc-runtime = "4.6.2+git"
+RECIPE_LAST_UPDATE_pn-gcc-runtime = "May 1, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-gcc-runtime = "Jan 10, 2012" 
 
 RECIPE_STATUS_pn-autoconf="red" 
 RECIPE_LATEST_VERSION_pn-autoconf="2.68"
@@ -3018,7 +3025,7 @@ DISTRO_PN_ALIAS_pn-distcc = "Debian=distcc Fedora=distcc"
 RECIPE_STATUS_pn-flex="green" 
 RECIPE_LATEST_VERSION_pn-flex="2.5.35"
 RECIPE_LAST_UPDATE_pn-flex = "Jun 20, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-flex = "Nov 16, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-flex = "Jan 10, 2012" 
 RECIPE_MAINTAINER_pn-flex = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-fstests="green"  
@@ -3075,14 +3082,14 @@ RECIPE_MAINTAINER_pn-postinsts = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-nasm="green"
 RECIPE_LATEST_VERSION_pn-nasm="2.07"
-RECIPE_MANUAL_CHECK_DATE_pn-nasm = "Nov 16, 2011"
 RECIPE_LAST_UPDATE_pn-nasm = "Jun 23, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-nasm = "Jan 10, 2012"
 RECIPE_MAINTAINER_pn-nasm = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-btrfs-tools="green"
 RECIPE_LATEST_VERSION_pn-btrfs-tools="git"
-RECIPE_MANUAL_CHECK_DATE_pn-btrfs-tools = "Oct 18, 2011"
-RECIPE_LAST_UPDATE_pn-btrfs-tools = "Jun 09, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-btrfs-tools = "Jan 10, 2012"
+RECIPE_LAST_UPDATE_pn-btrfs-tools = "Jan 10, 2012"
 RECIPE_MAINTAINER_pn-btrfs-tools = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
 
@@ -3143,6 +3150,7 @@ DISTRO_PN_ALIAS_pn-python-pyrex = "Mandriva=python-pyrex Ubuntu=python-pyrex"
 RECIPE_STATUS_pn-python-scons="green"
 RECIPE_LATEST_VERSION_pn-python-scons="2.1.0"
 RECIPE_LAST_UPDATE_pn-python-scons = "Oct 18, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-python-scons = "Jan 10, 2012"
 DISTRO_PN_ALIAS_pn-python-scons = "Fedora=scons OpenSuSE=scons Ubuntu=scons Mandriva=scons Debian=scons"
 RECIPE_MANUAL_CHECK_DATE_pn-python-scons = "Nov 16, 2011" 
 RECIPE_MAINTAINER_pn-python-scons = "Nitin A Kamble <nitin.a.kamble@intel.com>"
@@ -3160,7 +3168,7 @@ RECIPE_MAINTAINER_pn-quilt = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 RECIPE_STATUS_pn-tcl="green"
 RECIPE_LATEST_VERSION_pn-tcl="8.5.11"
 RECIPE_LAST_UPDATE_pn-tcl = "Nov 16, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-tcl = "Nov 16, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-tcl = "Jan 10, 2012" 
 RECIPE_MAINTAINER_pn-tcl = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-unifdef="green" # poky local source files
@@ -3176,7 +3184,7 @@ RECIPE_MAINTAINER_pn-gnu-config = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-mpfr="green"
 RECIPE_LATEST_VERSION_pn-mpfr="3.1.0"
-RECIPE_MANUAL_CHECK_DATE_pn-mpfr = "Nov 15, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-mpfr = "Jan 10, 2012" 
 RECIPE_LAST_UPDATE_pn-mpfr = "Nov 15, 2011"
 RECIPE_MAINTAINER_pn-mpfr = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
@@ -5992,10 +6000,6 @@ RECIPE_LAST_UPDATE_pn-mailx = "Jul 1, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-mailx = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-mailx = "Kai Kang <kai.kang@windriver.com>"
 
-RECIPE_LATEST_VERSION_pn-libgcc = "4.5.1"
-DISTRO_PN_ALIAS_pn-libgcc = "Debian=libgcc4 Ubuntu=libgcc1 OpenSuSE=libgcc45"
-RECIPE_MANUAL_CHECK_DATE_pn-libgcc = "Feb 28, 2011"
-
 RECIPE_STATUS_pn-transfig = "green"
 RECIPE_DEPENDENCY_CHECK_pn-transfig = "not done"
 RECIPE_LATEST_VERSION_pn-transfig = "3.2.5d"
-- 
1.7.6.5



