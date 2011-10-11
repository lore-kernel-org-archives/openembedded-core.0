Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RDY40-0007RD-3q
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 10:51:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9B8kAmh021756
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Oct 2011 01:46:10 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 11 Oct 2011 01:46:10 -0700
Message-ID: <dc43f11e95bda59f13088ee74f6c922532d9ecb2.1318318965.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1318318965.git.xiaofeng.yan@windriver.com>
References: <cover.1318318965.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 11 Oct 2011 15:33:00 +0800
Date: Tue, 11 Oct 2011 16:51:25 +0800
To: <openembedded-core@lists.openembedded.org>, <sgw@linux.intel.com>
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
X-List-Received-Date: Tue, 11 Oct 2011 08:51:52 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add the name of maintainer for the following packages:
	bind
        libx11-diet
        qmmp
        libarchive
        xserver-kdrive
        xserver-xf86-lite
        directfb

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 7b6c4a9..be7e854 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -4599,6 +4599,19 @@ RECIPE_MAINTAINER_pn-libx11 = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libx11-diet = "green"
 DISTRO_PN_ALIAS_pn-libx11-diet = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
+RECIPE_MAINTAINER_pn-libx11-diet = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+
+RECIPE_STATUS_pn-directfb = "red"
+RECIPE_MAINTAINER_pn-directfb = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+
+RECIPE_STATUS_pn-libarchive  = "red"
+RECIPE_MAINTAINER_pn-libarchive  = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+
+RECIPE_STATUS_pn-xserver-kdrive  = "red"
+RECIPE_MAINTAINER_pn-xserver-kdrive  = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+
+RECIPE_STATUS_pn-xserver-xf86-lite  = "red"
+RECIPE_MAINTAINER_pn-xserver-xf86-lite  = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
 RECIPE_STATUS_pn-libx11-trim = "green"
 DISTRO_PN_ALIAS_pn-libx11-trim = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
@@ -5704,6 +5717,7 @@ RECIPE_MAINTAINER_pn-libgdata = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_LATEST_VERSION_pn-man-pages = "3.32"
 RECIPE_LATEST_VERSION_pn-qmmp = "0.4.3"
+RECIPE_MAINTAINER_pn-qmmp = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 RECIPE_LATEST_VERSION_pn-sysprof = "6b5b8432711ef5c747f8375073cd9af88922d3c6"
 RECIPE_LATEST_VERSION_pn-table = "d42a44938699ee30a998fc42bc149aebf69389db"
 
@@ -5716,6 +5730,7 @@ RECIPE_NO_UPDATE_REASON_pn-texinfo = "Checking script parses directory wrong"
 RECIPE_LATEST_VERSION_pn-blktrace = "a788dfde86dfaff8f1c277a233f92c1822e06b76"
 RECIPE_LATEST_VERSION_pn-dtc = "37c0b6a0916c31a5eae0a9ddfcc5d0b8fb4569c6"
 RECIPE_LATEST_VERSION_pn-bind = "9.7.2-P3"
+RECIPE_MAINTAINER_pn-bind = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 RECIPE_NO_UPDATE_REASON_pn-bind = "Latest Stable version, newer versions are Alpha/Beta"
 RECIPE_LATEST_VERSION_pn-man = "1.6f"
 RECIPE_LATEST_VERSION_pn-mc = "4.7.5-pre1"
-- 
1.7.0.4



