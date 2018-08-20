Return-Path: <sukdo399@daum.net>
X-Greylist: delayed 314 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Aug 2018 23:26:33 UTC
Received: from mail-smail-vm78.hanmail.net (mail-smail-vm78.daum.net
	[211.231.106.153])
	by mail.openembedded.org (Postfix) with ESMTP id 39DD879022
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 23:26:32 +0000 (UTC)
Received: from mail-hmail-smtp2.pg1.krane.9rum.cc ([10.194.31.52])
	by mail-smail-vm78.hanmail.net (8.13.8/8.9.1) with SMTP id
	w7KNLI8w028934; Tue, 21 Aug 2018 08:21:18 +0900
X-Hermes-Message-Id: m7L8LG7jd1284353406
Received: from mail-qpsmtp-vm16 ([10.61.241.163]) by hermes of
	mail-hmail-smtp2.pg1.krane.9rum.cc (10.194.31.52) with ESMTP id
	m7L8LG7jd1284353406; Tue, 21 Aug 2018 08:21:16 +0900 (KST)
Received: from [182.212.44.138] (HELO localhost.localdomain) (182.212.44.138)
	by  (8.12.9/8.9.1) with ESMTPA; ??, 21  8?? 2018 08:21:16 +0900
Authentication-Results: mail-qpsmtp-vm16;
	auth=pass (plain) smtp.auth=sukdo399@daum.net
Errors-To: <sukdo399@daum.net>
X-Originating-IP: 182.212.44.138
From: Seokha Ko <sukdo399@daum.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2018 08:21:05 +0900
Message-Id: <20180820232105.20179-1-sukdo399@daum.net>
X-Mailer: git-send-email 2.17.1
X-HM-UT: qXZ0Qt+h/LZTwUkdi5FHG/FdugrUhY3upSfJ6//IJWw=
Subject: [PATCH] nativesdk-packagegroup-sdk-host: Add wayland-scanner to the SDK native toolchain
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
X-List-Received-Date: Mon, 20 Aug 2018 23:26:33 -0000

The wayland-scanner was missing from the native toolchain for SDK build
because it's copied from wayland dev package.

Signed-off-by: Seokha Ko <sukdo399@daum.net>
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index e2f6169994..4dc6eea23e 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -23,7 +23,7 @@ RDEPENDS_${PN} = "\
     nativesdk-makedevs \
     nativesdk-dnf \
     nativesdk-cmake \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland-dev', '', d)} \
     nativesdk-sdk-provides-dummy \
     "
 
-- 
2.17.1


