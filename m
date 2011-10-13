Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1REJ8N-0003Ro-FK
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:07:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9DB1lsH018410
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:01:47 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 13 Oct 2011 04:01:47 -0700
Message-ID: <5b2a12b800170740a2f91a17f7f2e4fced3f1b5e.1318503768.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1318503768.git.xiaofeng.yan@windriver.com>
References: <cover.1318503768.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 13 Oct 2011 19:00:07 +0800
Date: Thu, 13 Oct 2011 19:07:15 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] distro_tracking_fields.inc: Add maintainer for some packages without maintainer
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
X-List-Received-Date: Thu, 13 Oct 2011 11:07:31 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add the name of maintainer for the following packages:
bind
libx11-diet
qmmp
libarchive
xserver-kdrive
xserver-xorg-lite
directfb

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   38 ++++++++++++++++++--
 1 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index b07209e..1023091 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -4599,6 +4599,23 @@ RECIPE_MAINTAINER_pn-libx11 = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libx11-diet = "green"
 DISTRO_PN_ALIAS_pn-libx11-diet = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
+RECIPE_LATEST_VERSION_pn-libx11-diet = "1.4.4"
+RECIPE_LATEST_RELEASE_DATE_pn-libx11-diet = "Dec,2010"
+RECIPE_LAST_UPDATE_pn-libx11-diet = "Oct 13, 2011"
+RECIPE_MAINTAINER_pn-libx11-diet = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+
+RECIPE_STATUS_pn-directfb = "red"
+RECIPE_MAINTAINER_pn-directfb = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+
+RECIPE_STATUS_pn-libarchive = "red"
+RECIPE_MAINTAINER_pn-libarchive = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+
+RECIPE_STATUS_pn-xserver-kdrive = "red"
+RECIPE_MAINTAINER_pn-xserver-kdrive = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+
+RECIPE_STATUS_pn-xserver-xorg-lite = "red"
+RECIPE_MAINTAINER_pn-xserver-xorg-lite = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+
 
 RECIPE_STATUS_pn-libx11-trim = "green"
 DISTRO_PN_ALIAS_pn-libx11-trim = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
@@ -5703,10 +5720,27 @@ RECIPE_LAST_UPDATE_pn-libgdata = "Dec 29, 2010"
 RECIPE_MAINTAINER_pn-libgdata = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_LATEST_VERSION_pn-man-pages = "3.32"
-RECIPE_LATEST_VERSION_pn-qmmp = "0.4.3"
 RECIPE_LATEST_VERSION_pn-sysprof = "6b5b8432711ef5c747f8375073cd9af88922d3c6"
 RECIPE_LATEST_VERSION_pn-table = "d42a44938699ee30a998fc42bc149aebf69389db"
 
+RECIPE_STATUS_pn-qmmp = "green"
+RECIPE_LATEST_VERSION_pn-qmmp = "0.5.2"
+RECIPE_LATEST_RELEASE_DATE_pn-qmmp = "Sep 02, 2011"
+RECIPE_LAST_UPDATE_pn-qmmp = "Oct 13, 2011"
+RECIPE_MAINTAINER_pn-qmmp = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+
+RECIPE_STATUS_pn-bind = "green"
+RECIPE_LATEST_VERSION_pn-bind = "9.8.1"
+RECIPE_LATEST_RELEASE_DATE_pn-bind = "Aug 31, 2011"
+RECIPE_LAST_UPDATE_pn-bind = "Oct 13, 2011"
+RECIPE_MAINTAINER_pn-bind = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+
+RECIPE_STATUS_pn-xserver-xorg-lite = "green"
+RECIPE_LATEST_VERSION_pn-xserver-xorg-lite = "1.4.4"
+RECIPE_LATEST_RELEASE_DATE_pn-xserver-xorg-lite = "Aug 31, 2011"
+RECIPE_LAST_UPDATE_pn-xserver-xorg-lite = "Oct 13, 2011"
+RECIPE_MAINTAINER_pn-xserver-xorg-lite = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+
 RECIPE_LATEST_VERSION_pn-texinfo = "4.13a"
 RECIPE_LATEST_RELEASE_DATE_pn-texinfo = "Sep 22, 2008"
 RECIPE_LAST_UPDATE_pn-texinfo = "Sep 16, 2011"
@@ -5715,8 +5749,6 @@ RECIPE_NO_UPDATE_REASON_pn-texinfo = "Checking script parses directory wrong"
 
 RECIPE_LATEST_VERSION_pn-blktrace = "a788dfde86dfaff8f1c277a233f92c1822e06b76"
 RECIPE_LATEST_VERSION_pn-dtc = "37c0b6a0916c31a5eae0a9ddfcc5d0b8fb4569c6"
-RECIPE_LATEST_VERSION_pn-bind = "9.7.2-P3"
-RECIPE_NO_UPDATE_REASON_pn-bind = "Latest Stable version, newer versions are Alpha/Beta"
 RECIPE_LATEST_VERSION_pn-man = "1.6f"
 RECIPE_LATEST_VERSION_pn-mc = "4.7.5-pre1"
 RECIPE_MAINTAINER_pn-mc = "Saul Wold <sgw@linux.intel.com>"
-- 
1.7.0.4



