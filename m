Return-Path: <pab@pabigot.com>
X-Greylist: delayed 438 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Nov 2018 18:13:51 UTC
Received: from p3plsmtpa09-03.prod.phx3.secureserver.net
	(p3plsmtpa09-03.prod.phx3.secureserver.net [173.201.193.232])
	by mail.openembedded.org (Postfix) with ESMTP id C99546C1C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 18:13:51 +0000 (UTC)
Received: from lilith.pab ([24.118.100.205]) by :SMTPAUTH: with ESMTPSA
	id Md57g7YBcZhyGMd58ggH9i; Tue, 13 Nov 2018 11:06:34 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 12:06:20 -0600
Message-Id: <20181113180620.29178-1-pab@pabigot.com>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4wfMnd5xssj2NTHELE+tRyvz+8VRRANVkTLYvBbRqQbvILLkePF1bwuaH17aU2L6MhxSQ12eM18zI3ah5qyijjPmDIYk3uJpG+HFRm8OGaX4B5fy/AVFtI
	JFpgQfgNKj4AV98GL7JVJC3PLs534Po49Xqzeuhz5u49vGKTYulMqJn6iBszHvT50h0u5z31J7PCN2xIU2QMijzxcTCOqgmzLr4=
Cc: "Peter A. Bigot" <pab@pabigot.com>
Subject: [PATCH] bluez5: add mesh dependency on ell
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
X-List-Received-Date: Tue, 13 Nov 2018 18:13:52 -0000

Introduced at or before 5.50.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 9d9739e952..7708e7c88b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -41,7 +41,7 @@ PACKAGECONFIG[sixaxis] = "--enable-sixaxis,--disable-sixaxis"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
 PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
 PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
-PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c"
+PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
 PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
 
 SRC_URI = "\
-- 
2.17.1


