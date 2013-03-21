Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UIpLn-0005ej-2t
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 00:56:51 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 21 Mar 2013 16:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,888,1355126400"; d="scan'208";a="310242310"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.200])
	by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2013 16:39:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2013 16:39:56 -0700
Message-Id: <1363909196-10482-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] dbus: remove uneeded RDEPENDS on ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2013 23:56:51 -0000

This solves a multiple provider issue along with a build failure with ptest enabled

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/dbus/dbus.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index affffbc..a1b56a5 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -9,8 +9,6 @@ X11DEPENDS = "virtual/libx11 libsm"
 DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 DEPENDS_class-native = "expat-native virtual/libintl-native"
 DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl"
-RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest', '', d)}"
-RDEPENDS_class-native = ""
 
 INC_PR = "r6"
 
-- 
1.8.0.2



