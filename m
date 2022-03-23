Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2FEC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 08:02:26 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.6589.1648022544899517454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 01:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ilSWPIFL;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648022543; i=@fujitsu.com;
	bh=T5WLzWNt+77hvnu6LIUkH4GA6vcSdp6DoNvKN0RwfTs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ilSWPIFL87HJWpHwNKXhI3KjBxoQvemem9ZMtojr2J08BCGmEIMSsKl6yNjmDPTLe
	 Z1+DGpyK+6cUZWCEVJJu5KEITR77yRjFXdNbethohGYRrAIOAwRPZuvUAqtrw4OohX
	 2fzcZzhgmx2G71urSI8HOAVN9G3RBU4uzNXg4GQYvKQvg4itfSUuMsDLHyk/t9x5ZK
	 J7DXPLYGkxS5dIlaXi80rbSrpBgKHJMH6VS2nIm7cC+hAuLir9rhmYfls9DovByN6t
	 JIxB+eV3yiKB1ZQrAeU+p9YzXFv4Pan3db1p4Xhc4nnrcq3la3AWxGRnOuUYKgnR8E
	 TJ2dKMRSh9s0w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MxSZfrilW
  Swb/tMhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bRBZMZC16yVzQe/MTewPiarYuRi0NI4DGj
  RPOs9cwQznkmiZNPP7F3MXICOXsYJf58UACx2QTUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7
  x6wcmGBIIn/Td1MIDaLgKrEnZ1zwWxeASeJu3vvg9kSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskZs1qg+pVk7h6bhPzBEb+WUjaZyFpX8DItIrRLqkoMz2jJDcxM0fX0MB
  A19DQVNfMTNfQ1FQvsUo3US+1VDc5Na+kKBEorZdYXqyXWlysV1yZm5yTopeXWrKJERiaKcVO
  s3cw7uj7qXeIUZKDSUmUd9sBqyQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErzBF4FygkWp6akVa
  Zk5wDiBSUtw8CiJ8C68AJTmLS5IzC3OTIdInWJUlBLnrTsHlBAASWSU5sG1wWLzEqOslDAvIw
  MDgxBPQWpRbmYJqvwrRnEORiVh3pOXgKbwZOaVwE1/BbSYCWjx85+WIItLEhFSUg1MfCLfa97
  smnLmUl1ESIvth3uMzOrxVmxaEqtVHxyUNffZfC1+jvkShQ+3PrO2uBju6OYxnhp8ep0t54Uz
  f5r6k1r+awU+Vlec/svm6jRj5okFh/MlxL7Nt/dkTz82c2NPdfyR+WvbKu+rNZR4N8n90dtnl
  cyu+Ufswa2/ilu/T9GZ55D76XFM+JEXk3fHSz+xrolOsCpLZnmzW2zz4adbxXpm9Ny0ySoTfm
  l2pPuRwdVHvL+7GddUr1n84dRjQd2E7qSZaf0n+eSSbNjapu9Rl2spOCeYyygsolt/a221xvT
  AxU9DtkirVjqVXjPgNRA4dk7/zXpjpVPhp1LObbWPz/+3cfvzzUdzT31/WPhTiaU4I9FQi7mo
  OBEAM+/Hp0gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-528.messagelabs.com!1648022538!60416!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7973 invoked from network); 23 Mar 2022 08:02:18 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Mar 2022 08:02:18 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 049EC100455
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 08:02:18 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EBEBC100450
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 08:02:17 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 23 Mar 2022 08:01:56 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] rng-tools: enable macro
 JENT_CONF_ENABLE_INTERNAL_TIMER
Date: Wed, 23 Mar 2022 16:01:42 +0800
Message-ID: <1648022502-11770-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 08:02:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163579

do_compile error :
| ../git/rngd_jitter.c: In function 'rngd_notime_start':
| ../git/rngd_jitter.c:56:45: error: invalid use of undefined type 'struct jent_notime_ctx'
|    56 |         ret = -pthread_attr_init(&thread_ctx->notime_pthread_attr);

enable macro JENT_CONF_ENABLE_INTERNAL_TIMER to use struct jent_notime_ctx

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/rng-tools/rng-tools_6.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
index ae974f9f6f..0696351903 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
@@ -34,6 +34,8 @@ INITSCRIPT_PARAMS = "start 03 2 3 4 5 . stop 30 0 6 1 ."
 
 SYSTEMD_SERVICE:${PN} = "rngd.service"
 
+CFLAGS += " -DJENT_CONF_ENABLE_INTERNAL_TIMER "
+
 # Refer autogen.sh in rng-tools
 do_configure:prepend() {
     cp ${S}/README.md ${S}/README
-- 
2.25.1


