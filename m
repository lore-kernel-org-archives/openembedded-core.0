Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B97BC05027
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 02:38:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.5746.1676255889887982491
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 18:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rceL0KiI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676255887; i=@fujitsu.com;
	bh=g0PDdFCKOQuHSZNt/cWzKW1cJpmagMw1gsNGMOMGZqU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rceL0KiIIObbJmnv43TQLEjEUMzN5wi2o1TxOac655QmUYmwL/188A39p2nYEWQUD
	 ra0im2oUrFe3J/Aoj9MgnhK52Hb0X1aMC58PGqVxM30Sv6qYmZriDVQUogjuKwI5Hx
	 ec6n8HyJOXs51tWN5AbOtz3qbpynxXRyYcSzPkC+YC6fc4xxYGWmM5YOQZhknNkh8+
	 ARPdFuUxEIvOPi6BJ5nHw7uXweBz3QCjK2/fDohtj1nEKzDuhlWOvHmDFoJPxbLdRo
	 VCCBJ0jBRsUIQuDuTSWhDrziaYh9WMy2v2mw7Ln8gLSHqsj4/AJHSuR1RdKBkK9IC3
	 T4mC/zLPBozdA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8MxSbd/0ct
  kg/cdXBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aLr58YC76xVyz5+oCpgbGNvYuRk0NI4DGj
  xNqugC5GLiD7OpNE76NWJojEXkaJq+drQWw2ASmJG/f/s3UxcnCICOhJXP0nChJmFlCRePG7B
  2yOsICtxIxTMxhBbBYBVYmts7aCxXkFnCT+PXvBAmJLCChITHn4nhkiLihxcuYTFog5EhIHX7
  xghqhRlJh9uRmqvlKi9cMvKFtN4uq5TcwTGPlnIWmfhaR9ASPTKkbT4tSistQiXVO9pKLM9Iy
  S3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMAwTClmMdvB2N73V+8Q
  oyQHk5Iobx/Hy2QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErxSC4BygkWp6akVaZk5wJiASUtw8
  CiJ8FpMAErzFhck5hZnpkOkTjEqSonz8i8ESgiAJDJK8+DaYHF4iVFWSpiXkYGBQYinILUoN7
  MEVf4VozgHo5Iw7+5ZQFN4MvNK4Ka/AlrMBLT4MR/Y4pJEhJRUA9NSxynlFzI3TW5zvJrypvn
  69Ot5fBUR+s+Y/q9Ylt5lu/jY9jUiOS/0hR5yrIvRFQsoXr99Qdb/SWknAqeUaztLu7WrJfUw
  f1Z51RjeGGN/VOyNpK5TjlaQauaSuE8p1vvklyffqTNiWLjZjlF/2nrBdtubE+5oHZG7yvt33
  ZOiq7t/vS1O7VY03DftdoXcCqnpB1+y8Tg92n3ebqXLMx1DaccrUfrNIfb6uVqRem/+G1+5vy
  gxirlFPTBK//D0cC+Jh7Y1d+9Nem6zpTSY611KiZ+XuImZRcvRQhnLymX7uNs9jkzYe8B3ymR
  Z6TXxJ/zjolUeLT37/9jait1ZEyN6tixN4l4QuOb4h0lXXyuxFGckGmoxFxUnAgB+SOIaPgMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1676255886!516780!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4251 invoked from network); 13 Feb 2023 02:38:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Feb 2023 02:38:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C3D791000DC
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:38:06 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B83A21000D7
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:38:06 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 13 Feb 2023 02:38:05 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdrm: upgrade 2.4.114 -> 2.4.115
Date: Mon, 13 Feb 2023 10:37:51 +0800
Message-ID: <1676255874-19490-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177073

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drm/{libdrm_2.4.114.bb => libdrm_2.4.115.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.114.bb => libdrm_2.4.115.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.114.bb b/meta/recipes-graphics/drm/libdrm_2.4.115.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.114.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.115.bb
index e01b7934b3..50206f2ba8 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.114.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.115.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "3049cf843a47d12e5eeefbc3be3496d782fa09f42346bf0b7defe3d1e598d026"
+SRC_URI[sha256sum] = "554cfbfe0542bddb391b4e3e05bfbbfc3e282b955bd56218d21c0616481f65eb"
 
 inherit meson pkgconfig manpages
 
-- 
2.34.1


