Return-Path: <Markus.Niebel@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3902BC05052
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 11:31:32 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.8863.1692358281574877789
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 04:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=GPEjc/GV;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: markus.niebel@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1692358281; x=1723894281;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qL2Z4uVALRbhrkrcHVxyS8ze6FmHS+qV387Ven8DXLQ=;
  b=GPEjc/GV3d5+ArAd2lFpqgN0Xf8Yl0YnyHWsJ2yihD1SqpjgK9ht2CFO
   H6nTXuyLAQE9T4Wyif8s4GzTsLqG8ehywe9P1eQ2r92Nu6gTgD/olOes5
   3rqW3RCgUUuU5+EUG2T65s4EkS4Ag5TPkRWmcm9eEBHwv7aLt/4rH1xjy
   xBtgQqqtYqhyAmKeLSufkHz/JbBTtaAOhaXu3jUD6syq4d+oda9UOfj/I
   40TkSBp2j7fU5AA3IyXgEMNGPnwPjdqCw5WOxXOnW3O+x43zc42sS1aaq
   0VYYoJp+DS0azZgYoEZ5jCnqvFgt31XWrR5c+B7ZacJK123OW4D7Bg4iu
   A==;
X-IronPort-AV: E=Sophos;i="6.01,183,1684792800"; 
   d="scan'208";a="32514129"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Aug 2023 13:31:19 +0200
Received: from NIEBEL-W3.tq-net.de (NIEBEL-W3.tq-net.de [10.123.53.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4F625280075;
	Fri, 18 Aug 2023 13:31:19 +0200 (CEST)
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH] wic: remove typo in comment for ksparser.py
Date: Fri, 18 Aug 2023 13:29:57 +0200
Message-Id: <20230818112957.2841388-1-Markus.Niebel@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 11:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186360

Replace 'iff' with 'if'.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
---
 scripts/lib/wic/ksparser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 667b2ff9c3..b4e2c2d71b 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -271,7 +271,7 @@ class KickStart():
                                 raise KickStartError(err)
                         else:
                             # ... and provide defaults if not using
-                            # --fixed-size iff given option was not used
+                            # --fixed-size if given option was not used
                             # (again, one cannot tell if option was passed but
                             # with value equal to 0)
                             if '--overhead-factor' not in line_args:
-- 
2.25.1


