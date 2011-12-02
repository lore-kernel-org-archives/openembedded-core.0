Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1RWVEK-0004LC-S0
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 16:40:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 07:33:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,284,1320652800"; d="scan'208";a="81550862"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by azsmga001.ch.intel.com with ESMTP; 02 Dec 2011 07:33:02 -0800
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 23:54:09 +0800
Message-Id: <205688c90c0380e8112630cf09a6849638817f5b.1322840490.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <658bdcf24a1ade76126924fcb937c50abce6d08d.1322840490.git.jiajun.xu@intel.com>
References: <658bdcf24a1ade76126924fcb937c50abce6d08d.1322840490.git.jiajun.xu@intel.com>
In-Reply-To: <cover.1322840490.git.jiajun.xu@intel.com>
References: <cover.1322840490.git.jiajun.xu@intel.com>
Subject: [PATCH 2/3] distro_tracking_fields: add information for ltp
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
X-List-Received-Date: Fri, 02 Dec 2011 15:40:53 -0000

Add information for recipe ltp, which is ported from OE.

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 073521f..fa15f24 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -6092,6 +6092,14 @@ RECIPE_MANUAL_CHECK_DATE_pn-libiconv = "Nov 22, 2011"
 DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
 RECIPE_MAINTAINER_pn-libiconv = "Saul Wold <sgw@linux.intel.com>"
 
+RECIPE_STATUS_pn-ltp = "green"
+RECIPE_LATEST_VERSION_pn-ltp = "20110915"
+RECIPE_LATEST_RELEASE_DATE_pn-ltp = "Sep 15, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-ltp = "3 months"
+RECIPE_NO_OF_PATCHES_pn-ltp = "0"
+RECIPE_LAST_UPDATE_pn-ltp = "Dec 2, 2011"
+RECIPE_MAINTAINER_pn-ltp = "Jiajun Xu <jiajun.xu@intel.com>"
+
 DISTRO_PN_ALIAS_pn-qt4-native = "Fedora=qt4 Debian=qt4-dev-tools"
 DISTRO_PN_ALIAS_pn-update-alternatives-dpkg = "Opensuse=update-alternatives Mandriva=update-alternatives"
 RECIPE_MAINTAINER_pn-update-alternatives-dpkg = "Dongxiao Xu <dongxiao.xu@intel.com>"
-- 
1.7.1



