Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RGG9k-0001jJ-B4
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 22:21:01 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Oct 2011 13:15:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,366,1315206000"; d="scan'208";a="75176417"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 18 Oct 2011 13:15:04 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Oct 2011 13:15:02 -0700
Message-Id: <77eca618435e00a3e2c709cdbff243a73435a8cd.1318968860.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <66cdd5054e220fcce980222ed68a2afc37f614af.1318968860.git.nitin.a.kamble@intel.com>
References: <66cdd5054e220fcce980222ed68a2afc37f614af.1318968860.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1318968860.git.nitin.a.kamble@intel.com>
References: <cover.1318968860.git.nitin.a.kamble@intel.com>
Subject: [PATCH 5/5] distro-tracking: update data for few of my recipes
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
X-List-Received-Date: Tue, 18 Oct 2011 20:21:01 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   38 ++++++++++++--------
 1 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index abc2cbf..f82189d 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -3005,11 +3005,19 @@ RECIPE_STATUS_pn-run-postinsts="green" # all local code
 RECIPE_LATEST_VERSION_pn-postinsts="1.0"
 RECIPE_MAINTAINER_pn-postinsts = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
-RECIPE_STATUS_pn-nasm="green" 
+RECIPE_STATUS_pn-nasm="green"
 RECIPE_LATEST_VERSION_pn-nasm="2.07"
-RECIPE_MANUAL_CHECK_DATE_pn-nasm = "Jul 06, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-nasm = "Oct 18, 2011"
+RECIPE_LAST_UPDATE_pn-nasm = "Jun 23, 2010"
 RECIPE_MAINTAINER_pn-nasm = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
+RECIPE_STATUS_pn-btrfs-tools="green"
+RECIPE_LATEST_VERSION_pn-btrfs-tools="git"
+RECIPE_MANUAL_CHECK_DATE_pn-btrfs-tools = "Oct 18, 2011"
+RECIPE_LAST_UPDATE_pn-btrfs-tools = "Jun 09, 2011"
+RECIPE_MAINTAINER_pn-btrfs-tools = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
+
 RECIPE_STATUS_pn-perl="red" # upgrade needed
 RECIPE_LATEST_VERSION_pn-perl="5.12.1"
 RECIPE_LAST_UPDATE_pn-perl = "May 27, 2007"
@@ -3020,9 +3028,9 @@ RECIPE_LATEST_VERSION_pn-prelink="1.0+git0+0x909470ee441237563d6236c505cb2d02ddc
 RECIPE_LAST_UPDATE_pn-perl = "Jul 23, 2010"
 RECIPE_MAINTAINER_pn-prelink = "Mark Hatle <mark.hatle@windriver.com>"
 
-RECIPE_STATUS_pn-python-dbus="red" 
-RECIPE_LATEST_VERSION_pn-python-dbus="0.83.1"
-RECIPE_LAST_UPDATE_pn-python-dbus = "Jul 7, 2010"
+RECIPE_STATUS_pn-python-dbus="green" 
+RECIPE_LATEST_VERSION_pn-python-dbus="0.84.0"
+RECIPE_LAST_UPDATE_pn-python-dbus = "Oct 18, 2011"
 RECIPE_MAINTAINER_pn-python-dbus = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-python-dbus = "Ubuntu=python-dbus Debian=python-dbus Mandriva=python-dbus"
 
@@ -3062,7 +3070,8 @@ RECIPE_MAINTAINER_pn-python-pyrex = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-python-pyrex = "Mandriva=python-pyrex Ubuntu=python-pyrex"
 
 RECIPE_STATUS_pn-python-scons="green"
-RECIPE_LATEST_VERSION_pn-python-scons="2.0.1"
+RECIPE_LATEST_VERSION_pn-python-scons="2.1.0"
+RECIPE_LAST_UPDATE_pn-python-scons = "Oct 18, 2011"
 DISTRO_PN_ALIAS_pn-python-scons = "Fedora=scons OpenSuSE=scons Ubuntu=scons Mandriva=scons Debian=scons"
 RECIPE_LAST_UPDATE_pn-python-scons = "Nov 8, 2010"
 RECIPE_MAINTAINER_pn-python-scons = "Nitin A Kamble <nitin.a.kamble@intel.com>"
@@ -3087,15 +3096,16 @@ RECIPE_LATEST_VERSION_pn-unifdef="2.6.18+git"
 RECIPE_MAINTAINER_pn-unifdef = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-gnu-config="green" 
-RECIPE_LATEST_VERSION_pn-gnu-config="0.0+git3155524"
+RECIPE_LATEST_VERSION_pn-gnu-config="svn"
 DISTRO_PN_ALIAS_pn-gnu-config = "OpenedHand"
 RECIPE_LAST_UPDATE_pn-gnu-config = "Jun 21, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-gnu-config = "Jul 06, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-gnu-config = "Oct 18, 2011" 
 RECIPE_MAINTAINER_pn-gnu-config = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-mpfr="green"
-RECIPE_LATEST_VERSION_pn-mpfr="3.0.0"
-RECIPE_MANUAL_CHECK_DATE_pn-mpfr = "Jul 06, 2011" 
+RECIPE_LATEST_VERSION_pn-mpfr="3.0.1"
+RECIPE_MANUAL_CHECK_DATE_pn-mpfr = "Oct 18, 2011" 
+RECIPE_LAST_UPDATE_pn-mpfr = "Apr 07, 2011"
 RECIPE_MAINTAINER_pn-mpfr = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-gmp="green"
@@ -3110,9 +3120,10 @@ RECIPE_MANUAL_CHECK_DATE_pn-libmpc = "Jan 25, 2011"
 RECIPE_MAINTAINER_pn-libmpc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-libmpc = "Fedora=libmpc OpenSuse=libmpc2"
 
-RECIPE_STATUS_pn-byacc="red" 
+RECIPE_STATUS_pn-byacc="green" 
 RECIPE_LATEST_VERSION_pn-byacc="20101229"
-RECIPE_MANUAL_CHECK_DATE_pn-byacc = "Jul 06, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-byacc = "Oct 18, 2011" 
+RECIPE_LAST_UPDATE_pn-byacc = "Oct 18, 2010"
 RECIPE_MAINTAINER_pn-byacc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-libconvert-asn1-perl="green" 
@@ -5922,9 +5933,6 @@ RECIPE_COMMENTS_pn-pseudo = "Yocto Project maintained"
 RECIPE_MANUAL_CHECK_DATE_pn-pseudo = "Jun 06, 2011" 
 DISTRO_PN_ALIAS_pn-pseudo = "Windriver"
 
-DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
-RECIPE_MAINTAINER_pn-btrfs-tools = "Nitin A Kamble <nitin.a.kamble@intel.com>"
-
 DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu=rt-tests"
 RECIPE_MAINTAINER_pn-rt-tests = "Darren Hart <dvhart@linux.intel.com>"
 
-- 
1.7.4.4



