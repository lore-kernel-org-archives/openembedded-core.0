Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RJYBx-0002na-5Y
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 00:12:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Oct 2011 15:06:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,415,1315206000"; d="scan'208";a="83263239"
Received: from unknown (HELO swold-mobl.Mikenopa.local) ([10.255.15.81])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2011 15:06:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 00:06:34 +0200
Message-Id: <2787bcbfbcd241198d1889f33a0c0e299284a3fd.1319753141.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/18] distro_tracking_fields: update packages tracking fields
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
X-List-Received-Date: Thu, 27 Oct 2011 22:12:57 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

Update packages tracking fields including ccache, chkconfig.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 1f3540e..f053f87 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5976,6 +5976,18 @@ RECIPE_MANUAL_CHECK_DATE_pn-libsdl = "Jul 28, 2011"
 RECIPE_MAINTAINER_pn-libsdl = "Kai Kang <kai.kang@windriver.com>"
 DISTRO_PN_ALIAS_pn-libsdl = "Fedora=SDL Opensuse=SDL"
 
+RECIPE_STATUS_pn-ccache = "green"
+RECIPE_MAINTAINER_pn-ccache = "Wenzong Fan <wenzong.fan@windriver.com>"
+RECIPE_LATEST_VERSION_pn-ccache = "3.1.6"
+RECIPE_LAST_UPDATE_pn-ccache = "October 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-ccache = "October 25, 2011"
+
+RECIPE_STATUS_pn-chkconfig = "green"
+RECIPE_MAINTAINER_pn-chkconfig = "Wenzong Fan <wenzong.fan@windriver.com>"
+RECIPE_LATEST_VERSION_pn-chkconfig = "1.3.55"
+RECIPE_LAST_UPDATE_pn-chkconfig = "October 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-chkconfig = "October 25, 2011"
+
 DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
 DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
 DISTRO_PN_ALIAS_pn-qt4-native = "Fedora=qt4 Debian=qt4-dev-tools"
-- 
1.7.6.4



