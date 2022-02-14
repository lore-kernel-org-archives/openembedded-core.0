Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF028C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 14:28:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.34604.1644848935391375036
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 06:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rpTnB3jy;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644848933; i=@fujitsu.com;
	bh=fmq16WjJ7NAp/sO8ZmZ1H/7m6ayh1nxFrLdbllshMI4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rpTnB3jyQxhagseS4qM6zgg+jqyK45kKbWMupAwZezAIu/fy+nY0amaqTyAyMzEQW
	 10DksnACo+V0nQYSW779tniVkqzPZQN6KXPWX1apAJ7nkxZJXE591TAxrv1KM1h/ZE
	 64yrG3zZOHDTBJByhdMiKBf5nWAejZY6o/RLyykihvxrrjJMaOM2tomUTJ+aWwj9Jl
	 tO06dlqWgfML4GiIa3J6oyGUBX6bVMxeswGOXxV3bBpjNEdYwdtnwcmpr9PwgUPYvz
	 gSYgilIj9LXVvRF3qKgU4QHXgufdNkVZIdsubUduua44pM7A5YXMxzPv6OQQlUlc8b
	 F9jzOPzioWwMg==
Received: from [100.115.7.136] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 42/79-13236-5276A026;
 Mon, 14 Feb 2022 14:28:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRoquazpV
  k0LmBy+LOz3fsDowe5zauYAxgjGLNzEvKr0hgzZj/R6ugmbNiedsU1gbGKRxdjFwcQgIzmCQW
  fXjCBuGcYJRoOH+apYuRk4NNQE1i+q0brF2MHBwiAnoSV/+JgoSZBVQkXvzuYQcJCwu4SyxfG
  w1isgioShx+bwlSwSvgKDFr92I2EFtCQEFiysP3zBBxQYmTM5+wQEyRkDj44gUzRI2ixOzLzS
  wQdoXErFltTBMYeWchaZmFpGUBI9MqRqukosz0jJLcxMwcXUMDA11DQ1NdA10jQ1O9xCrdRL3
  UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzA4EopZri+g3Fi30+9Q4ySHExKorzd9lxJ
  QnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4d6QA5QSLUtNTK9Iyc4CBDpOW4OBREuFNDQVK8xYXJ
  OYWZ6ZDpE4xKkqJ875PBUoIgCQySvPg2mDRdYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO
  93kCk8mXklcNNfAS1mAlqc1sMGsrgkESEl1cA04/9Hw/gZ/N5+aUpWNsw9u0NfeMyOm6i4qDK
  Osfl8t4lt8Mabb8/c7jhWFmhp+OvDnb8iSgUFf3XFp/NbnGJa8NRY6JDzn3cHT53Ubpc7EFzh
  Mzek6bLY5lxlfT9GtQ/WBYdzDb2tXzsITUuVEj7k9FI0xvIGz0/Z+pMGWqdOF/Osnu8zQaO2M
  dfAdOumQ4rhZZOqdGZNbvr538G38MgKvxfbRUscUgxWrj/ny9fXE6l8Rk+u7WzW3oodrK8ecv
  /njujed/7lOv2fVuaLzt6a9V6lleWcmknK8yWBL3zzSsXlpsp/vZaixZ5pd/jq44j70bx58kL
  Mm2K0uqfyrXHLMvka2MLyzzg2WpbfVomlOCPRUIu5qDgRAPdmDykpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-587.messagelabs.com!1644848932!1602!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29511 invoked from network); 14 Feb 2022 14:28:53 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-19.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Feb 2022 14:28:53 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21EESqQF030633
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 14:28:52 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 14:28:51 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.36.1 -> 6.36.2
Date: Mon, 14 Feb 2022 22:28:41 +0800
Message-ID: <1644848923-3406-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 14:28:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161710

Changelog:
=========
Updates vendored list of top-level domains, which is used by the provisional
domains() strategy.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.36.1.bb => python3-hypothesis_6.36.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.36.1.bb => python3-hypothesis_6.36.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.36.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.36.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.36.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.36.2.bb
index 24def74905..8642fb55b9 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.36.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.36.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "46cbee9d7aed822149af75ec63d5f86cd1042df69b2e8eae17b26a56a4dda781"
+SRC_URI[sha256sum] = "7202ea05759f591adf6c1887edbd4d53c049821284f630c5ec8ec3f3f57fd46b"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.25.1


