Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A231CCA479
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:29:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.36785.1656674941679569027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=G5nWJOQV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656674940; i=@fujitsu.com;
	bh=LCr2mvX5RoEXJxCPDbiI4pqQJJjDMVXwxuFXyT2iJP0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=G5nWJOQVwWRM/6Zeg+kk3La7F0voo7/P2xO/WPm9QcIZMWuKzu6ORSsAr72vJduRf
	 MeC/iU1V3jRjj6Vk6VumD1YbifAvh+nEilS46VNi42zuazZFQeEQ/gZSGbnwXLn4Yb
	 w3+IcaLhCEeZLTFP0QNO/nsLjIjhT81gvbZ9wZugFCy3bDfI4GSpryLbMsyb6qkybg
	 ssRGZwlWptnaQHw7rmkVFk6FbkWhLMK2HjetUkoYwBC5TEK9qh7yzn8aQ9FLcGbFSw
	 NVGA06BpDaZBU+PicWWgIheUB9N+kpCcMethh6N12Ir5Y3JmEij//b0XwQBK9/hVml
	 c6M032y89xiDQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORpFt9a1+
  Swe4D+hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bnA3kFC7kqmjd3sjUwbuDsYuTiEBJ4wCix
  7PsvRgjnEpPEtU9bmSGc3YwST28eZuti5ORgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e
  9hBbGGBYIljG44yg9gsQPGus8fBbF4BJ4l50w6AjZEQUJCY8vA9M8gYTgFniUfXuUHCQkAl+1
  dNY4UoF5Q4OfMJC8R4CYmDL14wQ7QqSsy+3MwCYVdIzJixDWqkmsTVc5uYJzAKzkLSPgtJ+wJ
  GplWMVklFmekZJbmJmTm6hgYGuoaGprrGxrrmJnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIEBnFKs6LWD8dWKn3qHGCU5mJREea9e25ckxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYI37yZQTrAoNT21Ii0zBxhNMGkJDh4lEd5+kDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8v
  NSpcR5/54GKhIAKcoozYMbAYvsS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeTddB5rCk5l
  XArfpFdARTEBH7Jy2B+SIkkSElFQD09I5UwrurZVwKb+icP3vnY87xFe5HJAT6tTyEvvU0fkz
  62z/M883rvfftfzYutShvdWmx/+itgF3Qghz6jlWNt2rF5fpv/KaPkPSpG1axSLfIrH3+7bYm
  rpeKC3gNkh9/37ixeyDU1f8zT6pefP+n8CZ560mOU2PMZCTPf0guM3RqP94w2Tp7jXs/G/19r
  xnNYoVFTnhbui/TMjpGWvo/fCrK25HqS28cflqcLHgjMVF77l+ZwvXim5+1GOhfalLvm3b/RN
  qzSeLNt8/ltCYWGdrvG9nffELvWNnw9ufrf4v3VzzxYtd6FDk3Lvb+a7d4gk5x+I+b/LkMku+
  /b+5Hx382yPH6tZknL9GhuXIKiWW4oxEQy3mouJEAF9eOolnAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1656674939!3712!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30313 invoked from network); 1 Jul 2022 11:28:59 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 11:28:59 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 7B2391AC
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:28:59 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6F69E7C
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:28:59 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 12:28:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 5/11] gstreamer1.0-plugins-base: upgrade 1.20.2 ->
 1.20.3
Date: Fri, 1 Jul 2022 19:28:33 +0800
Message-ID: <1656674913-20419-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656674913-20419-1-git-send-email-wangmy@fujitsu.com>
References: <1656674913-20419-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 11:29:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167458

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-base_1.20.2.bb => gstreamer1.0-plugins-base_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.2.bb => gstreamer1.0-plugins-base_1.20.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb
index e47851700a..7eebbba949 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "ab0656f2ad4d38292a803e0cb4ca090943a9b43c8063f650b4d3e3606c317f17"
+SRC_URI[sha256sum] = "7e30b3dd81a70380ff7554f998471d6996ff76bbe6fc5447096f851e24473c9f"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.25.1


