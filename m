Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QevJO-00034K-JG
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 22:36:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 13:25:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,495,1304319600"; d="scan'208";a="22782109"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2011 13:25:43 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 13:25:37 -0700
Message-Id: <7ff50baee4685a6cb98fbb08873ebcf5f2e9a396.1310070283.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
References: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1310070283.git.nitin.a.kamble@intel.com>
References: <cover.1310070283.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/7] distro tracking: update devel.toolchain recipes's fields
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
X-List-Received-Date: Thu, 07 Jul 2011 20:36:39 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   33 +++++++++++--------
 1 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 1c251b9..a97a408 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2862,8 +2862,9 @@ RECIPE_LAST_UPDATE_pn-sysprof = "Dec 8, 2010"
 RECIPE_MAINTAINER_pn-sysprof = "Tom Zanussi <tom.zanussi@intel.com>"
 
 RECIPE_STATUS_pn-binutils="green"
-RECIPE_LATEST_VERSION_pn-binutils="2.20.1"
-RECIPE_LAST_UPDATE_pn-binutils = "Jun 3, 2010"
+RECIPE_LATEST_VERSION_pn-binutils="2.21.1"
+RECIPE_LAST_UPDATE_pn-binutils = "Jul 06, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-binutils = "Jul 06, 2011" 
 RECIPE_MAINTAINER_pn-binutils = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-ldconfig-native = "red"
@@ -2871,9 +2872,9 @@ RECIPE_LAST_UPDATE_pn-ldconfig-native = "Nov 23, 2007"
 DISTRO_PN_ALIAS_pn-ldconfig-native = "Ubuntu=libc-bin Fedora=glibc"
 
 RECIPE_STATUS_pn-gcc="red" 
-RECIPE_LATEST_VERSION_pn-gcc="4.5.2"
-RECIPE_LATEST_RELEASE_DATE_pn-gcc="2010/03/03"
-RECIPE_LAST_UPDATE_pn-gcc = "Nov 8, 2010"
+RECIPE_LATEST_VERSION_pn-gcc="4.6.1"
+RECIPE_LAST_UPDATE_pn-gcc = "May 1, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-gcc = "Jul 06, 2011" 
 RECIPE_MAINTAINER_pn-gcc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-autoconf="red" 
@@ -2885,6 +2886,7 @@ RECIPE_MAINTAINER_pn-autoconf = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 RECIPE_STATUS_pn-automake="green" 
 RECIPE_LATEST_VERSION_pn-automake="1.11.1"
 RECIPE_LAST_UPDATE_pn-automake = "Jan 29, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-automake = "Jul 06, 2011" 
 RECIPE_MAINTAINER_pn-automake = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-bison="green" 
@@ -2911,13 +2913,13 @@ RECIPE_STATUS_pn-fstests="green"
 RECIPE_LATEST_VERSION_pn-fstests="0.0+svnr426"
 DISTRO_PN_ALIAS_pn-fstests = "OpenedHand"
 RECIPE_LAST_UPDATE_pn-fstests = "Dec 7, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-fstests = "Apr 7, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-fstests = "Jul 06, 2011" 
 RECIPE_MAINTAINER_pn-fstests = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-gdb="green" 
 RECIPE_LATEST_VERSION_pn-gdb="7.2"
 RECIPE_LAST_UPDATE_pn-gdb = "Nov 8, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-gdb = "Apr 7, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-gdb = "Jul 06, 2011" 
 RECIPE_MAINTAINER_pn-gdb = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-intltool="green" 
@@ -2928,6 +2930,7 @@ RECIPE_MAINTAINER_pn-intltool = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 RECIPE_STATUS_pn-libtool="green" 
 RECIPE_LATEST_VERSION_pn-libtool="2.4"
 RECIPE_LAST_UPDATE_pn-libtool = "Nov 8, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-libtool = "Jul 06, 2011" 
 RECIPE_MAINTAINER_pn-libtool = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-linux-libc-headers="green" 
@@ -2938,7 +2941,7 @@ RECIPE_MAINTAINER_pn-linux-libc-headers = "Nitin A Kamble <nitin.a.kamble@intel.
 RECIPE_STATUS_pn-lsof="green" 
 RECIPE_LATEST_VERSION_pn-lsof="4.84"
 RECIPE_LAST_UPDATE_pn-lsof = "Nov 8, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-lsof = "May 23, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-lsof = "Jul 06, 2011" 
 RECIPE_MAINTAINER_pn-lsof = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-make="green" 
@@ -2953,7 +2956,7 @@ RECIPE_MAINTAINER_pn-postinsts = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-nasm="green" 
 RECIPE_LATEST_VERSION_pn-nasm="2.07"
-RECIPE_MANUAL_CHECK_DATE_pn-nasm = "Apr 7, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-nasm = "Jul 06, 2011" 
 RECIPE_MAINTAINER_pn-nasm = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-perl="red" # upgrade needed
@@ -3035,17 +3038,18 @@ RECIPE_STATUS_pn-gnu-config="green"
 RECIPE_LATEST_VERSION_pn-gnu-config="0.0+git3155524"
 DISTRO_PN_ALIAS_pn-gnu-config = "OpenedHand"
 RECIPE_LAST_UPDATE_pn-gnu-config = "Jun 21, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-gnu-config = "May 23, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-gnu-config = "Jul 06, 2011" 
 RECIPE_MAINTAINER_pn-gnu-config = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-mpfr="green"
 RECIPE_LATEST_VERSION_pn-mpfr="3.0.0"
-RECIPE_MANUAL_CHECK_DATE_pn-mpfr = "Apr 7, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-mpfr = "Jul 06, 2011" 
 RECIPE_MAINTAINER_pn-mpfr = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-gmp="green"
-RECIPE_LATEST_VERSION_pn-gmp="5.0.1"
-RECIPE_LAST_UPDATE_pn-gmp = "Aug 27, 2010"
+RECIPE_LATEST_VERSION_pn-gmp="5.0.2"
+RECIPE_LAST_UPDATE_pn-gmp = "Jul 06, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-gmp = "Jul 06, 2011" 
 RECIPE_MAINTAINER_pn-gmp = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-libmpc="green"
@@ -3056,6 +3060,7 @@ DISTRO_PN_ALIAS_pn-libmpc = "Fedora=libmpc OpenSuse=libmpc2"
 
 RECIPE_STATUS_pn-byacc="red" 
 RECIPE_LATEST_VERSION_pn-byacc="20101229"
+RECIPE_MANUAL_CHECK_DATE_pn-byacc = "Jul 06, 2011" 
 RECIPE_MAINTAINER_pn-byacc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-libconvert-asn1-perl="green" 
@@ -3079,6 +3084,7 @@ RECIPE_MAINTAINER_pn-cmake-native = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-m4="green" 
 RECIPE_LATEST_VERSION_pn-m4="1.4.15"
 RECIPE_LAST_UPDATE_pn-m4 = "Nov 23, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-m4 = "Jul 06, 2011" 
 RECIPE_MAINTAINER_pn-m4="Nitin A Kamble <nitin.a.kamble@intel.com>"
 RECIPE_COMMENTS_pn-m4= "Dongxiao Xu <dongxiao.xu@intel.com> will own GPLv2 m4"
 
@@ -5578,7 +5584,6 @@ RECIPE_LATEST_VERSION_pn-lsbsetup = "0.9"
 RECIPE_MANUAL_CHECK_DATE_pn-lsbsetup = "Jan 17, 2011"
 RECIPE_LATEST_VERSION_pn-libxml-simple-perl = "2.18"
 RECIPE_LATEST_VERSION_pn-talloc = "2.0.5"
-RECIPE_LATEST_VERSION_pn-libtool-cross = "2.4"
 RECIPE_STATUS_pn-gthumb = "red"
 RECIPE_LATEST_VERSION_pn-gthumb = "2.12.2"
 
-- 
1.7.4.4



