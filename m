Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21EBC433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 15:04:04 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.13266.1636470243702225971
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 07:04:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TShOIWuL;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636470241; i=@fujitsu.com;
	bh=Hmrsbpfi6bZ/Q+FyaVais+CGXZSVyPB2wUV4xwRSaj4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TShOIWuLteb0X9L8PuqSsXfMUSCi+9vN1KM2vr6Q0ets6X8Tr167t0m0PikvDtEa5
	 6Olkejx8Kg233McgwoiK0P8+AFwZiYHG7ZVgzN4MpjhawRVa62AX8IPOKu6vyDdGUF
	 llLG8Kyi4ITGK+8+TtnVZh3DJbLt0HPantAdSAvQFtN7Je0dVOjvLNjdrmp5T6tVcA
	 yORCs9jXU6KIw5vonhVU3B8CWKJb+DI9SjmYXJJWaQQwkyucwAdrTKx7AiQlN9gecV
	 xjvS8tEdBDagyqeGANmKKYg/eeo3emo59gBirZmzlVftQSIF2x9he9SLlqcQX/mNfN
	 Ibbc8COJ55PHw==
Received: from [100.113.7.62] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 79/E0-14220-1ED8A816;
 Tue, 09 Nov 2021 15:04:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqPuwtyv
  R4NM2KYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPVzbvMBQc4Krpm/GZrYLzK3sXIxSEk8JhR
  4trr1awQznkmiffHZzJDOMcZJZZP6QPKcHKwCahJTL91A8jm4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLOAgceHfDDYQmwUofv7GLiYQm1fASeLUk5ssILaEgILElIfvmSHighInZz5hgZgjIXHwxQ
  tmiBpFidmXm6HqKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWK0TCrKTM8oyU3MzNE1NDD
  QNTQ01jXVNTK20Eus0k3SSy3VTU7NKylKBMrqJZYX6xVX5ibnpOjlpZZsYgSGZEoh67sdjM9e
  f9A7xCjJwaQkyvuvqytRiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvFpCcYFFqempFWmYOMD5g0
  hIcPEoivGIdQGne4oLE3OLMdIjUKUZFKXHe/nqghABIIqM0D64NFpOXGGWlhHkZGRgYhHgKUo
  tyM0tQ5V8xinMwKgnzbugBmsKTmVcCN/0V0GImoMUHv7SDLC5JREhJNTBJpTL/dcp+J7D2tMO
  F2Ftr+epyfe7OEr5yzXq1xmeOXd1tAXH+PhsiVTnUZz9QXZ51jPXjjD/rjWYYn6jX1bB2/JeR
  0+D1fvVh1nWNy27ahUz8GnE555ITezebMetab1U5Nx6ze/ae/2fLK/btOfHY5UPxfM+dq1mjk
  x+abW6ZsnSy6n4Zpekz/Ve82j5/z9y111a4+L5cKMHOKfJp0lRtuz973X7X/s/x4613737cZN
  0dqNsX8U9XynPffZWDGz0O+6w9d2P7pRe8xw72Nb1rZmpa8tAjLMF07/eMR/HP7+3j/nxPV8d
  6T2X6SeNZWRbv6y3zOI9WOGUFdxdYnZ192+8Kn8TF2ztWnlOVN+FXYinOSDTUYi4qTgQA0/6U
  3EQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-248.messagelabs.com!1636470241!419613!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32741 invoked from network); 9 Nov 2021 15:04:01 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 15:04:01 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E1F09100241
	for <openembedded-core@lists.openembedded.org>;
 Tue,  9 Nov 2021 15:04:00 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D6B79100234
	for <openembedded-core@lists.openembedded.org>;
 Tue,  9 Nov 2021 15:04:00 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 9 Nov 2021 15:03:38 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kexec-tools: upgrade 2.0.22 -> 2.0.23
Date: Tue, 9 Nov 2021 23:03:28 +0800
Message-ID: <1636470210-60936-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 15:04:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158053

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../kexec/{kexec-tools_2.0.22.bb => kexec-tools_2.0.23.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.22.bb => kexec-tools_2.0.23.bb} (97%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
similarity index 97%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
index 95ff5e6ef8..906e5fcd26 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.22.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.23.bb
@@ -22,7 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-kexec-arch-ppc-kexec-ppc.c-correct-double-definition.patch \
            "
 
-SRC_URI[sha256sum] = "40623d4321be2865ef9ea2cd6ec998d31dcf93d0f74353cbd3aa06d8821e3e41"
+SRC_URI[sha256sum] = "c7dcc59f5b66004d9d91264324e20e0387ea263dbb449708fbf84a4e5ff7decc"
 
 inherit autotools update-rc.d systemd
 
-- 
2.25.1


