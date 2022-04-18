Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEF0C64EC7
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.38417.1650284802875799414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LGepvJQH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650284801; i=@fujitsu.com;
	bh=Oe6b3DXmA0LBzEjGc6v86mIRsAAAscwOYevaZq0yRYs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LGepvJQHE+9CTQ/6Uk23R40jdvCev9bn9CV3neKBKQKfFP7P25+M2jQpuMUxtlXic
	 vCDOj5JQm4craIVzl3tkU18UtZ1hvzQsNCxEheHTT8S5ok8iwdkG5/yGtJ5pagjjAH
	 eogxz6n5iOForpy2qu/+AGDB3Wg/V8VNtRUidI9Hgj4A0NzNQAYfN6POeAfZb2ycHh
	 Oaw8r1O7wCiw2xSGNoJxCkMo3PHFv2ofV/q5193TBlxOr8QkkYCt8Sb4zqVrU0AG8q
	 Wp7iiksA7aUp/x9CVPm90qfPK78Ba95iOPqT0Uz8b+ON8zAJ96QgpX3rIbWPINcBXx
	 ILEjAKxDrBQtA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeJIrShJLcpLzFFi42Kxs+EI0WWIjE0
  yePtDzOLOz3fsDowe5zauYAxgjGLNzEvKr0hgzbiw6jt7wRz2intX57M0MB5i62Lk4hASmMUk
  sf1kLzOEc4BR4s+XRUAZTg42AX2Jjes+MXUxcnCICOhJXP0nCmIKC1hInD5hBVLBIqAqMWdDB
  yuIzSvgLnG+5wUTiC0hoCAx5eF7Zoi4oMTJmU9YQGxmAQmJgy9eMIOMkRBQlJg9XR6ivELi9e
  FLzBMYeWYh6ZiFpGMBI9MqRtukosz0jJLcxMwcXUMDA11DQ1NdMzNdSzO9xCrdRL3UUt3k1Ly
  SokSgrF5iebFeanGxXnFlbnJOil5easkmRmAwpRQ7JexgfNT3U+8QoyQHk5Io73/f2CQhvqT8
  lMqMxOKM+KLSnNTiQ4wyHBxKEryzQoBygkWp6akVaZk5wMCGSUtw8CiJ8PaDpHmLCxJzizPTI
  VKnGBWlxHm/hgElBEASGaV5cG2waLrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3JhxoCk
  9mXgnc9FdAi5mAFm+fHwmyuCQRISXVwLTwhPiVjs/HTZsnlPLWix7r79Iw3RTqp2z58ofQt8K
  dbl7Zx3IjSuas7OgP28+y0U0wwU7ee/IDwx+nlX77LK4+EqbUZn7s2qfGJwELPCee3pYYmPQ7
  4cc1yaxfPwpnrTl6L7fM5sbTwkfrlCv6Dv7e/NVg7r+FJXFcheEVKyZemVGzNnJeZ9Ex+T8l2
  9q9ZB11WMQsS3XyirUkXjXGJFRcU7k7cV19S/R+q3uHFeY0xQnHvLe5mfjoTuu93UkOG3Rsqk
  P0P/9+U/N5v19/sptq3Pd9O156Pu/piTewZW29eux/W+EmnXNNkqah30uE3c/bBzI23UvQDjx
  30U6Qw4exY5Gx97Kfc5ou6nY1KbEUZyQaajEXFScCAFnYZKshAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-528.messagelabs.com!1650284800!238787!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18739 invoked from network); 18 Apr 2022 12:26:40 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-23.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:26:40 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23ICQbVf032724
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:26:39 +0100
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:26:35 +0100
From: "zhengrq.fnst" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] git: upgrade 2.35.2 -> 2.35.3
Date: Mon, 18 Apr 2022 20:26:18 +0800
Message-ID: <1650284778-2393-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164598

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-devtools/git/{git_2.35.2.bb => git_2.35.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.35.2.bb => git_2.35.3.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.35.2.bb b/meta/recipes-devtools/git/git_2.35.3.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.35.2.bb
rename to meta/recipes-devtools/git/git_2.35.3.bb
index 9812549221..d152297f7a 100644
--- a/meta/recipes-devtools/git/git_2.35.2.bb
+++ b/meta/recipes-devtools/git/git_2.35.3.bb
@@ -156,4 +156,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "0decc02a47e792f522df3183c38a61ad8fbb38927502ca6781467a6599a888cb"
+SRC_URI[tarball.sha256sum] = "cad708072d5c0b390c71651f5edb44143f00b357766973470bf9adebc0944c03"
-- 
2.25.1


