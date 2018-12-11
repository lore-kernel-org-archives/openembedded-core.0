Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 638D56C0DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 08:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id BB18B1846D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 09:57:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id BYESwlEfcZ_J
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 09:57:07 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 22EF918466
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 09:57:07 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EB251E080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 09:57:07 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 037111E07F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 09:57:07 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 09:57:06 +0100 (CET)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by seth.se.axis.com (Postfix) with ESMTP id EBDCEE32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 09:57:06 +0100 (CET)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id DAA2B7C079; Tue, 11 Dec 2018 09:57:06 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 09:57:06 +0100
Message-Id: <20181211085706.25762-1-olani@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Subject: [PATCH] selftest/package: Correct format arguments in test_gdb_hardlink_debug
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
X-List-Received-Date: Tue, 11 Dec 2018 08:57:07 -0000

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/lib/oeqa/selftest/cases/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 0a88dc25b3..b0abc2f4ee 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -137,7 +137,7 @@ class PackageTests(OESelftestTestCase):
                 elif "Breakpoint 1, main () at hello.c:4" in l:
                     return True
 
-            self.logger.error("GDB result:\n%s: %s" % output)
+            self.logger.error("GDB result:\n%s: %s", status, output)
             return False
 
         with runqemu('core-image-minimal') as qemu:
-- 
2.11.0


