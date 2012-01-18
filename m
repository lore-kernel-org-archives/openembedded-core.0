Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Rnf6z-0003aF-LP
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 00:40:13 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jan 2012 15:32:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97329172"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2012 15:32:30 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jan 2012 15:32:27 -0800
Message-Id: <2f1c9cc79c70abca7777a4a3e1bcf4ea63cb3ae8.1326929307.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <f37166f3f48c2747fbcc4d9ca8e9c2ddbe9aa637.1326929307.git.nitin.a.kamble@intel.com>
References: <f37166f3f48c2747fbcc4d9ca8e9c2ddbe9aa637.1326929307.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1326929307.git.nitin.a.kamble@intel.com>
References: <cover.1326929307.git.nitin.a.kamble@intel.com>
Subject: [PATCHv3 7/7] distro-tracking: add data for newer recipes
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
X-List-Received-Date: Wed, 18 Jan 2012 23:40:14 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index a4aacfb..cbdc86c 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -37,6 +37,27 @@ RECIPE_MANUAL_CHECK_DATE_pn-libpcre = "Jan 10, 2012"
 RECIPE_MAINTAINER_pn-libpcre = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 DISTRO_PN_ALIAS_pn-libpcre = "Mandriva=libpcre0 Fedora=pcre"
 
+RECIPE_LATEST_VERSION_pn-bdwgc = "20110107"
+RECIPE_LAST_UPDATE_pn-bdwgc = "Jan 17, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-bdwgc = "Jan 17, 2012"
+RECIPE_MAINTAINER_pn-bdwgc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+
+RECIPE_LATEST_VERSION_pn-libunistring = "0.9.3"
+RECIPE_LAST_UPDATE_pn-libunistring = "Jan 17, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libunistring = "Jan 17, 2012"
+RECIPE_MAINTAINER_pn-libunistring = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+
+RECIPE_LATEST_VERSION_pn-guile = "2.0.3"
+RECIPE_LAST_UPDATE_pn-guile = "Jan 17, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-guile = "Jan 17, 2012"
+RECIPE_MAINTAINER_pn-guile = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+
+RECIPE_LATEST_VERSION_pn-autogen = "5.12"
+RECIPE_NO_UPDATE_REASON_pn-autogen = "newer versions are dumping core while building, and no distro has picked up the newer versions yet"
+RECIPE_LAST_UPDATE_pn-autogen = "Jan 17, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-autogen = "Jan 17, 2012"
+RECIPE_MAINTAINER_pn-autogen = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+
 RECIPE_STATUS_pn-libsoup = "red"
 RECIPE_LATEST_VERSION_pn-libsoup = "check"
 RECIPE_LAST_UPDATE_pn-libsoup = "Sep 22, 2008"
-- 
1.7.6.4



