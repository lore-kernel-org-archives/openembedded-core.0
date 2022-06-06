Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B913AC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:27:44 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.31228.1654518455661808025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cltkN0EG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518454; i=@fujitsu.com;
	bh=ISNoifu7rv380rDtDCX8RtbxcdunW1Lq2INPzPBOfuk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cltkN0EG7zoS9N4K6rW7QwZbVljDUDyYGoWgsOjoEI6ReRtF//gHHQKtWzKpWQvtU
	 W0a9bfvJfVs7tgiIIUoH26od0oqpYulPbBN+PYapBDtH5AU+eQtedMJtmWBtarwF3n
	 FSXYSnqAE/2clmZS3flAryRAp4odaztekc+8rJxvNv2v7uLfsDZwX6Z1ZBsx4ITFrG
	 Hlasi/cRX7jUfSePRdFEgOgaj82CUmztRtC9rUNoS0TteHY+MYg3tepCEkB4hjromR
	 3iuZYZgdHoVAhOXxpJKEjPxoxZ1wsf6TRPSgwvNFsBWz94i4DRbRwcMWediwloDPV9
	 UDW2k4lr/Tzzw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRWlGSWpSXmKPExsViZ8ORpLv109w
  kg8ZzihZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8akQ48ZC5bxVDw5a9zA+Jmri5GLQ0jgAaPE
  4bm3mCCcs0wST06cZ4VwdjNKXFn8l6WLkZODTUBNYvqtG0AJDg4RAT2Jq/9EQcLMAioSL373s
  IPYwgKWEvda/zOD2CxA8S39WxhBbF4BR4kby3+D2RICChJTHr4Hq+EUcJL4vO4qK4gtBFTTNO
  kqE0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0JixoxtbBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWM1klFmekZJbmJmTm6hgYGuoaGprrGJrpGhhZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBQZxSrHRrB+OGVT/1DjFKcjApifLaX5ubJMSXlJ9SmZFYnBFfVJqTWnyIU
  YaDQ0mCt+4DUE6wKDU9tSItMwcYUTBpCQ4eJRFe63dAad7igsTc4sx0iNQpRnuOD4eu7GXmmD
  r7335mjuVgcubXtgPMQix5+XmpUuK8x0GmCoC0ZZTmwQ2FJYBLjLJSwryMDAwMQjwFqUW5mSW
  o8q8YxTkYlYR5H4BM4cnMK4Hb/QroLCags3wezAE5qyQRISXVwFQq1MOck77va/Sa9vS7Ia0n
  L3cWGL/p5C1/cfeBDNuGipPC9SekxUsut/6r8jxk/Mh+YUyG0qTjz3J/ai6rtNu5pP6GjFn5m
  ZyaW/8XH3+c4BatVabLu3LxUYXT+olNlbHTdz3t8+/L/dNywrS54OGMm5elE06LJaSt1v/8w2
  PrvLs+0asM97EqBAtxpG8wfHJo8uukSS5+PxKWOJ++ZSiiFMxjZH7Nbp+g/h8mfa7/WvbcK5p
  fMkhEJaxnnxvyTM/n8ysJbR4vqTcRF1R8N7Oqnkzp2XFpTzDb6fA6g6+xws+jMiZoS7g8jrr5
  7++yBdd+fN/8Mjh744zZltPOHfDT2skUs/FIf9rqhWf3RCixFGckGmoxFxUnAgA88rr4ewMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-565.messagelabs.com!1654518453!629410!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23407 invoked from network); 6 Jun 2022 12:27:33 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:27:33 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DAD40D5D
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:27:32 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B71518B84
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:27:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:27:30 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mesa: upgrade 22.0.3 -> 22.1.1
Date: Mon, 6 Jun 2022 20:27:12 +0800
Message-ID: <1654518434-9263-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654518434-9263-1-git-send-email-wangmy@fujitsu.com>
References: <1654518434-9263-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:27:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166621

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mesa/{mesa-gl_22.0.3.bb => mesa-gl_22.1.1.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_22.0.3.bb => mesa_22.1.1.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.0.3.bb => mesa-gl_22.1.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.0.3.bb => mesa_22.1.1.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.0.3.bb b/meta/recipes-graphics/mesa/mesa-gl_22.1.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.0.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.1.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a5de6f9dbf..d268b19323 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
            "
 
-SRC_URI[sha256sum] = "9f2b30f5276a9abaf71aafc6979685e2636189de1a87aea2c9e69744a6d0ebb9"
+SRC_URI[sha256sum] = "46940865ffe794db73ac2bc7ab7ff2570042a0b61a8ac43ca1688863e2bc0ef1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.0.3.bb b/meta/recipes-graphics/mesa/mesa_22.1.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.0.3.bb
rename to meta/recipes-graphics/mesa/mesa_22.1.1.bb
-- 
2.25.1


