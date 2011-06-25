Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QaK1q-00037A-NM
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Jun 2011 05:59:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jun 2011 20:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,422,1304319600"; d="scan'208";a="19582163"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 24 Jun 2011 20:55:51 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Jun 2011 11:54:20 +0800
Message-Id: <a842646a9bf209576be3789e1c56cdfad47ae411.1308973924.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308973924.git.edwin.zhai@intel.com>
References: <cover.1308973924.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1308973924.git.edwin.zhai@intel.com>
References: <cover.1308973924.git.edwin.zhai@intel.com>
Subject: [PATCH 2/2] webkit-gtk: recommends glib-networking to access https web page
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
X-List-Received-Date: Sat, 25 Jun 2011 03:59:30 -0000

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



