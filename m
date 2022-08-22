Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF3AC3F6B0
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 11:14:04 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.17011.1661166839939577951
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 04:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=haxbX7C0;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de
 (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 27MBDv7R917375
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 13:13:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1661166837;
	bh=Sl3RxE+FHEVPUCAwD4HBZXYcUzWyffi0evRXqvJRgZQ=; l=783;
	h=From:To:Cc:Subject:Date;
	b=haxbX7C0RRs2KXAOmUxmLsDl/8QCiRK7n5WMQG1mjhzKA9F9OwjBWO6cVomkZMEDp
	 MK7C3JxXO9+QnsO6pqxcrzmJdbfrC2Es1A3pJhGz9jQ8iJ4cz4BGVAZncUoUdGIcBf
	 VDeaFeYzWCGrJGsZQDjmC+kZB4VgTycZuLr85lVn4yjR+izA6sLZ3esUBikBHt1If0
	 /RFhQoXeB+VWwNTQVxdl4k0gnKMZyTz0GHhYhdMqX/O5fVYbuuIh/IaiNfzD5ZKilL
	 mRlkEJ8pE1km4BVfJV3tcrcWbYZjKBmPL7RQezA+ewXnGRLEekQbKh+PcQMqLCbgxW
	 +GAMsPA7mheMw==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 27MBDt9H2699975
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Mon, 22 Aug 2022 13:13:55 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ( [192.168.12.73]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 829F16493AA; Mon, 22 Aug 2022 13:13:54 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id
 27MBDsqI876708
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 22 Aug 2022 13:13:54 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1oQ5NR-0052TW-V8;
	Mon, 22 Aug 2022 13:13:53 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 1/2] npm.bbclass: fix typo in 'fund' config option
Date: Mon, 22 Aug 2022 13:13:36 +0200
Message-Id: <20220822111337.1201003-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 11:14:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169669

Configuration option is named 'fund', not 'funds'.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes-recipe/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index deea53c9ec65..8e73400678db 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -54,7 +54,7 @@ def npm_global_configs(d):
     # Ensure no network access is done
     configs.append(("offline", "true"))
     configs.append(("proxy", "http://invalid"))
-    configs.append(("funds", False))
+    configs.append(("fund", False))
     configs.append(("audit", False))
     # Configure the cache directory
     configs.append(("cache", d.getVar("NPM_CACHE")))
-- 
2.37.2


