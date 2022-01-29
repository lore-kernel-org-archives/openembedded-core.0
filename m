Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC43C433FE
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 21:40:40 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.11745.1643492420427987484
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jan 2022 13:40:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=DsInIO+t;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643492420;
  x=1675028420;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DJua6tgsNwp5batm4eK6ZEUpvooKM7mUStS7C+MOStI=;
  b=DsInIO+tGO+b96lQAKlsIGuWnHx3sKUnQdQzhnedMxMC1q4mTlKrzMHY
   Qr+UdwEnL7VRZh5YPTwabdblxizzS06vGVAzyX75+LjoqvvS7xLZwy+vD
   VG0DSCQPP9HCh0Pq8pXHXF3OXTCB7kfQQ2cOwHswOFSZegFiwjcwr2kv7
   u1xX6QBdz5ipYPRPsWlwOHGOqPGXAKel8cAPpyLnNRGfjnPp57DiE6t60
   f7RyiPxDvNi4FPmdEG0Y7xtmWjaNjTUCnOmDXSj8T3HwlDqJp5oqI7wjO
   uQa9yGqpYbnJy06DjIFhAnsvjJEjeLHgkh9NrxcyjXt0hDxnQs9SW9KU1
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [honister][PATCH] insane.bbclass: Correct
 package_qa_check_empty_dirs()
Date: Sat, 29 Jan 2022 22:40:15 +0100
Message-ID: <20220129214015.30956-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 21:40:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161103

The oe.qa.add_message() method is not available in Honister, use
package_qa_add_message() instead.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index bfaf2577d0..2c8f5338e5 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -945,7 +945,7 @@ def package_qa_check_empty_dirs(pkg, d, messages):
             recommendation = (d.getVar('QA_EMPTY_DIRS_RECOMMENDATION:' + dir) or
                               "but it is expected to be empty")
             msg = "%s installs files in %s, %s" % (pkg, dir, recommendation)
-            oe.qa.add_message(messages, "empty-dirs", msg)
+            package_qa_add_message(messages, "empty-dirs", msg)
 
 def package_qa_check_encoding(keys, encode, d):
     def check_encoding(key, enc):

