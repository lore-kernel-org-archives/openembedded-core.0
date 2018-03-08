Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id E23C6782E7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 14:52:51 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w28EqpQH024128
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Mar 2018 15:52:51 +0100
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.79.99])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w28EqpTY003051;
	Thu, 8 Mar 2018 15:52:51 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id E360413D843C;
	Thu,  8 Mar 2018 15:52:51 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 15:52:47 +0100
Message-Id: <20180308145247.1501-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] kbd: avoid conflict with busybox
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
X-List-Received-Date: Thu, 08 Mar 2018 14:52:52 -0000

showkey can also be provided by busybox

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-core/kbd/kbd_2.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/kbd/kbd_2.0.4.bb b/meta/recipes-core/kbd/kbd_2.0.4.bb
index 80808af135..4af3256fff 100644
--- a/meta/recipes-core/kbd/kbd_2.0.4.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.4.bb
@@ -58,7 +58,7 @@ RDEPENDS_${PN}-ptest = "make"
 
 inherit update-alternatives
 
-ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt"
+ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt showkey"
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
-- 
2.11.0


