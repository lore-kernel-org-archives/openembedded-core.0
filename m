Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E94FC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:33:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.37584.1670830432063227409
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZTnGGRO2;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830430; i=@fujitsu.com;
	bh=kDj6XTIk2N/wYY6Xgp6QglH0JSPJrFZyUvzOmJp1UTc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZTnGGRO2lVUrnrj3MYourkuFkPWe/NesbS8DBpn1b+l3X2FT5MJ5HqSFEhcEowPWH
	 /5ZKQ4W0OsAk/gDrEOOx22n4gaEWif2fQS/hccvV5z41m9xQGgwWzuwdHuKeoeepb+
	 I2AhnjdTV00vYV0/cQxG+o/9BSXmjL8fIWPsMSCbw3l9ogj26IJZmppFa6/yie2V44
	 xaePWjgI/69CMviIvgZnfMZLbIPKnhIGWFvRN6giTVQ5pNa0SBLaqjvh+2mZzTdLiP
	 IofUguaG0yyhulgqnGL0bAUypm+6Us0jvXBJlV/1w3OJqEqi+IEXQ+Fh+XuOdgKIA+
	 TLFHWB6FZIHSQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8MxSTf25rR
  kg//zLSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyf+9YyFczkqNjz+SxjA+Mm9i5GLg4hgceM
  Etum/AZyOIGca0wS85tTIBJ7GCXW3ToLlmATkJK4cf8/WxcjB4eIgJ7E1X+iIGFmARWJF797w
  EqEBSwlemcvA7NZBFQlOo4sZgWxeQUcJRatfMAMYksIKEhMefgezOYUcJKY8W4CM8hIIaCaac
  /NIcoFJU7OfMICMV5C4uCLF1CtihKzLzezQNgVErNmtTFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMZoWpxaVpRbpmuolFWWmZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek6OWl
  lmxiBIZtSrFS3w7GrmV/9A4xSnIwKYnyVl6ZlizEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgnfDN
  aCcYFFqempFWmYOMIZg0hIcPEoivG4grbzFBYm5xZnpEKlTjPYcaxsO7GXmmDr7335mjuVgcu
  bXtgPMQix5+XmpUuK8E64DtQmAtGWU5sENhcX8JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjEr
  CvDYgU3gy80rgdr8COosJ6Kyol1NBzipJREhJNTDl7t99oV/b4qiC5gq2GWdLLtj6z4iovatY
  0vnS4dw1XXOF+/Yr7Xf2m7VLL7eaZTrfPWK576QshZkfz8uu88yYcszxyOLo4DK/dv8PFx4eu
  2F4pVnS36FhtXbW1cx631NCPFKuq0Kt9vIdzppR9uLNtsLPG4s8WvvUPtaee7Xw8nSjLt1H9q
  lTF2RE7ec54a1hqXfkuYebX4Xgzmaz6yce5r1z9NbcGPcuXEBBJjj83ycvVkbDpWmbQl8WXN+
  zq01oy/G1rB2PZtWf3/m1/6bcrc9fOTWPSrftMXR8/4Jv5qP1d5pspn44xnVr3aPLKhETPBbL
  JL6oXXRpmbfHGtGah1lX+FsvpM5d2jHjtNt+JZbijERDLeai4kQAiooX7HQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1670830429!284037!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5128 invoked from network); 12 Dec 2022 07:33:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:33:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9F3031000D2
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:33:49 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 929EE1000C1
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:33:49 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:33:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xrandr: upgrade 1.5.1 -> 1.5.2
Date: Mon, 12 Dec 2022 15:33:18 +0800
Message-ID: <1670830398-2960-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830398-2960-1-git-send-email-wangmy@fujitsu.com>
References: <1670830398-2960-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174487

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xrandr_1.5.1.bb => xrandr_1.5.2.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.5.1.bb => xrandr_1.5.2.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb b/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb
rename to meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb
index 0e0347f768..1e29031849 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb
@@ -12,7 +12,6 @@ DEPENDS += "libxrandr libxrender"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[md5sum] = "fe40f7a4fd39dd3a02248d3e0b1972e4"
-SRC_URI[sha256sum] = "7bc76daf9d72f8aff885efad04ce06b90488a1a169d118dea8a2b661832e8762"
+SRC_URI[sha256sum] = "c8bee4790d9058bacc4b6246456c58021db58a87ddda1a9d0139bf5f18f1f240"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


