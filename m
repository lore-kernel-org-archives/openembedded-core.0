Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R42Uz-0001UX-00
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 05:20:25 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2011 20:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,384,1312182000"; d="scan'208";a="17264364"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.252])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Sep 2011 20:15:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 20:15:01 -0700
Message-Id: <0da3ff2672c5b481a0ccc30393dafdb042b310b9.1316056194.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
Subject: [RC2 PULL 12/13] distro_tracking: update package alias
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
X-List-Received-Date: Thu, 15 Sep 2011 03:20:25 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Update package alias which exist in other two distributions.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 9dfa6a9..b8dc982 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -319,6 +319,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-db = "n/a"
 RECIPE_COMMENTS_pn-db = ""
 RECIPE_LAST_UPDATE_pn-db = "Jul 21, 2006"
 RECIPE_MAINTAINER_pn-db = "Dongxiao Xu <dongxiao.xu@intel.com>"
+DISTRO_PN_ALIAS_pn-db = "Debian=db5.1 Ubuntu=db5.1"
 
 RECIPE_STATUS_pn-libtirpc = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libtirpc = "not done"
@@ -2184,11 +2185,13 @@ RECIPE_LATEST_RELEASE_DATE_pn-ofono="2011/03/15"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-ofono="15 days"
 RECIPE_LAST_UPDATE_pn-ofono = "Apr 15, 2011"
 RECIPE_MAINTAINER_pn-ofono = "Dongxiao Xu <dongxiao.xu@intel.com>"
+DISTRO_PN_ALIAS_pn-ofono = "Debian=ofono Ubuntu=ofono"
 
 RECIPE_STATUS_pn-libtelepathy = "red"
 RECIPE_LATEST_VERSION_pn-libtelepathy = "0.3.3"
 RECIPE_LAST_UPDATE_pn-libtelepathy = "Jul 21, 2008"
 RECIPE_MAINTAINER_pn-libtelepathy = "Dongxiao Xu <dongxiao.xu@intel.com>"
+DISTRO_PN_ALIAS_pn-libtelepathy = "Debian=libtelepathy2 Ubuntu=libtelepathy2"
 
 RECIPE_STATUS_pn-telepathy-farsight = "red"
 RECIPE_LATEST_VERSION_pn-telepathy-farsight = "0.0.14"
@@ -3010,6 +3013,7 @@ RECIPE_STATUS_pn-python-pycurl="green"
 RECIPE_LATEST_VERSION_pn-python-pycurl="7.19.0"
 RECIPE_LAST_UPDATE_pn-python-pycurl = "Mar 25, 2010"
 RECIPE_MAINTAINER_pn-python-pycurl = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+DISTRO_PN_ALIAS_pn-python-pycurl = "Debian=python-pycurl Ubuntu=python-pycurl"
 
 RECIPE_STATUS_pn-python-pygobject="green"
 DISTRO_PN_ALIAS_pn-python-pygobject = "Meego=pygobject2 Fedora=pygobject2 Ubuntu=pygobject Debian=pygobject"
@@ -5809,3 +5813,13 @@ DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu =rt-tests"
 DISTRO_PN_ALIAS_pn-xserver-xf86-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-xserver-xf86-dri-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-xserver-kdrive = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
+DISTRO_PN_ALIAS_pn-dtc = "Fedora=dtc Ubuntu=dtc"
+DISTRO_PN_ALIAS_pn-dtc-native = "Fedora=dtc Ubuntu=dtc"
+DISTRO_PN_ALIAS_pn-gail = "Fedora=gail Ubuntu=libgail-3-0"
+DISTRO_PN_ALIAS_pn-linux-yocto = "Debian=linux-base Ubuntu=linux"
+DISTRO_PN_ALIAS_pn-linux-yocto-rt = "Debian=linux-base Ubuntu=linux"
+DISTRO_PN_ALIAS_pn-libsdl = "Fedora=SDL Opensuse=SDL"
+DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
+DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
+DISTRO_PN_ALIAS_pn-qt4-native = "Fedora=qt4 Debian=qt4-dev-tools"
+DISTRO_PN_ALIAS_pn-update-alternatives-dpkg = "Opensuse=update-alternatives Mandriva=update-alternatives"
-- 
1.7.6



