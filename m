Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4C0C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:20:01 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.10980.1639401600538486911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HA2MKtVk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639401598; i=@fujitsu.com;
	bh=Camd+h5upgLlXzXyKnkmU1SOr3qBLcif+AhR5tR8NGg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=HA2MKtVkBceEZcvyg6a1wenjZH4auaGKMEGgGeEr8gNef7yNLz0g6yV+9ubZjMqfP
	 T5KaHwVIiZoRdaPfVZOaHCxhPccIftCyQkPL3KeGRUIo2rP+dzX4rhTIdOKJtOjIvo
	 WJw2Pg3kl5nSnHih/JomUb2DcVMdut9Bid4jow75R881L2HHKlRCjKBS4KmtCqpTRb
	 JIO+5rS4EyzUrjaoKdjxlXIlvStxLtv6FLsdNDYo/n9Op8CKbXmooh4P3jnEeOjNUQ
	 YGrS1+9weuAX7Ps9E3R1lGAMSjwI/0ELiT0xNiD76kyL+61DdG8UllZxcwYOO8+Uuz
	 MFkc1J4eB0Q6w==
Received: from [100.115.66.58] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 4B/9B-24146-E7847B16; Mon, 13 Dec 2021 13:19:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8ORqFvnsT3
  RYNVHGYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePszBvsBS+5Kma/PcXWwHiZs4uRi0NI4DGj
  xJF1G5ggnPNMEt1nprBBOCcYJW5P/8TcxcjJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCAuYSy79fYwEpYRFQlXjVWg4S5hVwkni0dS8riC0hoCAx5eF7Zoi4oMTJmU9YIMZISB
  x88YIZokZRYvblZhYIu0Ji1qw2JghbTeLquU3MExj5ZyFpn4WkfQEj0ypGu6SizPSMktzEzBx
  dQwMDXUNDU10zE10jE1O9xCrdRL3UUt3k1LySokSgtF5iebFeanGxXnFlbnJOil5easkmRmBo
  phQ7fN3BeLzvp94hRkkOJiVR3mDW7YlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHh/mwPlBItS0
  1Mr0jJzgHECk5bg4FES4e12BErzFhck5hZnpkOkTjHqcqw6MH0VsxBLXn5eqpQ4r6A7UJEASF
  FGaR7cCFjMXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzJsMsoonM68EbtMroCOYgI5grNw
  MckRJIkJKqoGpOvwuyxJn9W0yS/4mrfhkHpXRdnHHnXoLW5/V6VJtCWkPvweqvj7gN20XV88G
  Eb9y4Uj5Lq+pEQuj3EsdDoVV2AZb36ttNFDvYr/p8fDS6xkHjq9ylC5vXHFiAefXlJBvcfPX7
  HsoI5n9clp/R4anlcyLVVnf+RZfTFCTulCxf+2RJJ6rRzU8djf6mvte+nUpTftp3uMyg01qV3
  dbdR2NvObz7W3CXgHJ845Z68W+ue1cGzZnYbFo+on3u3ptJfbKPoudxcD679kWtT+Pgrw0rfb
  NP/r1GBvnYctjF5iTp5z7/Hf/ynllB2bVVC9tuPdn/gS20u/17TGcJjOm/1zQLrd6Y8oDf8+4
  FRfW8PmdU2Ipzkg01GIuKk4EAMbdyeVUAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-532.messagelabs.com!1639401598!16543!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12769 invoked from network); 13 Dec 2021 13:19:58 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 13:19:58 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0635D1009F7
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:19:58 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E516E10023E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:19:57 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 13:19:46 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libcap: upgrade 2.61 -> 2.62
Date: Mon, 13 Dec 2021 21:19:36 +0800
Message-ID: <1639401578-27830-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:20:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159628

Remove set of BUILD_GPERF since it is now reserved.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libcap/{libcap_2.61.bb => libcap_2.62.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.61.bb => libcap_2.62.bb} (95%)

diff --git a/meta/recipes-support/libcap/libcap_2.61.bb b/meta/recipes-support/libcap/libcap_2.62.bb
similarity index 95%
rename from meta/recipes-support/libcap/libcap_2.61.bb
rename to meta/recipes-support/libcap/libcap_2.62.bb
index a3a6e10b89..7492ad816d 100644
--- a/meta/recipes-support/libcap/libcap_2.61.bb
+++ b/meta/recipes-support/libcap/libcap_2.62.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "c1e29680f8bcc51b172e9a8eb9a7a4d7255a00a14301a7c2cf96d1febf7449a5"
+SRC_URI[sha256sum] = "190c5baac9bee06a129eae20d3e827de62f664fe3507f0bf6c50a9a59fbd83a2"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
@@ -32,7 +32,6 @@ EXTRA_OEMAKE = " \
   lib='${baselib}' \
   RAISE_SETFCAP=no \
   DYNAMIC=yes \
-  BUILD_GPERF=yes \
 "
 
 EXTRA_OEMAKE:append:class-target = " SYSTEM_HEADERS=${STAGING_INCDIR}"
-- 
2.25.1


