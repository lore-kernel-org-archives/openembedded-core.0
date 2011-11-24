Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RTUqL-0006fn-O6
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 09:39:42 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAO8X8iJ025265
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 00:33:08 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 24 Nov 2011 00:33:08 -0800
Message-ID: <3d097c4971548fc21af4b28c3ab02887668949f3.1322123087.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1322123087.git.xiaofeng.yan@windriver.com>
References: <cover.1322123087.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 24 Nov 2011 15:47:13 +0800
Date: Thu, 24 Nov 2011 16:31:04 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] distro_tracking_fields: update the status
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
X-List-Received-Date: Thu, 24 Nov 2011 08:39:42 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

directfb to 1.4.15
xorg-xserver-lite to 1.11.1
libx11-diet to 1.4.4

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   15 ++++++++++++---
 1 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 17d9f2f..d334ef7 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -4656,9 +4656,15 @@ RECIPE_MAINTAINER_pn-libx11 = "Dexuan Cui <dexuan.cui@intel.com>"
 
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
@@ -4670,8 +4676,11 @@ RECIPE_MAINTAINER_pn-libarchive  = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
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
1.7.0.4



