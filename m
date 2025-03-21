Return-Path: <Mario.Schuknecht@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87986C35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 07:21:38 +0000 (UTC)
Received: from o7.shr1-de.smtp.net (o7.shr1-de.smtp.net [185.71.125.107])
 by mx.groups.io with SMTP id smtpd.web11.15660.1742541690323455503
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 00:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=mario.schuknecht@iris-sensing.com header.s=smtp header.b=Avjz4SsR;
 spf=fail (domain: iris-sensing.com, ip: 185.71.125.107, mailfrom: mario.schuknecht@iris-sensing.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; s=smtp; d=iris-sensing.com;
 h=X-CSA-Complaints:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:List-Help; i=mario.schuknecht@iris-sensing.com;
 bh=Fr8QNVgBsCK+YBKJsW2W4Fb3/AkiiQK4D0S+UHes06Q=;
 b=Avjz4SsR5Cf+pb60Pt8PEuVXUBXA2zFLjPBN4HBVE1RFJzTUDcHF6AqC1l53e+/0QPer5KNaLKB2
   ZH47oSEbEvJOppLUHzCWNm1nAy452sldZDTexnzJKdnXkUhACVMQ9G3pHk40u1IB7z1wW498ATA4
   YsjTtNd9YvZibub+rQ5idiUOc2zCQluRmOGQICn7McPED/RlrwBfACjf6BbLnkc7fNW07DKG78E+
   luNt76vSqQYwwzDuL+OBg4feazC7EBTqcmWFFwsT7DsyWT8WWbHcB0zSKe1fxD1+TShRSkZFV0AT
   bHKVprb2tW50Dfg39mpOgexSVrO4JmhHz+mD5w==
X-CSA-Complaints: csa-complaints@eco.de
From: Mario Schuknecht <mario.schuknecht@iris-sensing.com>
To: openembedded-core@lists.openembedded.org
Cc: Mario Schuknecht <mario.schuknecht@iris-sensing.com>
Subject: [OE-core][PATCH] libgpg-error: Move yat2m binary to -dev package
Date: Fri, 21 Mar 2025 08:20:46 +0100
Message-ID: <20250321072046.5349-1-mario.schuknecht@iris-sensing.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Complaints-To: abuse@smtp.net
List-Help: <https://www.rapidmail.de/unsubscribe_help>
Feedback-ID: ohorkrd6ro6lu91c:3291:trx:rapidmail
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 07:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213438

The yat2m tool is a utility that is not required to use the pure
library.

Signed-off-by: Mario Schuknecht <mario.schuknecht@iris-sensing.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.51.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
index 741969beb0..4ef65a6acd 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.51.bb
@@ -47,7 +47,10 @@ do_install_ptest() {
     install ${B}/tests/Makefile ${D}${PTEST_PATH}
 }
 
-FILES:${PN}-dev += "${bindir}/gpg-error"
+FILES:${PN}-dev += " \
+    ${bindir}/gpg-error \
+    ${bindir}/yat2m \
+"
 FILES:${PN}-doc += "${datadir}/libgpg-error/errorref.txt"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.3


