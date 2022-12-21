Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B65C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 03:01:40 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.10383.1671591699166509628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 19:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vPMvvypl;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671591697; i=@fujitsu.com;
	bh=xceDd3I/xAF31ZI85DYxZXgLmB7R81LiIZdVKhIatDk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vPMvvyplsQT4rUsIx9N9nvV+dW2Y30PYsb9Lc9C9cya7xfHXt+kmGc1jdNug3wG+p
	 xbOd9aXazJ4IDZEVZUcDE3hfCgzWevAVLRrHCHF1FXjB39m3nLUYI5GtYB9wIbQz9L
	 gJpWaQCMxCMzaWpHDUlrjaEYDAklfdP0r1uvwvcoMGD4mTYW6KA723hYS9yLAlkrSB
	 LmI9yiP3aNOQpdA8cbykE8E9Fx67CWHaje0/v2m84iveJMIsSa/NEr+UReE1bYup9x
	 16crsqK1KkPqUfw+6bTWRmkDocOBdCE1icFMwcwia7UrkbTY3HI4CBfDXcMvDLWDfy
	 pS048xgfVYKNQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8ORpCtQvij
  Z4PJefYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP58XksBUs4K3q+yzQwbufoYuTiEBJ4wCix
  s+EQC4RziUlib8dcRghnD6NE/+aZQBlODjYBKYkb9/+zdTFycIgI6Elc/ScKEmYWUJF48buHH
  cQWFrCU2HVkFpjNIqAq0fB0BxOIzSvgJDFvTi8jiC0hoCAx5eF7ZhCbU8BZYlVXAyuILQRUs+
  3nbFaIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjKbFqUVlqUW65npJRZnpGSW5iZk5eolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgYGbUsyYu4Nx57I/eocYJTmYlER5fRgWJQvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  DUtBcoJFqWmp1akZeYAowgmLcHBoyTCa1cClOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlD
  jvbpAZAiBFGaV5cCNgEX2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvDMgqnsy8ErhNr4C
  OYAI6YtrNhSBHlCQipKQamC4emflWP6pGn/nK0Y9Tf9ktlzlyq2W6ycX26fMq7cOU2mb2/Y/h
  bo6Jv75CoH1ZsfbXGSqBvg/2qK3/+j/A8rSvjIF4Ar/mvqAcs5P/9vNvq6l5mf+uslOy1FtgQ
  YT7I2vvG/r9h+XvJd+brf3R7dCV/dk+P9s5/muZ9qrs9/T/trRVqaHnhVj7o1uN776cn/4yK9
  llm9UWe6ViTZnE4+k77hpYCrmwJ4of4bq81PJP2e1FZ9fe0K4MNuZpvNEfwXhzSvB8wy2f/sV
  M9ORwSNXbW/RCu2i/ApvfLXu2WeyMZvaCU7+J7r7RZKctosCmPe98wNUl/2oXHzxib99RM/34
  7jy3FzyP0kLOrtP4o8RSnJFoqMVcVJwIAGA7B31jAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1671591696!41355!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7722 invoked from network); 21 Dec 2022 03:01:36 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Dec 2022 03:01:36 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 630121AF
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:36 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 571697B
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:36 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 21 Dec 2022 03:01:34 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libmpc: upgrade 1.2.1 -> 1.3.1
Date: Wed, 21 Dec 2022 11:00:59 +0800
Message-ID: <1671591662-12509-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671591662-12509-1-git-send-email-wangmy@fujitsu.com>
References: <1671591662-12509-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 03:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174895

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Bug fix: It is again possible to include mpc.h without including
  stdio.h.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/libmpc/{libmpc_1.2.1.bb => libmpc_1.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmpc/{libmpc_1.2.1.bb => libmpc_1.3.1.bb} (72%)

diff --git a/meta/recipes-support/libmpc/libmpc_1.2.1.bb b/meta/recipes-support/libmpc/libmpc_1.3.1.bb
similarity index 72%
rename from meta/recipes-support/libmpc/libmpc_1.2.1.bb
rename to meta/recipes-support/libmpc/libmpc_1.3.1.bb
index 15d382c4ad..ed57396c0a 100644
--- a/meta/recipes-support/libmpc/libmpc_1.2.1.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.3.1.bb
@@ -5,7 +5,7 @@ DEPENDS = "gmp mpfr"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI = "${GNU_MIRROR}/mpc/mpc-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "17503d2c395dfcf106b622dc142683c1199431d095367c6aacba6eec30340459"
+SRC_URI[sha256sum] = "ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8"
 
 S = "${WORKDIR}/mpc-${PV}"
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


