Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QbT1t-0005ta-BN
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 09:48:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jun 2011 00:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,436,1304319600"; d="scan'208";a="21367619"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2011 00:44:35 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2011 15:42:58 +0800
Message-Id: <7bf8a7025dddd0b251ff9c37a55f28b7e099fad7.1309246787.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1309246787.git.edwin.zhai@intel.com>
References: <cover.1309246787.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1309246787.git.edwin.zhai@intel.com>
References: <cover.1309246787.git.edwin.zhai@intel.com>
Subject: [PATCH 2/3] webkit-gtk: recommends glib-networking to access https web page
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
X-List-Received-Date: Tue, 28 Jun 2011 07:48:17 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

[YOCTO #1037] got fixed

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-sato/webkit/webkit-gtk_svn.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 6d134ad..c9ded4e 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -10,6 +10,9 @@ LIC_FILES_CHKSUM = "file://WebCore/rendering/RenderApplet.h;endline=22;md5=fb969
 DEPENDS = "enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3"
 DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ gstreamer flex-native gperf-native perl-native-runtime sqlite3"
 
+# To access ssl web pages
+RRECOMMENDS_${PN} += "glib-networking"
+
 SRCREV_FORMAT = "webcore-rwebkit"
 
 SRCREV = "72836"
-- 
1.7.1



