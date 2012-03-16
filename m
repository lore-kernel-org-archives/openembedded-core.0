Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LEJ-0000rW-4V
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:41:15 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:32:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="118171396"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2012 17:32:29 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:07 +0800
Message-Id: <c9e23a4394767de8f9e13dc8c194f00abc7ac588.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 10/60] telepathy-glib: upgrade to 0.17.5
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
X-List-Received-Date: Fri, 16 Mar 2012 00:41:15 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 ...thy-glib_0.17.4.bb => telepathy-glib_0.17.5.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.17.4.bb => telepathy-glib_0.17.5.bb} (78%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.5.bb
similarity index 78%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.17.5.bb
index 64473df..e31c340 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.4.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.5.bb
@@ -3,12 +3,12 @@ DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection man
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
 DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib"
 LICENSE = "LGPLv2.1+"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "2e1d583af92e7e88bd5478eab1755696"
-SRC_URI[sha256sum] = "bd9395178d2e11e6caaf14100bbfcb8bf3ceeb574538c670dbef68750dd24b3c"
+SRC_URI[md5sum] = "d436c47689f2709540d849cf5af5ed03"
+SRC_URI[sha256sum] = "011ad936f1d592dbc685073244750303fe2201246b16f9a7fa495cf9f8a3fe8d"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.7.6



