Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QOfsQ-00085l-Tf
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 02:53:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2011 17:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,259,1304319600"; 
   d="scan'208";a="6498078"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2011 17:50:34 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2011 17:50:27 -0700
Message-Id: <4de4528a41bcf14a427a98ba1ad35bfae2b3055a.1306198151.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.5
In-Reply-To: <c58247a71045c56297c2312e91eff6f17f3c2d7d.1306198151.git.nitin.a.kamble@intel.com>
References: <c58247a71045c56297c2312e91eff6f17f3c2d7d.1306198151.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1306198151.git.nitin.a.kamble@intel.com>
References: <cover.1306198151.git.nitin.a.kamble@intel.com>
Subject: [UPGRADES 5/5] distro-tracking: update toolchain recipe fields
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
X-List-Received-Date: Tue, 24 May 2011 00:53:39 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index ad45b94..bcf7a1a 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2908,11 +2908,13 @@ RECIPE_MAINTAINER_pn-linux-libc-headers = "Nitin A Kamble <nitin.a.kamble@intel.
 RECIPE_STATUS_pn-lsof="green" 
 RECIPE_LATEST_VERSION_pn-lsof="4.84"
 RECIPE_LAST_UPDATE_pn-lsof = "Nov 8, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-lsof = "May 23, 2011" 
 RECIPE_MAINTAINER_pn-lsof = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-make="green" 
 RECIPE_LATEST_VERSION_pn-make="3.82"
 RECIPE_LAST_UPDATE_pn-make = "Nov 8, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-make = "May 23, 2011" 
 RECIPE_MAINTAINER_pn-make = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-run-postinsts="green" # all local code
@@ -3003,6 +3005,7 @@ RECIPE_STATUS_pn-gnu-config="green"
 RECIPE_LATEST_VERSION_pn-gnu-config="0.0+git3155524"
 DISTRO_PN_ALIAS_pn-gnu-config = "OpenedHand"
 RECIPE_LAST_UPDATE_pn-gnu-config = "Jun 21, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-gnu-config = "May 23, 2011" 
 RECIPE_MAINTAINER_pn-gnu-config = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-mpfr="green"
-- 
1.7.3.5



