Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RVBn7-0002iA-6z
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 01:43:21 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Nov 2011 16:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,587,1315206000"; d="scan'208";a="41918017"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Nov 2011 16:36:38 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2011 16:36:35 -0800
Message-Id: <23903eba8f1572431f828bbf695befbc4f8145b1.1322526931.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <6b7fb8503d66ee4d4c3d43f3c368b8aa2d010add.1322526931.git.nitin.a.kamble@intel.com>
References: <6b7fb8503d66ee4d4c3d43f3c368b8aa2d010add.1322526931.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322526931.git.nitin.a.kamble@intel.com>
References: <cover.1322526931.git.nitin.a.kamble@intel.com>
Subject: [PATCH 4/4] distro-tracking: update information for binutils & libtool
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
X-List-Received-Date: Tue, 29 Nov 2011 00:43:21 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index d84b1b3..7ff9a42 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2943,9 +2943,9 @@ RECIPE_LAST_UPDATE_pn-sysprof = "Dec 8, 2010"
 RECIPE_MAINTAINER_pn-sysprof = "Tom Zanussi <tom.zanussi@intel.com>"
 
 RECIPE_STATUS_pn-binutils="green"
-RECIPE_LATEST_VERSION_pn-binutils="2.21.1a"
-RECIPE_LAST_UPDATE_pn-binutils = "Aug 29, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-binutils = "Aug 29, 2011"
+RECIPE_LATEST_VERSION_pn-binutils="2.22"
+RECIPE_LAST_UPDATE_pn-binutils = "Nov 23, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-binutils = "Nov 23, 2011"
 RECIPE_MAINTAINER_pn-binutils = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-ldconfig-native = "red"
@@ -3014,8 +3014,8 @@ RECIPE_MAINTAINER_pn-intltool = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-libtool="green" 
 RECIPE_LATEST_VERSION_pn-libtool="2.4.2"
-RECIPE_LAST_UPDATE_pn-libtool = "Nov 16, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libtool = "Nov 16, 2011" 
+RECIPE_LAST_UPDATE_pn-libtool = "Nov 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libtool = "Nov 28, 2011" 
 RECIPE_MAINTAINER_pn-libtool = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-linux-libc-headers="green" 
-- 
1.7.6.4



