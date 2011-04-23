Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWNz-0005Br-Qd
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:32:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2011 23:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="632967531"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2011 23:28:55 -0700
Message-Id: <115099178ed68105bd5719348b4ea0baef4ade80.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 13:24:22 +0800
Date: Fri, 22 Apr 2011 23:28:55 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 08:41:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 04/37] consolekit: Upgrade to 0.4.4 (from 0.4.3)
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
X-List-Received-Date: Sat, 23 Apr 2011 06:32:08 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../{consolekit_0.4.3.bb => consolekit_0.4.4.bb}   |   10 ++++++----
 .../consolekit/files/nopolkit.patch                |    2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)
 rename meta/recipes-support/consolekit/{consolekit_0.4.3.bb => consolekit_0.4.4.bb} (75%)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.3.bb b/meta/recipes-support/consolekit/consolekit_0.4.4.bb
similarity index 75%
rename from meta/recipes-support/consolekit/consolekit_0.4.3.bb
rename to meta/recipes-support/consolekit/consolekit_0.4.4.bb
index 5bf4c52..0aec639 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.3.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.4.bb
@@ -8,13 +8,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 DEPENDS = "dbus"
 
+PR = "r0"
+
 inherit gnome
 
-SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-0.4.3.tar.bz2 \
-           file://nopolkit.patch;patch=1"
+SRC_URI = "http://www.freedesktop.org/software/ConsoleKit/dist/ConsoleKit-${PV}.tar.bz2 \
+           file://nopolkit.patch"
 
-SRC_URI[md5sum] = "4c39c6eacc75334b890f21eead1d2945"
-SRC_URI[sha256sum] = "fe02aca2b4c21df59aa5fbe6f28ea3ea4b3c9dd64c48c50634e9a53cf9c0dcc5"
+SRC_URI[md5sum] = "b57eb18eae8c4d3631d5f4f030218a29"
+SRC_URI[sha256sum] = "f0c00969fb6fe7d628071f0f43ac0d411982a5e798d7dc31747caa772c9716ae"
 S = "${WORKDIR}/ConsoleKit-${PV}"
 
 FILES_${PN} += "${libdir}/ConsoleKit ${datadir}/dbus-1 ${datadir}/PolicyKit"
diff --git a/meta/recipes-support/consolekit/files/nopolkit.patch b/meta/recipes-support/consolekit/files/nopolkit.patch
index 7a1f02a..a0d9d06 100644
--- a/meta/recipes-support/consolekit/files/nopolkit.patch
+++ b/meta/recipes-support/consolekit/files/nopolkit.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: ConsoleKit-0.4.3/configure.ac
 ===================================================================
 --- ConsoleKit-0.4.3.orig/configure.ac	2010-10-26 22:34:03.000000000 +0800
-- 
1.7.1.1



