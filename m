Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJS-0001in-Qj
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 May 2011 16:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="687688498"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by fmsmga002.fm.intel.com with ESMTP; 03 May 2011 16:44:53 -0700
Message-Id: <f7c9122171848d4339ad4f71fc0a464a105d1b9d.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Thu, 28 Apr 2011 16:37:20 -0700
Date: Tue, 03 May 2011 16:44:53 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 25/33] libx11: Use inherit gettext
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
X-List-Received-Date: Tue, 03 May 2011 23:47:31 -0000

From: Khem Raj <raj.khem@gmail.com>

Avoid direct depependency on gettext, inherit class instead

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb |    3 ++-
 meta/recipes-graphics/xorg-lib/libx11_git.bb   |    6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
index c572d5e..08ba07b 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
@@ -1,4 +1,5 @@
 require libx11.inc
+inherit gettext
 
 LICENSE = "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bf75bfe4d05068311b5e6862d4b5f2c5"
@@ -14,7 +15,7 @@ SRC_URI[md5sum] = "f65c9c7ecbfb64c19dbd7927160d63fd"
 SRC_URI[sha256sum] = "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8324147c889a844"
 
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
-            libxdmcp xf86bigfontproto kbproto inputproto xproto-native gettext"
+            libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
 
 EXTRA_OECONF += "--without-xcb"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11_git.bb b/meta/recipes-graphics/xorg-lib/libx11_git.bb
index a976a16..aa69f4a 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_git.bb
@@ -1,11 +1,13 @@
 require libx11.inc
 require libx11_git.inc
 
+inherit gettext
+
 PR = "r2"
 
 DEPENDS = "xproto xextproto xcmiscproto xf86bigfontproto kbproto inputproto \
-           bigreqsproto xtrans libxau libxcb libxdmcp util-macros gettext"
+           bigreqsproto xtrans libxau libxcb libxdmcp util-macros"
 
 DEFAULT_PREFERENCE = "-1"
 
-BBCLASSEXTEND = "nativesdk"
\ No newline at end of file
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.4.1



