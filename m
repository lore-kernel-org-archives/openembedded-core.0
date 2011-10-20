Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGnUv-0002qQ-DN
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 09:57:05 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 00:51:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64982224"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 00:51:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 00:50:54 -0700
Message-Id: <bc869223dd23443356d9ef6b8d54b8b76d8b4643.1319096633.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL - v2 18/26] distro_tracking_fields: update packages tracking fields
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
X-List-Received-Date: Thu, 20 Oct 2011 07:57:05 -0000

From: Kang Kai <kai.kang@windriver.com>

Update packages tracking fields including ghostscript, libsdl,
libxml-sax-perl and liburi-perl.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index e68bbe1..770f835 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5878,6 +5878,24 @@ RECIPE_MAINTAINER_pn-libnewt = "Kai Kang <kai.kang@windriver.com>"
 RECIPE_LAST_UPDATE_pn-libnewt = "Jul 27, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "Jul 27, 2011"
 
+RECIPE_STATUS_pn-libxml-sax-perl = "green"
+RECIPE_LATEST_VERSION_pn-libxml-sax-perl = "0.99"
+RECIPE_MAINTAINER_pn-libxml-sax-perl = "Kai Kang <kai.kang@windriver.com>"
+RECIPE_LAST_UPDATE_pn-libxml-sax-perl = "Oct 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libxml-sax-perl = "Oct 19, 2011"
+
+RECIPE_STATUS_pn-liburi-perl = "green"
+RECIPE_LATEST_VERSION_pn-liburi-perl = "1.59"
+RECIPE_MAINTAINER_pn-liburi-perl = "Kai Kang <kai.kang@windriver.com>"
+RECIPE_LAST_UPDATE_pn-liburi-perl = "Oct 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-liburi-perl = "Oct 19, 2011"
+
+RECIPE_STATUS_pn-ghostscript = "red"
+RECIPE_LATEST_VERSION_pn-ghostscript = "9.04"
+RECIPE_MAINTAINER_pn-ghostscript = "Kai Kang <kai.kang@windriver.com>"
+RECIPE_LAST_UPDATE_pn-ghostscript = "Oct 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn = "Oct 19, 2011"
+
 RECIPE_STATUS_pn-createrepo = "green"
 RECIPE_LATEST_VERSION_pn-createrepo = "0.9.9"
 RECIPE_MAINTAINER_pn-createrepo = "Saul Wold <sgw@linux.intel.com>"
@@ -5951,7 +5969,13 @@ RECIPE_MAINTAINER_pn-linux-yocto = "Darren Hart <dvhart@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-linux-yocto-rt = "Debian=linux-base Ubuntu=linux"
 RECIPE_MAINTAINER_pn-linux-yocto-rt = "Darren Hart <dvhart@linux.intel.com>"
 
+RECIPE_STATUS_pn-libsdl = "green"
+RECIPE_LATEST_VERSION_pn-libsdl = "1.2.14"
+RECIPE_LAST_UPDATE_pn-libsdl = "Oct 19, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libsdl = "Jul 28, 2011"
+RECIPE_MAINTAINER_pn-libsdl = "Kai Kang <kai.kang@windriver.com>"
 DISTRO_PN_ALIAS_pn-libsdl = "Fedora=SDL Opensuse=SDL"
+
 DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
 DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
 DISTRO_PN_ALIAS_pn-qt4-native = "Fedora=qt4 Debian=qt4-dev-tools"
-- 
1.7.6.2



