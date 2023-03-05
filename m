Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35E2C6FD18
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 08:07:05 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.5242.1678003616514074061
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 00:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BICsjUhs;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678003614; i=@fujitsu.com;
	bh=DoI2sBRfm2uuYRqnwp3SdwtAVKDP+jTshhfuD8wqhps=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BICsjUhsIb66nx8PxT5dmSPTDMvvIX3OhqWIIM0UofTTUd7zR9DadvWsvq1rfTwhc
	 XmqALqslZ/AHr9hoJNavHU4ZA0q7kOGLJsNEmD49g12wDjWtl/PuRgp0bDWRrv1G/z
	 7WhGYcqkcN4cCYXgNTXQU01smWbhWuccPwcn/EJDXqynPtMMzdyM9eR3gofqxypT/q
	 3LEQcbb0JTpbji8biP9wAvB/pgQSW4X/3tIDXJXuALArL8zyH5+oopBozONuFwZw/x
	 jkWxcrUTJX+/ucyT2WYd3tNOiwYhTvOGBzGjCD5sAngmtHbHBQfqDYYKxzqH6Ohtyj
	 AH4qKqc8QGwLw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8MxSXeeL0u
  KwY2TTBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aXU/eYCn5wVHy99Z29gbGRo4uRi0NI4DGj
  xPwHV9i7GDmBnOtMEu8+R0Mk9jBKnGz8xAySYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vAeoUFLCQmLFnKBGKzAMVfTn7MCFLOK+AkceGuF0hYQkBBYsrD92ATeQUEJU7OfMICMUZC4u
  CLF8wQNYoSsy83s0DYlRKtH35B2WoSV89tYp7AyD8LSfssJO0LGJlWMZoWpxaVpRbpmuglFWW
  mZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZhSjHr2x2M/3v/
  6h1ilORgUhLlDfzFnCLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvepG0uKkGBRanpqRVpmDjAmY
  NISHDxKIrwPPYHSvMUFibnFmekQqVOMilLivMt8gBICIImM0jy4NlgcXmKUlRLmZWRgYBDiKU
  gtys0sQZV/xSjOwagkzOvkATSFJzOvBG76K6DFTECLNU4zgCwuSURISTUwMd3/Z5Fz/drxR0p
  yb3zNjEUKXnNW6jjcvL0jldGQ5+HbBzdbetf+t9cxm6tUkPyxeeLDh4bXUlp9v0bu19nutPGl
  xrolVXmGBdKND+pcNtWm9ZpPmDj7M+cjPvFZcbqZ73s7Q/ZuFI4Rsfq2x2uSyxbrLcZ6l6/Jc
  rVMeczJ+dZi1oydCzU2p+38rHDI9IaV5HSNP9NX3kvJXHpy6QwboTv/vpV0/Pt8RXvZs82qLb
  yvHY/ETWd75vfIPlRELaB6UY7Q1RsSq9jOSLz7/sTj/Z15c+YJfTa44b2wznLblRbRszWRpjd
  33nxyvn92gp192S+WCfcDZ/Wyv7hiEbK8uPNvlb2Y6Kk10Yc5v4purlZiKc5INNRiLipOBADv
  UBiSPgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1678003613!189794!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17271 invoked from network); 5 Mar 2023 08:06:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Mar 2023 08:06:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A55FF1000E7
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:06:53 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 990C91000C1
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:06:53 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 5 Mar 2023 08:06:51 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] meson: upgrade 1.0.0 -> 1.0.1
Date: Sun, 5 Mar 2023 16:06:38 +0800
Message-ID: <1678003602-30550-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 08:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178033

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/meson/{meson_1.0.0.bb => meson_1.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_1.0.0.bb => meson_1.0.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_1.0.0.bb b/meta/recipes-devtools/meson/meson_1.0.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.0.0.bb
rename to meta/recipes-devtools/meson/meson_1.0.1.bb
index 578dfb9d64..ce12a3126b 100644
--- a/meta/recipes-devtools/meson/meson_1.0.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.0.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
            "
-SRC_URI[sha256sum] = "aa50a4ba4557c25e7d48446abfde857957dcdf58385fffbe670ba0e8efacce05"
+SRC_URI[sha256sum] = "d926b730de6f518728cc7c57bc5e701667bae0c3522f9e369427b2cc7839d3c1"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.34.1


