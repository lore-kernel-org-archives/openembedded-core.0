Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431C6C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:03:35 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.31973.1641823414164851667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nmFBD2gd;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641823406; i=@fujitsu.com;
	bh=pZGHfHRxLrW+K4cv8xY0HCdZkSwJWOfax5Kf0p8nqCE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nmFBD2gdmq6CTJTdYEmPs8WhWpX3Lw1AkaBIaYuvFzZ4tLQLMmPiOdtC9VtjVSTVT
	 Xzpoi5kAaoWlg2/3SsAQHknL8d1qn5OhVpOoCha4e/6SJC/7pX2NW8PSv8PcfkN1CV
	 UraHfFf2hucMDg4nAK3ubeN26MAgbeBjD+MiBMm8TiwkM8XWJ6/7e57Snh/NGrJ6Js
	 RwQ6kZ2j41Yc3clgfHeu9epzN9KuMU7CY2d7l0ldVCXJBmEjGkAB3F6qBTb+YoIS5F
	 kfRlkQ0NAaA2Iwylj7dDNuNZntAR2XrUKavwtOHzFlgzlxLdkRqp0h1wYdY73Q8kI+
	 OA3U+x0LqpPGQ==
Received: from [100.115.70.246] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 47/23-07141-EAC3CD16; Mon, 10 Jan 2022 14:03:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MxSXedzZ1
  Eg46TXBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b0B3uZCuZxVExZdJe1gXElexcjF4eQwGNG
  iS1PdjFBOOeZJNbu/wDlnGCUODujCaiMk4NNQE1i+q0brF2MHBwiAnoSV/+JgoSZBVQkXvzuY
  QcJCwuYSJyZyQ8SZhFQlTj8dj8riM0r4CTx590BRhBbQkBBYsrD98wQcUGJkzOfsECMkZA4+O
  IFM0SNosTsy80sEHaFxKxZbUwQtprE1XObmCcw8s9C0j4LSfsCRqZVjHZJRZnpGSW5iZk5uoY
  GBrqGhqa65oa6hsbGeolVuol6qaW6yal5JUWJQGm9xPJivdTiYr3iytzknBS9vNSSTYzA0Ewp
  dm/dwXi576feIUZJDiYlUd4nxncShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwJlgC5QSLUtNTK
  9Iyc4BxApOW4OBREuHVAEnzFhck5hZnpkOkTjEqSonz8loDJQRAEhmleXBtsNi8xCgrJczLyM
  DAIMRTkFqUm1mCKv+KUZyDUUmYtwBkPE9mXgnc9FdAi5mAFidz3AZZXJKIkJJqYHLpjmvyvr7
  m/st9QQZ+AsHvIr7tuSxwbvGSGRq99n5BCVuvP/sWpbLq1ySeJuVMX4e/LLc//549e+6B2Z+T
  3m2aHNfp8Xf9Kpa1d3vMshobTZdN1b+qfflY0fJ9k6RiLa19Wb5e3T91NvPBB7+9Wipn+m1br
  363+I+3adbSvlVX17qGuB/2dQgJWugTYqXNZ2wWx+WRKtOuY3on7tae3Oc76/nk7zs/LH73Xe
  LGmTUJHk5/4jcpx53bq3RF6ezWC5FrKm+cDzhhP+/ERq1XV4/UPNfLDt9q4MN98MqBiXOyeSP
  7ptq9fRMh1SAcPSMr+/ydRi+1lzzTF8uf7/ku9t5p/Y7IpWcurVwronSnacpsJZbijERDLeai
  4kQAYeUGJ0gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-545.messagelabs.com!1641823405!5158!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22958 invoked from network); 10 Jan 2022 14:03:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Jan 2022 14:03:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B47B7100453
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:03:25 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A779210044F
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:03:25 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 10 Jan 2022 14:03:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ell: upgrade 0.46 -> 0.47
Date: Mon, 10 Jan 2022 22:03:13 +0800
Message-ID: <1641823396-62747-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 14:03:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160357

Changelog:
=========
Fix issue with memory leaking from DHCP leases.
Fix issue with NULL terminating of Base64 encoding.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.46.bb => ell_0.47.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.46.bb => ell_0.47.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.46.bb b/meta/recipes-core/ell/ell_0.47.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.46.bb
rename to meta/recipes-core/ell/ell_0.47.bb
index 4dea9442af..1db0065a37 100644
--- a/meta/recipes-core/ell/ell_0.46.bb
+++ b/meta/recipes-core/ell/ell_0.47.bb
@@ -16,7 +16,7 @@ inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "f4fc647eff32f622e21f8851ed0c8b7270f4800149c91be601754e22d82cbb4d"
+SRC_URI[sha256sum] = "4901a0baac4eb24163ceafb44fd448430361d25d8f17d89ff29f8b0b162b3eb9"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1


