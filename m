Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FF2C6FD1F
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 01:40:46 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.12550.1678239641172777620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 17:40:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yb5wCs/5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678239639; i=@fujitsu.com;
	bh=stclqC1d2pavUNR9d50W0uDRNTJQB5JdlOgC7slf3Ks=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yb5wCs/5jeHTM04+G8TY5S9eG/v2nH+2/z6ggjkkc1sVqnpi9CH5U9uE6t0gwbdxI
	 WbqG0ywS8Jnm/td/TX0NgSL5YVOn8vULE6788N/nPVg10vdXdSyFH2Tw1anqLSAIFA
	 V3/EIFU9Vw8c82hTN7D97Xrtrxn1u5qzmGYRprp5gNRQRMmB2dk+f3/3GuIgxa/rHo
	 AgWAjCjl+5U948mjdkvH/bn2of7Si0OcPbNV5yIDvEWe+WaqODllQRorTUPZF2MA68
	 et4aBtbWacjVKMaFYtWK7obMy3hu7Z/+/6taZLlWVSj8kJsDtV5ltnAUWhND7WxXzs
	 w7w3ZC2Jcjysg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MxSXfac/Y
  Ug4f3pSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oz+Q5IFuzgqJv5fyNjAuJy9i5GLQ0jgMaPE
  tBsbmSGc60wSZ+69Z+li5ARy9jBKfFtQBmKzCUhJ3Lj/n62LkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrBAoMSmlhZmEJsFKP7g51ImkHJeASeJFYc5QMISAgoSUx6+ByvhFHCWmLv3OBvEJieJd7
  0TwLbyCghKnJz5hAVivITEwRcvmCF6FSVmX25mgbArJVo//IKy1SSuntvEPIFRcBaS9llI2hc
  wMq1iNC1OLSpLLdK10EsqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknR
  y0st2cQIDNqUYtY3Oxi39f3VO8QoycGkJMq77wh7ihBfUn5KZUZicUZ8UWlOavEhRhkODiUJX
  p+HQDnBotT01Iq0zBxgBMGkJTh4lER4N4O08hYXJOYWZ6ZDpE4xKkqJ825+CpQQAElklObBtc
  Gi9hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV6F+0BTeDLzSuCmvwJazAS0+MJ+FpDFJYk
  IKakGJr/tCZaMm6rTgif+sC9XS5Z9bKLpuu/8pV7RyZyvWYT9Q05PlUqy1grYUG6+0F7j2++e
  IxWN2vev63amMe+x0zN5f83Pw/LH34dvk2w/t69eJKc4wfyR+Mp2z53VlqrV7nMP+88/2+Ad9
  WmZHKNI1YOAQ6de/3qScHSd1Mo5WolsQjlbvSN2XlRkub+ncmWKs+vM0vPGfyq9t8ktXDt9o0
  PusbfTxSObKj2qJNm6P/6bfvrlhe7gqD477SQBDQXRIl+vKy62v75XanT9nO0Uqvemyfn1fXl
  eoc9PGjRWePpGy7S0r1jD+qI2qOTInRmMltZ7pc37Vc62NLBsrJl4oMFOL2ATg2hgRP6HhD9K
  LMUZiYZazEXFiQAfxMrwVQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1678239638!412674!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30539 invoked from network); 8 Mar 2023 01:40:38 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 01:40:38 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0E3A51000D7
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Mar 2023 01:40:38 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 026BB1000D2
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Mar 2023 01:40:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 01:40:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH V2 2/5] lua: Fix install conflict when enable multilib.
Date: Wed, 8 Mar 2023 09:40:16 +0800
Message-ID: <1678239619-21210-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
References: <1678239619-21210-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 01:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178148

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/include/luaconf.h conflicts between attempted installs of lua-dev-5.4.4-r0.aarch64 and lib32-lua-dev-5.4.4-r0.armv7ahf_neon

The differences between the two files are as follows:
@@ -219,7 +219,7 @@

 #define LUA_ROOT       "/usr/"
 #define LUA_LDIR       LUA_ROOT "share/lua/" LUA_VDIR "/"
-#define LUA_CDIR       LUA_ROOT "lib64/lua/" LUA_VDIR "/"
+#define LUA_CDIR       LUA_ROOT "lib/lua/" LUA_VDIR "/"

 #if !defined(LUA_PATH_DEFAULT)
 #define LUA_PATH_DEFAULT  \

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/lua/lua_5.4.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/lua/lua_5.4.4.bb b/meta/recipes-devtools/lua/lua_5.4.4.bb
index 0b2e754b31..a39d888ec2 100644
--- a/meta/recipes-devtools/lua/lua_5.4.4.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.4.bb
@@ -57,3 +57,6 @@ do_install_ptest () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}-dev:${includedir}/luaconf.h"
-- 
2.34.1


