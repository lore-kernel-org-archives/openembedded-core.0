Return-Path: <florian.boor@kernelconcepts.de>
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [212.60.202.196])
	by mail.openembedded.org (Postfix) with ESMTP id C20E165DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 18:47:01 +0000 (UTC)
Received: from [192.168.2.78] (helo=serenity.kc.loc)
	by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1YSrq7-0004dX-Au; Tue, 03 Mar 2015 19:46:43 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2015 19:46:16 +0100
Message-Id: <1425408376-16981-1-git-send-email-florian.boor@kernelconcepts.de>
X-Mailer: git-send-email 1.7.10.4
Cc: Florian Boor <florian@kernelconcepts.de>
Subject: [PATCH] directfb: Allow native builds of directfb 1.7.6
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
X-List-Received-Date: Tue, 03 Mar 2015 18:47:05 -0000

From: Florian Boor <florian@kernelconcepts.de>

Required by some DirectFB applications like dfbsee.

Signed-off-by: Florian Boor <florian@kernelconcepts.de>
---
 meta/recipes-graphics/directfb/directfb_1.7.6.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/directfb/directfb_1.7.6.bb b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
index d25d987..2594b59 100644
--- a/meta/recipes-graphics/directfb/directfb_1.7.6.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.7.6.bb
@@ -19,3 +19,5 @@ LEAD_SONAME = "libdirectfb-1.7.so.0"
 
 SRC_URI[md5sum] = "8a7bb06b3f58599b230b4cf314004512"
 SRC_URI[sha256sum] = "44f32bacfb842ea234599532f8481fe41b5bd2310d2bd101508eb3a5df26c9e1"
+
+BBCLASSEXTEND = "native"
-- 
1.7.10.4


