Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E711C64EC9
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.38852.1650284920997410350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=R3teZ42Y;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650284919; i=@fujitsu.com;
	bh=ld1wPrHWQx4lSsy7gP+HDdlU3+xGJ+9HqeB+UhuTP7Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=R3teZ42Y7edBcGqLkDxtyAtQ+VveAkJY+iiQzdrlZMaParxrCRHZ+cAhWGIrqizyJ
	 w62WCK2zsX26qBPj9cew12aFb7Z0jDa79qGB4Mlq3GZVatvf1Vi7n6iKHtBfRzp+VF
	 BO4ku+EcCaxcCZ6Xg7+Kp3gV/rq4lOEkNVx7NDKjh7M5zAGkmBBxRzxeg9u2MgmWXV
	 R3I9ADOIbSGCWyzLZLRAaeRy4rVkAsOOKsNv/0oDT1emFEyAIRzI/ZtKGL+DahRp++
	 InKbIfTQ+kwJRLeOMxO7IHEi1B7fWhEDBL73ASo62pnN/QhcbSzLoQHoiZZkmUMz6S
	 ALbjRf0Tnc0Lw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0S2LjE0
  ymHpRzuLOz3fsDowe5zauYAxgjGLNzEvKr0hgzVi56ydLwVLOirOX/7M1MF7m6GLk4hASmMUk
  sfzQVxYI5wCjxKJZT9i7GDk52AT0JTau+8TUxcjBISKgJ3H1nyiIKSzgLbHoRRZIBYuAqkTv7
  oNMIDavgLvElT2bmEFsCQEFiSkP3zNDxAUlTs58wgJiMwtISBx88YIZZIyEgKLE7OnyEOUVEq
  8PX2KewMgzC0nHLCQdCxiZVjFaJRVlpmeU5CZm5ugaGhjoGhqa6prqGhmZ6yVW6SbqpZbqlqc
  Wl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZRSjHr4x2Ma/p+6h1ilORgUhLl/e8bmyTEl5Sf
  UpmRWJwRX1Sak1p8iFGGg0NJgjc/AignWJSanlqRlpkDDGmYtAQHj5IIb38IUJq3uCAxtzgzH
  SJ1ilFRSpx3NkifAEgiozQPrg0WR5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfN2gkzhyc
  wrgZv+CmgxE9Di7fMjQRaXJCKkpBqYGO9fPSHr8Khv/9rw/xb+QW83zNm/76vfzrfbTpvEJS2
  Y3z6j16XvBrtQ4B3/gjdbzdwlprblmYn0T5ds/O3yeWOjtry48Jc313tLzVsFtwuYZy69e17u
  6RclLsGl09uv3H+4101N47nL6iW5x9VCnBe68qeX1WhaGL192aJQkP39kdpZ3nQmvRKdY0JOn
  3i6f2wwsqgPefnmOG9yyssp547piNQn1h669d1t+slTWlvzmMysrRu/R8ruVZSfecj+1dOMR8
  1Cf5Ik23wNOffwpag5rTmoEn7F+UbXkjOR6+/VZyxJE/AIuZUeUPftwq4Hb3/HHJjtn6v40OD
  5khm+DhG6tz7b5Fn+nWHVviRXiaU4I9FQi7moOBEApgpPPh4DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1650284918!200201!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2638 invoked from network); 18 Apr 2022 12:28:38 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:28:38 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23ICSc80001191
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:28:38 +0100
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:28:36 +0100
From: "zhengrq.fnst" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] wireless-regdb: upgrade 2022.02.18 -> 2022.04.08
Date: Mon, 18 Apr 2022 20:27:33 +0800
Message-ID: <1650284853-2517-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164601

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
index 801a6f0584..cd42039680 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.02.18.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.04.08.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "8828c25a4ee25020044004f57374bb9deac852809fad70f8d3d01770bf9ac97f"
+SRC_URI[sha256sum] = "884ba2e3c1e8b98762b6dc25ff60b5ec75c8d33a39e019b3ed4aa615491460d3"
 
 inherit bin_package allarch
 
-- 
2.25.1


