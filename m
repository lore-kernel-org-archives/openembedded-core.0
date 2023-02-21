Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B0AC64EC4
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 10:19:26 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.38671.1676974759774555695
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 02:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ngf2fY+i;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676974757; i=@fujitsu.com;
	bh=2m8bV9WB9GBe+XWXgbZXVX6gWP0uH0cK5sb1PtWv5bc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ngf2fY+ii6OoWR2kIYgQBOFbD2/ftWAiF0naK17MZ082M7M3CMc34Qm3NpNbGk0CA
	 hPBmmlF9VB0ZfEhUARwctvncuCGvd6uCyxM+zHUQmJTVrDu04ORDQSdfPpZjUMo/KM
	 TvO/A0PDoLOFXNJSCbwXqd//t9+B+8MmrD+RM6/vqBXhSmPa7M453sB3RkacktAkqj
	 rNVytkJ8XmcIhCj/gDRRn3Xb3DZKqwFc8X7Y4dW5DKyc0F384uigbseEQ+6S5FZ7Xj
	 fvL64nUc3UONsddTDuwbDtbD/y8hucDdGitmxTGlIZoT/e36HpbpXTvRiYwSKJR1lJ
	 MW1/2XqW2814Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSXfprC/
  JBrOu81nc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBnL/xxiL2jlrFjdvpixgbGXo4uRi0NI4DGj
  xNfmn4wQznUmia3PD7BAOHsZJRr+fmbvYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vASoQFrCV+tu5lBLFZBFQlfj37wQRi8wo4Sczb2QIWlxBQkJjy8D0zyBhOAWeJuU2xIGEhoJ
  JXl5ayQZQLSpyc+YQFYryExMEXL5ghWhUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQtTi0qSy3SNdJLKspMzyjJTczM0Uus0k3USy3VLU8tLgHKJJYX66UWF+sVV+Ym56To
  5aWWbGIEBm5KsWr/Dsa1vX/1DjFKcjApifJ+O/U5WYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr
  9/0L8lCgkWp6akVaZk5wCiCSUtw8CiJ8NZ1AaV5iwsSc4sz0yFSpxgVpcR5J80ASgiAJDJK8+
  DaYJF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwbwXIFJ7MvBK46a+AFjMBLXb/8QFkcUk
  iQkqqgSmXh3P3zPyN4Rx/l82QiRc5+2Xalx+6c7wVqsSlFdpe7c9V35Vy99iq1T8jQ3i+c4ks
  PRH52MxSw4vV8/udKRpvb5UWBh/61W/R3XXbVsr1tcD1PZ3ptXG7XFe88pHZ1CCfMbEjItQ80
  Y3JY193/Yvbky6fnnDv7QHjDxvdo6NvlP7NOfjMdd7s65EthlFGlq7Mlutf3TmqduHuUpukhu
  kRh2Ue/t40SeHt5y//OngYnKb/lo6/dFKhRvCptdkJiaSNq0qyg/zjp5wzn9muUlBltPDYXwW
  VdY/OaGfsjW8SVwvt+3XLu4D3krO+pOeRNY433ulnL3+X+K/b+OjF3VK695ffnSooo2rb02e5
  VlGJpTgj0VCLuag4EQCgemmOVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1676974757!85538!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27800 invoked from network); 21 Feb 2023 10:19:17 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Feb 2023 10:19:17 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id EA2821000E9
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:16 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DE13B1000E7
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 21 Feb 2023 10:19:15 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 7.0.0 -> 7.0.1
Date: Tue, 21 Feb 2023 18:18:54 +0800
Message-ID: <1676974737-24910-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676974737-24910-1-git-send-email-wangmy@fujitsu.com>
References: <1676974737-24910-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177483

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../harfbuzz/{harfbuzz_7.0.0.bb => harfbuzz_7.0.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_7.0.0.bb => harfbuzz_7.0.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_7.0.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb
index a85c4ca1ce..55421ebcbe 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7b4685b7066c5c6b8dc6cd7b02f63c554fb8cc1c4ddcfc44bc284efa3c20cf28"
+SRC_URI[sha256sum] = "2cf4d3d8f225007511990a36a34195f0d6562ca56df0a8b0885b382837948199"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 
-- 
2.34.1


