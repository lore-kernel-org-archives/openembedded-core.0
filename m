Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QRlaj-0007es-8z
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:36:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Jun 2011 06:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,303,1304319600"; 
   d="scan'208";a="7836775"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga001.jf.intel.com with ESMTP; 01 Jun 2011 06:19:19 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 21:18:41 +0800
Message-Id: <54704cbb6698218f6d696d2ca72c66b032e3d6fd.1306931849.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
Subject: [RFC v1 PATCH 10/16] webkit-gtk: should depend on perl-native-runtime rather than perl-native
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
X-List-Received-Date: Wed, 01 Jun 2011 13:36:10 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-sato/webkit/webkit-gtk_svn.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 3c5101b..ac0e683 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -7,14 +7,14 @@ LIC_FILES_CHKSUM = "file://WebCore/rendering/RenderApplet.h;endline=22;md5=fb969
                     file://WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                     file://JavaScriptCore/parser/Parser.h;endline=23;md5=2f3cff0ad0a9c486da5a376928973a90"
 
-DEPENDS = "enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base gnome-vfs flex-native gperf-native perl-native sqlite3"
-DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ gstreamer flex-native gperf-native perl-native sqlite3"
+DEPENDS = "enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base gnome-vfs flex-native gperf-native perl-native-runtime sqlite3"
+DEPENDS_darwin8 = "curl icu libxml2 cairo libxslt libidn gnutls gtk+ gstreamer flex-native gperf-native perl-native-runtime sqlite3"
 
 SRCREV_FORMAT = "webcore-rwebkit"
 
 SRCREV = "72836"
 PV = "1.3.7+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=JavaScriptCore;proto=http \
-- 
1.7.2



