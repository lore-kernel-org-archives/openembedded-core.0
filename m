Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPlQa-0006gj-TK
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 04:05:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2012 18:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95772204"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.179])
	by AZSMGA002.ch.intel.com with ESMTP; 02 May 2012 18:56:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 18:55:42 -0700
Message-Id: <9a7514db6abc832563c7e9b22809ff610d146440.1336008687.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336008687.git.sgw@linux.intel.com>
References: <cover.1336008687.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 23/36] distro-tracking: update as per recent recipe upgrades
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
X-List-Received-Date: Thu, 03 May 2012 02:05:57 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index c7e6d7d..f74c8d3 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -89,8 +89,8 @@ RECIPE_LATEST_VERSION_pn-loudmouth = "check"
 RECIPE_MAINTAINER_pn-loudmouth = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-makedepend = "green"
-RECIPE_LATEST_VERSION_pn-makedepend = "1.0.3"
-RECIPE_LAST_UPDATE_pn-makedepend = "Nov 29, 2010"
+RECIPE_LATEST_VERSION_pn-makedepend = "1.0.4"
+RECIPE_LAST_UPDATE_pn-makedepend = "Apr 30, 2012"
 RECIPE_MAINTAINER_pn-makedepend = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-makedepend = "Mandriva=makedepend Ubuntu=xutils-dev"
 
@@ -2056,7 +2056,6 @@ DISTRO_PN_ALIAS_pn-ubootchart = "OSPDT upstream=http://code.google.com/p/ubootch
 
 RECIPE_STATUS_pn-tiff = "green"
 RECIPE_LATEST_VERSION_pn-tiff = "4.0.1"
-RECIPE_LATEST_RELEASE_DATE_pn-eggdbus = "Feb 18, 2012"
 RECIPE_LAST_UPDATE_pn-tiff = "Feb 27, 2012"
 RECIPE_MANUAL_CHECK_DATE_pn-tiff = "Feb 27, 2012"
 RECIPE_MAINTAINER_pn-tiff = "Saul Wold <sgw@linux.intel.com>"
@@ -3171,9 +3170,9 @@ RECIPE_MANUAL_CHECK_DATE_pn-fstests = "Jul 06, 2011"
 RECIPE_MAINTAINER_pn-fstests = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-gdb="green"
-RECIPE_LATEST_VERSION_pn-gdb="7.4"
-RECIPE_LAST_UPDATE_pn-gdb = "Feb 1, 2012"
-RECIPE_MANUAL_CHECK_DATE_pn-gdb = "Feb 01, 2012"
+RECIPE_LATEST_VERSION_pn-gdb="7.4.1"
+RECIPE_LAST_UPDATE_pn-gdb = "May 1, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-gdb = "May 01, 2012"
 RECIPE_MAINTAINER_pn-gdb = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-intltool="green"
@@ -3291,13 +3290,14 @@ DISTRO_PN_ALIAS_pn-python-scons = "Fedora=scons OpenSuSE=scons Ubuntu=scons Mand
 RECIPE_MAINTAINER_pn-python-scons = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-python="red"
-RECIPE_LATEST_VERSION_pn-python="2.7.1"
-RECIPE_LAST_UPDATE_pn-python = "Nov 8, 2010"
+RECIPE_LATEST_VERSION_pn-python="2.7.3"
+RECIPE_LAST_UPDATE_pn-python = "May 01, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-python = "May 01, 2012"
 RECIPE_MAINTAINER_pn-python = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-quilt="green"
-RECIPE_LATEST_VERSION_pn-quilt="0.51"
-RECIPE_LAST_UPDATE_pn-quilt = "Feb 01, 2012"
+RECIPE_LATEST_VERSION_pn-quilt="0.60"
+RECIPE_LAST_UPDATE_pn-quilt = "Apr 30, 2012"
 RECIPE_MAINTAINER_pn-quilt = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-tcl="green"
-- 
1.7.7.6



