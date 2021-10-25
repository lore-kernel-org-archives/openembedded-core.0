Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7730CC4332F
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:29:12 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web11.32854.1635172151517921236
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nIsdpAyr;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635172149; i=@fujitsu.com;
	bh=DhtA3wloT6NciwVnfItoTnbLp55qoZOcFlUH2gRjGAc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=nIsdpAyrHQQvuFQ2ZJRuw65MK4tocoSdXWHc2tBbOqKvOwugTjv22mbfkn0AnOKHx
	 P05xpH6gwMtwP6b5mkAdELh8EtDr+HWR4pw8+fpftGX0WZXNm2dkbBgw6j3AIWxjfd
	 7L2ZiTi2c4SzC58p4TqW4wsQwcQbwiicwDyMiRrbTIVAl9NyoD37wEMzdazwjieHhJ
	 8yRYCB+u2Lfpjj757lXBqtip38klDdJPa6W80sWyS5cS13FFx1Aq/Yh6EDCEG9PDIu
	 w+O2uQoR0omqwNI9JO/GTlGJyqAOA7ns6WwkYCI3fuxnfs/hpx125aHEfyRgH3mxq9
	 CokpdhtRWSsGA==
Received: from [100.113.3.95] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 4E/05-15394-53FB6716;
 Mon, 25 Oct 2021 14:29:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxRdd0f1m
  iwcy33BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8afXQ9YCm5yVBy/sZe9gfErexcjF4eQwCwm
  ies9/SwQzglGiQstB1m7GDk52ATUJKbfugFkc3CICOhJXP0nChJmFlCRePG7hx3EFhawkDjxc
  gULiM0ioCpx/MoysFZeASeJYyt3M4PYEgIKElMevmeGiAtKnJz5hAVijoTEwRcvoGoUJWZfbm
  aBsCskZs1qY5rAyDsLScssJC0LGJlWMVokFWWmZ5TkJmbm6BoaGOgaGhrrGumaGuolVukm6qW
  W6ian5pUUJQIl9RLLi/WKK3OTc1L08lJLNjECwyulkMl4B+O11x/0DjFKcjApifKemV+WKMSX
  lJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd9teoJxgUWp6akVaZg4w1GHSEhw8SiK8p/YApXmLCxJzi
  zPTIVKnGBWlxHk99gElBEASGaV5cG2w+LrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZhXGm
  QKT2ZeCdz0V0CLmYAW++mWgCwuSURISTUwbeN5qzvjT3AC8001M/fjnWv/PThrvTlGe9ueTZ9
  e3udU6hNZdmr5vLNeKdXWn6eFCM/4+fP1fDmpUNs/9Q1h7/T3PbjIfOGKbTZjZ02X5MkfGq8L
  L/d9YV/9Lzv5j/hZl3+trb2sp/48KZPinbLo6lTGWY/n773gtSZNY3nAlT9JE7Jet13VORKib
  iBeaXmg3v7klJDanVVPxadJvFko8LRx/eu7Un+mbd61825z3PMT74SkDCssYmwSf3/dJRzuum
  rBA9m3pf5zBcvzjW6eu2Bx/CdfcLvS5ZAJq0piJjfXcHoUykxqXLyJSY/9jnFTUv2q7OzGY8I
  S6uvWT9+WnlARu9L8UO8f+WkzPihvXafEUpyRaKjFXFScCACR5m2BKgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-226.messagelabs.com!1635172148!9656!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15755 invoked from network); 25 Oct 2021 14:29:09 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-18.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Oct 2021 14:29:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19PET3xD015100
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:29:08 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 25 Oct 2021 15:29:01 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] vte: upgrade 0.64.2 -> 0.66.0
Date: Mon, 25 Oct 2021 22:28:50 +0800
Message-ID: <1635172130-18376-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 14:29:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157348

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/vte/{vte_0.64.2.bb => vte_0.66.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.64.2.bb => vte_0.66.0.bb} (95%)

diff --git a/meta/recipes-support/vte/vte_0.64.2.bb b/meta/recipes-support/vte/vte_0.66.0.bb
similarity index 95%
rename from meta/recipes-support/vte/vte_0.64.2.bb
rename to meta/recipes-support/vte/vte_0.66.0.bb
index a79f2e4451..3b9c359507 100644
--- a/meta/recipes-support/vte/vte_0.64.2.bb
+++ b/meta/recipes-support/vte/vte_0.66.0.bb
@@ -20,7 +20,7 @@ inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-intros
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "2b3c820b65a667c1d8859ba20478be626d1519cc3159dac25f703330c6d07e18"
+SRC_URI[archive.sha256sum] = "d0813ac00fb1d74d88851e765f755d496c83e097097358ea1baadb38b37b7b33"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.25.1


