Return-Path: <eric.nelson@boundarydevices.com>
Received: from mail.integraonline.com (relay4.integra.net [204.130.255.183])
	by mail.openembedded.org (Postfix) with SMTP id 4136561013
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Aug 2013 21:37:05 +0000 (UTC)
Received: (qmail 26814 invoked from network); 11 Aug 2013 21:37:05 -0000
Received: from unknown (HELO ericsam.example.org) (70.96.116.236)
	by relay4.integra.net with SMTP; 11 Aug 2013 21:37:05 -0000
From: Eric Nelson <eric.nelson@boundarydevices.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Aug 2013 14:36:58 -0700
Message-Id: <1376257018-17066-1-git-send-email-eric.nelson@boundarydevices.com>
X-Mailer: git-send-email 1.8.1.2
Cc: denys@ti.com
Subject: [PATCH] nativesdk-qt4-tools: remove nativesdk-libx11 for qt-embedded
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Aug 2013 21:37:06 -0000

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index cfc6fd8..6ec3225 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -1,5 +1,8 @@
 DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
-DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
+DEPENDS = "nativesdk-zlib nativesdk-dbus qt4-native"
+OVERRIDES="${QTNAME}"
+DEPENDS_append_qt = " nativesdk-libx11"
+
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
-- 
1.8.1.2


