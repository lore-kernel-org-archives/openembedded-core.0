Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TW5fr-0006Hp-Ph
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Nov 2012 14:28:08 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2012 05:13:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,730,1344236400"; d="scan'208";a="238518163"
Received: from unknown (HELO swold-mobl.kubiwireless.com) ([10.255.14.129])
	by orsmga002.jf.intel.com with ESMTP; 07 Nov 2012 05:14:17 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Nov 2012 05:14:13 -0800
Message-Id: <1352294053-21248-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1352294053-21248-1-git-send-email-sgw@linux.intel.com>
References: <1352294053-21248-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] upstream_tracking: Update for 1.4 Planning
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Nov 2012 13:28:08 -0000

The following need updating based on this review:
kconfig-frontends
libcheck
sqlite3
libmad
less
sysstat
psmisc

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/upstream_tracking.inc      |   58 ++++++++++----------
 1 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/meta-yocto/conf/distro/include/upstream_tracking.inc b/meta-yocto/conf/distro/include/upstream_tracking.inc
index fd422cf..7140477 100644
--- a/meta-yocto/conf/distro/include/upstream_tracking.inc
+++ b/meta-yocto/conf/distro/include/upstream_tracking.inc
@@ -86,7 +86,7 @@ RECIPE_UPSTREAM_VERSION_pn-bluez4="4.101"
 RECIPE_UPSTREAM_DATE_pn-bluez4="Jun 22, 2012"
 CHECK_DATE_pn-bluez4 = "Aug 27, 2012"
 RECIPE_UPSTREAM_VERSION_pn-boost = "1.51.0"
-CHECK_DATE_pn-boost = "Aug 27, 2012"
+CHECK_DATE_pn-boost = "Nov 02, 2012"
 RECIPE_UPSTREAM_DATE_pn-boost = "Aug 20, 2012"
 RECIPE_UPSTREAM_VERSION_pn-btrfs-tools="git"
 RECIPE_UPSTREAM_VERSION_pn-busybox = "1.20.2"
@@ -137,7 +137,7 @@ RECIPE_UPSTREAM_DATE_pn-connman="Aug 22, 2012"
 CHECK_DATE_pn-connman = "Aug 28, 2012"
 RECIPE_UPSTREAM_VERSION_pn-console-tools = "0.3.2"
 RECIPE_UPSTREAM_DATE_pn-console-tools = "Feb 18, 2002"
-CHECK_DATE_pn-console-tools = "Aug 28, 2012"
+CHECK_DATE_pn-console-tools = "Nov 02, 2012"
 RECIPE_UPSTREAM_VERSION_pn-consolekit = "0.4.5"
 RECIPE_UPSTREAM_DATE_pn-consolekit = "May 2, 2011"
 CHECK_DATE_pn-consolekit = "Aug 28, 2012"
@@ -149,7 +149,7 @@ RECIPE_UPSTREAM_VERSION_pn-cpio = "2.11"
 RECIPE_UPSTREAM_DATE_pn-cpio = "Mar 01, 2010"
 CHECK_DATE_pn-cpio = "Aug 28, 2012"
 RECIPE_UPSTREAM_VERSION_pn-cracklib="2.8.19"
-CHECK_DATE_pn-cracklib = "Aug 28, 2012"
+CHECK_DATE_pn-cracklib = "Nov 02, 2012"
 RECIPE_UPSTREAM_DATE_pn-cracklib = "May 18, 2010"
 RECIPE_UPSTREAM_VERSION_pn-createrepo = "0.9.9"
 RECIPE_NO_UPDATE_REASON_pn-createrepo = "Versions after 0.9.* use YUM, so we hold at 0.4.11"
@@ -183,7 +183,7 @@ RECIPE_UPSTREAM_VERSION_pn-diffstat="1.55"
 RECIPE_UPSTREAM_DATE_pn-diffstat = "Jan 03, 2012"
 CHECK_DATE_pn-diffstat = "Aug 28, 2012"
 RECIPE_UPSTREAM_VERSION_pn-diffutils = "3.2"
-RECIPE_UPSTREAM_DATE_pn-diffutils = "Sept 3, 2011"
+RECIPE_UPSTREAM_DATE_pn-diffutils = "Sep 3, 2011"
 CHECK_DATE_pn-diffutils = "Aug 28, 2012"
 RECIPE_UPSTREAM_DATE_pn-direcfb = "Jun 29, 2012"
 RECIPE_UPSTREAM_VERSION_pn-directfb = "1.6.1"
@@ -332,7 +332,7 @@ RECIPE_UPSTREAM_DATE_pn-git = "Aug 20, 2012"
 CHECK_DATE_pn-git = "Aug 29, 2012"
 RECIPE_UPSTREAM_VERSION_pn-glew = "1.9.0"
 RECIPE_UPSTREAM_DATE_pn-glew = "Jun 08, 2012"
-CHECK_DATE_pn-glew = "Aug 29, 2012"
+CHECK_DATE_pn-glew = "Nov 02, 2012"
 RECIPE_UPSTREAM_DATE_pn-glib-2.0 = "Nov 11, 2011"
 RECIPE_UPSTREAM_VERSION_pn-glibc = "2.11.2"
 RECIPE_UPSTREAM_DATE_pn-glibc = "May 01, 2010"
@@ -471,9 +471,9 @@ CHECK_DATE_pn-json-glib = "Aug 29, 2012"
 RECIPE_UPSTREAM_VERSION_pn-kbproto = "1.0.6"
 RECIPE_UPSTREAM_DATE_pn-kbproto = "Mar 23, 2012"
 CHECK_DATE_pn-kbproto = "Aug 29, 2012"
-RECIPE_UPSTREAM_VERSION_pn-kconfig-frontends = "3.5.0"
-RECIPE_UPSTREAM_DATE_pn-kconfig-frontends = "Jul 22, 2012"
-CHECK_DATE_pn-kconfig-frontends = "Sep 11, 2012"
+RECIPE_UPSTREAM_VERSION_pn-kconfig-frontends = "3.6.0"
+RECIPE_UPSTREAM_DATE_pn-kconfig-frontends = "Oct 06, 2012"
+CHECK_DATE_pn-kconfig-frontends = "Nov 02, 2012"
 RECIPE_UPSTREAM_VERSION_pn-kern-tools-native = "check"
 RECIPE_UPSTREAM_VERSION_pn-kernelshark = "0.2"
 RECIPE_NO_UPDATE_REASON_pn-kernelshark = "0.2 is the latest version."
@@ -496,9 +496,9 @@ CHECK_DATE_pn-latencytop = "Aug 29, 2011"
 RECIPE_UPSTREAM_DATE_pn-latencytop = "Apr 28, 2009"
 RECIPE_UPSTREAM_VERSION_pn-leafpad = "0.8.18.1"
 RECIPE_UPSTREAM_DATE_pn-leafpad = "Dec 01, 2010"
-RECIPE_UPSTREAM_VERSION_pn-less = "444"
-CHECK_DATE_pn-less = "Aug 29, 2012"
-RECIPE_UPSTREAM_DATE_pn-less = "Jun 9, 2011"
+RECIPE_UPSTREAM_VERSION_pn-less = "451"
+RECIPE_UPSTREAM_DATE_pn-less = "Sep 04, 2012"
+CHECK_DATE_pn-less = "Nov 02, 2012"
 RECIPE_UPSTREAM_VERSION_pn-liba52="0.7.4"
 CHECK_DATE_pn-liba52 = "Aug 29, 2012"
 RECIPE_UPSTREAM_DATE_pn-liba52="Jul 27, 2002"
@@ -526,10 +526,10 @@ CHECK_DATE_pn-libcap = "Aug 30, 2012"
 RECIPE_UPSTREAM_DATE_pn-libcap = "Jan 01, 2010"
 RECIPE_UPSTREAM_VERSION_pn-libcgroup = "0.38-1"
 RECIPE_UPSTREAM_DATE_pn-libcgroup = "Jun 06, 2012"
-CHECK_DATE_pn-libcgroup = "Sep 11, 2012"
-RECIPE_UPSTREAM_VERSION_pn-libcheck = "0.9.8"
-CHECK_DATE_pn-libcheck = "Aug 30, 2012"
-RECIPE_UPSTREAM_DATE_pn-libcheck = "Sep 23, 2009"
+CHECK_DATE_pn-libcgroup = "Nov 2, 2012"
+RECIPE_UPSTREAM_VERSION_pn-libcheck = "0.9.9"
+RECIPE_UPSTREAM_DATE_pn-libcheck = "Oct 22, 2009"
+CHECK_DATE_pn-libcheck = "Nov 02, 2012"
 RECIPE_UPSTREAM_VERSION_pn-libconvert-asn1-perl="0.22"
 RECIPE_UPSTREAM_DATE_pn-libconvert-asn1-perl = "Apr 16, 2008"
 CHECK_DATE_pn-libconvert-asn1-perl = "Aug 30, 2012"
@@ -558,7 +558,7 @@ CHECK_DATE_pn-libevent = "Aug 30, 2012"
 RECIPE_UPSTREAM_DATE_pn-libevent = "Aug 23, 2011"
 RECIPE_UPSTREAM_DATE_pn-libexif = "Jul 07, 2012"
 RECIPE_UPSTREAM_VERSION_pn-libexif = "0.6.21"
-CHECK_DATE_pn-libexif = "Aug 30, 2012"
+CHECK_DATE_pn-libexif = "Nov 02, 2012"
 RECIPE_UPSTREAM_VERSION_pn-libfakekey = "0.0+svnr2031"
 RECIPE_UPSTREAM_DATE_pn-libfakekey = "Jul 01, 2006"
 CHECK_DATE_pn-libfakekey = "Aug 30, 2012"
@@ -634,9 +634,9 @@ CHECK_DATE_pn-libjson = "Aug 30, 2012"
 RECIPE_UPSTREAM_VERSION_pn-liblbxutil = "1.1.0"
 RECIPE_UPSTREAM_DATE_pn-liblbxutil = "Dec 4, 2009"
 CHECK_DATE_pn-liblbuxutil = "Aug 30, 2012"
-RECIPE_UPSTREAM_VERSION_pn-libmad = "0.15.2b"
-CHECK_DATE_pn-libmad = "Aug 30, 2012"
-RECIPE_UPSTREAM_DATE_pn-libmad = "Apr 04, 2004"
+RECIPE_UPSTREAM_VERSION_pn-libmad = "0.15.1b"
+RECIPE_UPSTREAM_DATE_pn-libmad = "Feb 18, 2004"
+CHECK_DATE_pn-libmad = "Nov 02, 2012"
 RECIPE_UPSTREAM_VERSION_pn-libmatchbox = "1.9"
 RECIPE_UPSTREAM_DATE_pn-libmatchbox = "Aug 01, 2006"
 CHECK_DATE_pn-libmatchbox = "Aug 30, 2012"
@@ -1130,9 +1130,9 @@ RECIPE_UPSTREAM_DATE_pn-procps = "unknown"
 CHECK_DATE_pn-procps = "Aug 31, 2012"
 RECIPE_UPSTREAM_VERSION_pn-pseudo = "1.2"
 CHECK_DATE_pn-pseudo = "Aug 31, 2012"
-RECIPE_UPSTREAM_VERSION_pn-psmisc = "22.19"
-CHECK_DATE_pn-psmisc = "Aug 31, 2012"
-RECIPE_UPSTREAM_DATE_pn-psmisc = "Jun 22, 2012"
+RECIPE_UPSTREAM_VERSION_pn-psmisc = "22.20"
+RECIPE_UPSTREAM_DATE_pn-psmisc = "Sep 20, 2012"
+CHECK_DATE_pn-psmisc = "Nov 02, 2012"
 RECIPE_UPSTREAM_VERSION_pn-psplash = "0.0+svnr424"
 RECIPE_UPSTREAM_DATE_pn-psplash = "May 01, 2009"
 CHECK_DATE_pn-psplash = "Aug 31, 2012"
@@ -1253,9 +1253,9 @@ RECIPE_UPSTREAM_DATE_pn-socat = "Aug 07, 2011"
 RECIPE_UPSTREAM_VERSION_pn-speex="1.2rc1"
 RECIPE_UPSTREAM_DATE_pn-speex="Jul 24, 2008"
 CHECK_DATE_pn-speex = "Sep 03, 2012"
-RECIPE_UPSTREAM_VERSION_pn-sqlite3 = "3.7.13"
-RECIPE_UPSTREAM_DATE_pn-sqlite3 = "Jun 11, 2012"
-CHECK_DATE_pn-sqlite3= "Sep 03, 2012"
+RECIPE_UPSTREAM_VERSION_pn-sqlite3 = "3.7.14.1"
+RECIPE_UPSTREAM_DATE_pn-sqlite3 = "Oct 22, 2012"
+CHECK_DATE_pn-sqlite3= "Nov 02, 2012"
 RECIPE_UPSTREAM_VERSION_pn-squashfs-tools = "4.2"
 RECIPE_UPSTREAM_DATE_pn-squashfs-tools = "Feb 28, 2011"
 CHECK_DATE_pn-squashfs-tools = "Sep 03, 2012"
@@ -1274,7 +1274,7 @@ RECIPE_UPSTREAM_VERSION_pn-sudo = "1.8.5p3"
 RECIPE_UPSTREAM_DATE_pn-sudo = "Aug 13, 2012"
 CHECK_DATE_pn-sudo = "Sep 03, 2012"
 RECIPE_UPSTREAM_VERSION_pn-sysfsutils = "2.1.0"
-CHECK_DATE_pn-sysfsutils = "Sep 03, 2012"
+CHECK_DATE_pn-sysfsutils = "Nov 02, 2012"
 RECIPE_UPSTREAM_DATE_pn-sysfsutils = "Aug 23, 2006"
 RECIPE_UPSTREAM_VERSION_pn-sysklogd = "1.5"
 RECIPE_UPSTREAM_DATE_pn-sysklogd = "Oct 25, 2010"
@@ -1286,9 +1286,9 @@ RECIPE_UPSTREAM_VERSION_pn-sysprof = "1.1.8"
 RECIPE_UPSTREAM_VERSION_pn-sysprof = "6b5b8432711ef5c747f8375073cd9af88922d3c6"
 RECIPE_UPSTREAM_DATE_pn-sysprof = "Dec 01, 2010"
 CHECK_DATE_pn-sysprof = "Sep 03, 2012"
-RECIPE_UPSTREAM_VERSION_pn-sysstat = "10.1.1"
-CHECK_DATE_pn-sysstat = "Sep 03, 2012"
-RECIPE_UPSTREAM_DATE_pn-sysstat = "Jul 07, 2012"
+RECIPE_UPSTREAM_VERSION_pn-sysstat = "10.1.2"
+RECIPE_UPSTREAM_DATE_pn-sysstat = "Oct 06, 2012"
+CHECK_DATE_pn-sysstat = "Nov 02, 2012"
 RECIPE_UPSTREAM_VERSION_pn-sysvinit = "2.86"
 RECIPE_UPSTREAM_DATE_pn-sysvinit = "Oct 10, 2006"
 CHECK_DATE_pn-sysvinit = "Sep 03, 2012"
-- 
1.7.7.6



