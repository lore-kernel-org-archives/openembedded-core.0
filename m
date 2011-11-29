Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8H-0005pT-IY
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:26:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419465"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:26:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:44 -0800
Message-Id: <21a4c838c24bad9d53a46cf835dfedba6a44d07f.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/23] distro_tracking_fields: update the status
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:41 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

directfb to 1.4.15
xorg-xserver-lite to 1.11.1
libx11-diet to 1.4.4

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   15 ++++++++++++---
 1 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 84a986e..b95578c 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -4657,9 +4657,15 @@ RECIPE_MAINTAINER_pn-libx11 = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libx11-diet = "green"
 DISTRO_PN_ALIAS_pn-libx11-diet = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
+RECIPE_LATEST_VERSION_pn-libx11-diet = "1.4.4"
+RECIPE_LATEST_RELEASE_DATE_pn-libx11-diet = "Jul 28,2011"
+RECIPE_LAST_UPDATE_pn-libx11-diet = " Nov 22, 2011"
 RECIPE_MAINTAINER_pn-libx11-diet = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
-RECIPE_STATUS_pn-directfb = "red"
+RECIPE_STATUS_pn-directfb = "green"
+RECIPE_LATEST_VERSION_pn-directfb = "1.5.3"
+RECIPE_LATEST_RELEASE_DATE_pn-direcfb = "Aug 9,2011"
+RECIPE_LAST_UPDATE_pn-directfb = "Nov 7, 2011"
 RECIPE_MAINTAINER_pn-directfb = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
 RECIPE_STATUS_pn-libarchive  = "green"
@@ -4671,8 +4677,11 @@ RECIPE_MAINTAINER_pn-libarchive  = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 RECIPE_STATUS_pn-xserver-kdrive  = "red"
 RECIPE_MAINTAINER_pn-xserver-kdrive  = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
-RECIPE_STATUS_pn-xserver-xf86-lite  = "red"
-RECIPE_MAINTAINER_pn-xserver-xf86-lite  = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+RECIPE_STATUS_pn-xserver-xorg-lite  = "green"
+RECIPE_LATEST_VERSION_pn-xserver-xorg-lite = "1.11.1"
+RECIPE_LATEST_RELEASE_DATE_pn-xserver-xorg-lite = "Sept 24, 2011"
+RECIPE_LAST_UPDATE_pn-xserver-xorg-lite = " Sep 30,2011"
+RECIPE_MAINTAINER_pn-xserver-xorg-lite  = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
 RECIPE_STATUS_pn-libx11-trim = "green"
 DISTRO_PN_ALIAS_pn-libx11-trim = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
-- 
1.7.6.4



