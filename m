Return-Path: <Fahad_Arslan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 08A276C732
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 17:48:27 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VrAN8-0006b7-EP from Fahad_Arslan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Dec 2013 09:48:26 -0800
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 12 Dec 2013 09:48:25 -0800
From: Fahad Arslan <fahad_arslan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2013 22:47:44 +0500
Message-Id: <1386870464-41010-1-git-send-email-fahad_arslan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 12 Dec 2013 17:48:26.0193 (UTC)
	FILETIME=[5BF48410:01CEF762]
Subject: [PATCH] libffi: Copy headers to more common include path.
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
X-List-Received-Date: Thu, 12 Dec 2013 17:48:27 -0000

Signed-off-by: Fahad Arslan <fahad_arslan@mentor.com>
---
 meta/recipes-gnome/libffi/libffi_3.0.13.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-gnome/libffi/libffi_3.0.13.bb b/meta/recipes-gnome/libffi/libffi_3.0.13.bb
index db0841e..07dd7d1 100644
--- a/meta/recipes-gnome/libffi/libffi_3.0.13.bb
+++ b/meta/recipes-gnome/libffi/libffi_3.0.13.bb
@@ -22,3 +22,8 @@ inherit autotools
 FILES_${PN}-dev += "${libdir}/libffi-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_append() {
+    install -d ${D}${includedir}
+    cp -r ${D}${libdir}/libffi-${PV}/include/* ${D}${includedir}/ || true
+}
-- 
1.7.9.5


