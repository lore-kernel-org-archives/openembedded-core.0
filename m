Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWO3-0005CX-2l
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:32:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2011 23:29:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="632967555"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2011 23:29:23 -0700
Message-Id: <cb23a290a021457c9f26f645571ee5c3e328d17f.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Fri, 8 Apr 2011 02:49:44 -0700
Date: Fri, 22 Apr 2011 23:29:23 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 08:41:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 29/37] distro_tracking: recipe information update
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
X-List-Received-Date: Sat, 23 Apr 2011 06:32:11 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 4598f3c..e7201b0 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -91,6 +91,7 @@ RECIPE_MAINTAINER_pn-minicom = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-patch = "green"
 RECIPE_LATEST_VERIONS_pn-patch = "2.6.1"
 RECIPE_LAST_UPDATE_pn-patch = "Dec 7, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-patch = "Apr 7, 2011" 
 RECIPE_MAINTAINER_pn-patch = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-python-imaging = "green"
@@ -2876,11 +2877,13 @@ RECIPE_STATUS_pn-fstests="green"
 RECIPE_LATEST_VERSION_pn-fstests="0.0+svnr426"
 DISTRO_PN_ALIAS_pn-fstests = "OpenedHand"
 RECIPE_LAST_UPDATE_pn-fstests = "Dec 7, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-fstests = "Apr 7, 2011" 
 RECIPE_MAINTAINER_pn-fstests = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-gdb="green" 
 RECIPE_LATEST_VERSION_pn-gdb="7.2"
 RECIPE_LAST_UPDATE_pn-gdb = "Nov 8, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-gdb = "Apr 7, 2011" 
 RECIPE_MAINTAINER_pn-gdb = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-intltool="green" 
@@ -2914,7 +2917,7 @@ RECIPE_MAINTAINER_pn-postinsts = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-nasm="green" 
 RECIPE_LATEST_VERSION_pn-nasm="2.07"
-RECIPE_MANUAL_CHECK_DATE_pn-nasm = "Jan 25, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-nasm = "Apr 7, 2011" 
 RECIPE_MAINTAINER_pn-nasm = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-perl="red" # upgrade needed
@@ -3000,7 +3003,7 @@ RECIPE_MAINTAINER_pn-gnu-config = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-mpfr="green"
 RECIPE_LATEST_VERSION_pn-mpfr="3.0.0"
-RECIPE_MANUAL_CHECK_DATE_pn-mpfr = "Jan 25, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-mpfr = "Apr 7, 2011" 
 RECIPE_MAINTAINER_pn-mpfr = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-gmp="green"
-- 
1.7.1.1



