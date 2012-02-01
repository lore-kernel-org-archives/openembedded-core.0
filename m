Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RsjvD-0003f2-Ok
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 00:49:04 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Feb 2012 15:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="62271872"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Feb 2012 15:41:03 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 15:41:01 -0800
Message-Id: <8dbca044af5bafe553b404af45a4f8ab238280fa.1328139407.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <6e7973add09749de3b14543fde53791076063657.1328139407.git.nitin.a.kamble@intel.com>
References: <6e7973add09749de3b14543fde53791076063657.1328139407.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1328139407.git.nitin.a.kamble@intel.com>
References: <cover.1328139407.git.nitin.a.kamble@intel.com>
Subject: [patch-v2 7/7] distro_tracking: update for current upgrades
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
X-List-Received-Date: Wed, 01 Feb 2012 23:49:04 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   47 ++++++++++----------
 1 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 1eb08a2..6236287 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -33,13 +33,13 @@ DISTRO_PN_ALIAS_pn-gtk-theme-torturer = "OSPDT upstream=http://wiki.laptop.org/g
 RECIPE_STATUS_pn-libpcre = "green"
 RECIPE_LATEST_VERSION_pn-libpcre = "8.21"
 RECIPE_LAST_UPDATE_pn-libpcre = "Jan 10, 2012"
-RECIPE_MANUAL_CHECK_DATE_pn-libpcre = "Jan 10, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libpcre = "Feb 01, 2012"
 RECIPE_MAINTAINER_pn-libpcre = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-libpcre = "Mandriva=libpcre0 Fedora=pcre"
 
-RECIPE_LATEST_VERSION_pn-bdwgc = "20110107"
-RECIPE_LAST_UPDATE_pn-bdwgc = "Jan 17, 2012"
-RECIPE_MANUAL_CHECK_DATE_pn-bdwgc = "Jan 17, 2012"
+RECIPE_LATEST_VERSION_pn-bdwgc = "7.2alpha5"
+RECIPE_LAST_UPDATE_pn-bdwgc = "Feb 01, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-bdwgc = "Feb 01, 2012"
 RECIPE_MAINTAINER_pn-bdwgc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libunistring = "0.9.3"
@@ -3013,7 +3013,7 @@ DISTRO_PN_ALIAS_pn-ldconfig-native = "Ubuntu=libc-bin Fedora=glibc"
 
 RECIPE_LATEST_VERSION_pn-gcc="4.6.2+git"
 RECIPE_LAST_UPDATE_pn-gcc = "May 1, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-gcc = "Jan 10, 2012" 
+RECIPE_MANUAL_CHECK_DATE_pn-gcc = "Feb 01, 2012" 
 RECIPE_MAINTAINER_pn-gcc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-gcc-runtime = "Ubuntu=gcc Fedora=gcc"
 
@@ -3057,7 +3057,7 @@ DISTRO_PN_ALIAS_pn-distcc = "Debian=distcc Fedora=distcc"
 RECIPE_STATUS_pn-flex="green" 
 RECIPE_LATEST_VERSION_pn-flex="2.5.35"
 RECIPE_LAST_UPDATE_pn-flex = "Jun 20, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-flex = "Jan 10, 2012" 
+RECIPE_MANUAL_CHECK_DATE_pn-flex = "Feb 01, 2012" 
 RECIPE_MAINTAINER_pn-flex = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-fstests="green"  
@@ -3068,9 +3068,9 @@ RECIPE_MANUAL_CHECK_DATE_pn-fstests = "Jul 06, 2011"
 RECIPE_MAINTAINER_pn-fstests = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-gdb="green" 
-RECIPE_LATEST_VERSION_pn-gdb="7.2"
-RECIPE_LAST_UPDATE_pn-gdb = "Nov 8, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-gdb = "Jul 06, 2011" 
+RECIPE_LATEST_VERSION_pn-gdb="7.4"
+RECIPE_LAST_UPDATE_pn-gdb = "Feb 1, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-gdb = "Feb 01, 2012" 
 RECIPE_MAINTAINER_pn-gdb = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-intltool="green" 
@@ -3115,13 +3115,13 @@ RECIPE_MAINTAINER_pn-postinsts = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 RECIPE_STATUS_pn-nasm="green"
 RECIPE_LATEST_VERSION_pn-nasm="2.07"
 RECIPE_LAST_UPDATE_pn-nasm = "Jun 23, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-nasm = "Jan 10, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-nasm = "Feb 01, 2012"
 RECIPE_MAINTAINER_pn-nasm = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-btrfs-tools="green"
 RECIPE_LATEST_VERSION_pn-btrfs-tools="git"
-RECIPE_MANUAL_CHECK_DATE_pn-btrfs-tools = "Jan 10, 2012"
 RECIPE_LAST_UPDATE_pn-btrfs-tools = "Jan 10, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-btrfs-tools = "Feb 01, 2012"
 RECIPE_MAINTAINER_pn-btrfs-tools = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
 
@@ -3138,8 +3138,8 @@ RECIPE_MANUAL_CHECK_DATE_pn-prelink = "Jan 13, 2012"
 RECIPE_MAINTAINER_pn-prelink = "Mark Hatle <mark.hatle@windriver.com>"
 
 RECIPE_STATUS_pn-python-dbus="green" 
-RECIPE_LATEST_VERSION_pn-python-dbus="0.84.0"
-RECIPE_LAST_UPDATE_pn-python-dbus = "Oct 18, 2011"
+RECIPE_LATEST_VERSION_pn-python-dbus="1.0.0"
+RECIPE_LAST_UPDATE_pn-python-dbus = "Feb 01, 2012"
 RECIPE_MAINTAINER_pn-python-dbus = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-python-dbus = "Ubuntu=python-dbus Debian=python-dbus Mandriva=python-dbus"
 
@@ -3182,9 +3182,8 @@ DISTRO_PN_ALIAS_pn-python-pyrex = "Mandriva=python-pyrex Ubuntu=python-pyrex"
 RECIPE_STATUS_pn-python-scons="green"
 RECIPE_LATEST_VERSION_pn-python-scons="2.1.0"
 RECIPE_LAST_UPDATE_pn-python-scons = "Oct 18, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-python-scons = "Jan 10, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-python-scons = "Feb 01, 2012"
 DISTRO_PN_ALIAS_pn-python-scons = "Fedora=scons OpenSuSE=scons Ubuntu=scons Mandriva=scons Debian=scons"
-RECIPE_MANUAL_CHECK_DATE_pn-python-scons = "Nov 16, 2011" 
 RECIPE_MAINTAINER_pn-python-scons = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-python="red"
@@ -3193,14 +3192,14 @@ RECIPE_LAST_UPDATE_pn-python = "Nov 8, 2010"
 RECIPE_MAINTAINER_pn-python = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-quilt="green"
-RECIPE_LATEST_VERSION_pn-quilt="0.48"
-RECIPE_LAST_UPDATE_pn-quilt = "Jun 22, 2010"
+RECIPE_LATEST_VERSION_pn-quilt="0.51"
+RECIPE_LAST_UPDATE_pn-quilt = "Feb 01, 2012"
 RECIPE_MAINTAINER_pn-quilt = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-tcl="green"
 RECIPE_LATEST_VERSION_pn-tcl="8.5.11"
 RECIPE_LAST_UPDATE_pn-tcl = "Nov 16, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-tcl = "Jan 10, 2012" 
+RECIPE_MANUAL_CHECK_DATE_pn-tcl = "Feb 01, 2012" 
 RECIPE_MAINTAINER_pn-tcl = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-unifdef="green" # poky local source files
@@ -3221,9 +3220,9 @@ RECIPE_LAST_UPDATE_pn-mpfr = "Nov 15, 2011"
 RECIPE_MAINTAINER_pn-mpfr = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-gmp="green"
-RECIPE_LATEST_VERSION_pn-gmp="5.0.2"
-RECIPE_LAST_UPDATE_pn-gmp = "Jul 06, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-gmp = "Jul 06, 2011" 
+RECIPE_LATEST_VERSION_pn-gmp="5.0.3"
+RECIPE_LAST_UPDATE_pn-gmp = "Feb 01, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-gmp = "Feb 01, 2012" 
 RECIPE_MAINTAINER_pn-gmp = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-libmpc="green"
@@ -3233,9 +3232,9 @@ RECIPE_MAINTAINER_pn-libmpc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-libmpc = "Fedora=libmpc OpenSuse=libmpc2"
 
 RECIPE_STATUS_pn-byacc="green" 
-RECIPE_LATEST_VERSION_pn-byacc="20110908"
-RECIPE_MANUAL_CHECK_DATE_pn-byacc = "Nov 15, 2011" 
-RECIPE_LAST_UPDATE_pn-byacc = "Oct 18, 2010"
+RECIPE_LATEST_VERSION_pn-byacc="20120115"
+RECIPE_MANUAL_CHECK_DATE_pn-byacc = "Feb 01, 2012" 
+RECIPE_LAST_UPDATE_pn-byacc = "Feb 01, 2012"
 RECIPE_MAINTAINER_pn-byacc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-libconvert-asn1-perl="green" 
-- 
1.7.6.4



