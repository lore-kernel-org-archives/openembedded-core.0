Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 50DA66FDE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 13:48:57 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XHYvC-0005S0-RF from Yasir_Khan@mentor.com ;
	Wed, 13 Aug 2014 06:48:58 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 13 Aug 2014 06:48:58 -0700
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 18:48:32 +0500
Message-Id: <1407937712-55308-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 13 Aug 2014 13:48:58.0677 (UTC)
	FILETIME=[550A8E50:01CFB6FD]
Subject: [PATCH 2/2] consolekit: depend on glib-2.0-native
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
X-List-Received-Date: Wed, 13 Aug 2014 13:48:57 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

This is required for glib-gettextize.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 .../recipes-support/consolekit/consolekit_0.4.6.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 643850f..dfbd11c 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/main.c;endline=21;md5=0a994e09769780220163255d8f9071c3"
 
-DEPENDS = "glib-2.0 dbus dbus-glib virtual/libx11"
+DEPENDS = "glib-2.0 glib-2.0-native dbus dbus-glib virtual/libx11"
 RDEPENDS_${PN} += "base-files"
 
 inherit autotools pkgconfig
-- 
1.7.9.5


