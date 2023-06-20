Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C80EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 23:16:09 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.4255.1687302964484204308
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 16:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net (76.164.132.203.bevcomm.net [76.164.132.203] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 35KNG2KU022811;
	Tue, 20 Jun 2023 18:16:03 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale] oeqa/qemurunner: update exception class for QMP API changes
Date: Tue, 20 Jun 2023 18:16:02 -0500
Message-Id: <20230620231602.654799-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 23:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183162

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c1841ab1e7b4e078cea77001e83e733764bb65ea)
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index a455b3b389..ca75ce7e70 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -356,7 +356,7 @@ class QemuRunner:
             except OSError as msg:
                 self.logger.warning("Failed to connect qemu monitor socket: %s File: %s" % (msg, msg.filename))
                 return False
-            except qmp.QMPConnectError as msg:
+            except qmp.legacy.QMPError as msg:
                 self.logger.warning("Failed to communicate with qemu monitor: %s" % (msg))
                 return False
         finally:
-- 
2.25.1


