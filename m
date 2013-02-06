Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1U30sm-00075u-6h
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 10:01:38 +0100
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MHS005LIG7XR2K0@vms173009.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 01:45:33 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4CF2720077; Wed,
	06 Feb 2013 02:45:33 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 06 Feb 2013 02:45:25 -0500
Message-id: <1360136725-18194-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.2
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] nativesdk-qt4-tools: fix DEPENDS, as nativesdk is now prefixed
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
X-List-Received-Date: Wed, 06 Feb 2013 09:01:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index 5ed0e90..cfc6fd8 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -1,10 +1,10 @@
 DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
-DEPENDS = "zlib-nativesdk dbus-nativesdk libx11-nativesdk qt4-native"
+DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
 
-INC_PR = "r12"
+INC_PR = "r13"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
 
-- 
1.8.1.2



