Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1RdP5c-0006NH-AD
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 17:32:24 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Dec 2011 08:25:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98855030"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2011 08:25:14 -0800
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 00:46:53 +0800
Message-Id: <dcfa0fc805a2946b6db3bc7529c0124b9fc05a27.1324485726.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1324485726.git.jiajun.xu@intel.com>
References: <cover.1324485726.git.jiajun.xu@intel.com>
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
X-List-Received-Date: Wed, 21 Dec 2011 16:32:24 -0000

Add information for recipe ltp, which is ported from OE.

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index f2b7d4b..ba261be 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -6103,6 +6103,14 @@ RECIPE_MANUAL_CHECK_DATE_pn-libiconv = "Nov 22, 2011"
 DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
 RECIPE_MAINTAINER_pn-libiconv = "Saul Wold <sgw@linux.intel.com>"
 
+RECIPE_STATUS_pn-ltp = "green"
+RECIPE_LATEST_VERSION_pn-ltp = "20110915"
+RECIPE_LATEST_RELEASE_DATE_pn-ltp = "Sep 15, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-ltp = "3 months"
+RECIPE_NO_OF_PATCHES_pn-ltp = "0"
+RECIPE_LAST_UPDATE_pn-ltp = "Dec 22, 2011"
+RECIPE_MAINTAINER_pn-ltp = "Jiajun Xu <jiajun.xu@intel.com>"
+
 DISTRO_PN_ALIAS_pn-qt4-native = "Fedora=qt4 Debian=qt4-dev-tools"
 DISTRO_PN_ALIAS_pn-update-alternatives-dpkg = "Opensuse=update-alternatives Mandriva=update-alternatives"
 RECIPE_MAINTAINER_pn-update-alternatives-dpkg = "Dongxiao Xu <dongxiao.xu@intel.com>"
-- 
1.7.1



