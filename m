Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S809j-00034S-Kp
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 03:11:07 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Mar 2012 19:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119089802"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 14 Mar 2012 19:02:18 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 19:02:12 -0700
Message-Id: <88204ee6aaa624d64714dc191a7d81e622064344.1331776831.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
References: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1331776831.git.nitin.a.kamble@intel.com>
References: <cover.1331776831.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/8] distro-tracking: update status of recipes
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
X-List-Received-Date: Thu, 15 Mar 2012 02:11:07 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   24 ++++++++++---------
 1 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 8ad924b..b4ea423 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -37,7 +37,8 @@ RECIPE_MANUAL_CHECK_DATE_pn-libpcre = "Feb 01, 2012"
 RECIPE_MAINTAINER_pn-libpcre = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-libpcre = "Mandriva=libpcre0 Fedora=pcre"
 
-RECIPE_LATEST_VERSION_pn-bdwgc = "7.2alpha5"
+RECIPE_LATEST_VERSION_pn-bdwgc = "20110107"
+RECIPE_NO_UPDATE_REASON_pn-bdwgc = "20110107 is same as the 7.2alpha5"
 RECIPE_LAST_UPDATE_pn-bdwgc = "Feb 01, 2012"
 RECIPE_MANUAL_CHECK_DATE_pn-bdwgc = "Feb 01, 2012"
 RECIPE_MAINTAINER_pn-bdwgc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
@@ -3089,9 +3090,9 @@ RECIPE_NO_UPDATE_REASON_pn-autoconf="seeing rpm issue with the 2.68 version, a b
 RECIPE_MAINTAINER_pn-autoconf = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-automake="green" 
-RECIPE_LATEST_VERSION_pn-automake="1.11.1"
-RECIPE_LAST_UPDATE_pn-automake = "Jan 29, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-automake = "Jul 06, 2011" 
+RECIPE_LATEST_VERSION_pn-automake="1.11.3"
+RECIPE_LAST_UPDATE_pn-automake = "Mar 14, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-automake = "Mar 14, 2012" 
 RECIPE_MAINTAINER_pn-automake = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-bison="green" 
@@ -3278,9 +3279,9 @@ RECIPE_LAST_UPDATE_pn-mpfr = "Nov 15, 2011"
 RECIPE_MAINTAINER_pn-mpfr = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-gmp="green"
-RECIPE_LATEST_VERSION_pn-gmp="5.0.3"
-RECIPE_LAST_UPDATE_pn-gmp = "Feb 01, 2012"
-RECIPE_MANUAL_CHECK_DATE_pn-gmp = "Feb 01, 2012" 
+RECIPE_LATEST_VERSION_pn-gmp="5.0.4"
+RECIPE_LAST_UPDATE_pn-gmp = "Mar 14, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-gmp = "Mar 14, 2012" 
 RECIPE_MAINTAINER_pn-gmp = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-libmpc="green"
@@ -5933,10 +5934,11 @@ RECIPE_STATUS_pn-groff = "red"
 RECIPE_LATEST_VERSION_pn-groff = "1.21"
 RECIPE_NO_UPDATE_REASON_pn-groff = "1.18.1.4 is latest GPLv2 Version no 1.21"
 
-RECIPE_STATUS_pn-eglibc = "red"
-RECIPE_LATEST_VERSION_pn-eglibc = "2.13-r15508"
-RECIPE_LAST_UPDATE_pn-eglibc = "Nov 16, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-eglibc = "Nov 16, 2011"
+RECIPE_STATUS_pn-eglibc = "green"
+RECIPE_LATEST_VERSION_pn-eglibc = "git:16540"
+RECIPE_LAST_UPDATE_pn-eglibc = "Jan 01, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-eglibc = "Jan 01, 2012"
+RECIPE_MAINTAINER_pn-eglibc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-lighttpd = "red"
 RECIPE_LAST_UPDATE_pn-lighttpd = "Jul 28, 2011"
-- 
1.7.6.4



