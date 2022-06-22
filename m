Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F94CCA47A
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 07:38:20 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.4512.1655883498105659645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 00:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DqrvEzMI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655883496; i=@fujitsu.com;
	bh=ad9baMn5jE+WTdfY/ocCbgacUPuZPo9G3OlsE35iWNU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DqrvEzMIW+ehYwkZLBL/BpmWqnTUSSpp5SoUx+pOGWLyKPOCAUXHfgapZL2yfQqUG
	 m/FZUFvKQIn/faS5yymNMwL5T1DCE82HwH0N3B6z58ri9k7V/kR/98Gf6nEb0RA7qT
	 Q/obZhJw4aand2YUZOalBnXJmqDUrxdhNoGWfQwYNO2N1P3LTJI6RRSIMG3AukmHWE
	 Npb9XxwMcRUHy/tt1cuSGw2hKj3G2fYQIwecx9dSWRN2cXTWjCSn+HK0KcS5UIDSU/
	 EXNVkstys8Ev/cW7FyQA0twoQYzRvIDIhSW7+hgEJ5TXXErM6ZA9y9De88RMuZFp2V
	 cmJ+L51Xw+yIA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8MxSff5sU1
  JBu/WWljc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBlHZt9iKtjGXzF/X3QD4xneLkYuDiGBx4wS
  Tz/8YoRw7jBJXGh5wQzh7GGU2PKwl62LkZODTUBNYvqtG6xdjBwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUFnCT+npvDDGKzCKhKLGxZyQJi8wLFr/y9zARiSwgoSEx5+B6shlPAWeLg1Q6wGiGgmi
  233jJB1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJGbM2MYGYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWiVVJSZnlGSm5iZo2toYKBraGiqa6prZGSql1ilm6iXWqpbnlpcomuol1herJdaXKxX
  XJmbnJOil5dasokRGMIpxawPdzAu7vupd4hRkoNJSZRX8sCmJCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvM2HgXKCRanpqRVpmTnAeIJJS3DwKInwqh4CSvMWFyTmFmemQ6ROMVpyTJ39bz8zx3
  IwOfNr2wFmIZa8/LxUKXHerweBGgRAGjJK8+DGwWL+EqOslDAvIwMDgxBPQWpRbmYJqvwrRnE
  ORiVh3rtHgabwZOaVwG19BXQQE9BBT5ZvADmoJBEhJdXApOcVVi1nsFrr/7etuc3Bc9h99k4p
  yV7M2PAg8pRnkWCq8z651O/ebpf3iGYEBPy69Mr5xOWDRV8tbhdZvJtjKpfdM71K5MWbb6W2C
  95NmmORduB+uncUC09k7pnqwNPz+aTe3ny3b4O4+/mz25iPfb3LZ3xjgoajlsx/F6uaXsm6C0
  3nC09tzDHn07V69Gmu+gnzf2u/yfbEXSg5ttFd61tWZIzGiY+sO1Q43twovPLHzOC5Q5vuyY0
  ntx3fvJ2V4V6CgvOMrv5E0dKv7Izs+XN8XHVK7bXTBTIPhbY5btjSPFnav8SN55dywqGK32Xf
  Uqy/O01sfqVkbaC01X9JQfq3KLu0x0qs9jt25WsrsRRnJBpqMRcVJwIAtpT+2HQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1655883495!574451!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30016 invoked from network); 22 Jun 2022 07:38:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jun 2022 07:38:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7D16E1000C0
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:38:15 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 706F5100077
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:38:15 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 22 Jun 2022 08:38:13 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] alsa-ucm-conf: upgrade 1.2.7 -> 1.2.7.1
Date: Wed, 22 Jun 2022 15:37:48 +0800
Message-ID: <1655883470-22765-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655883470-22765-1-git-send-email-wangmy@fujitsu.com>
References: <1655883470-22765-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 07:38:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167214

Configuration
 - mt8195_demo: fix the HDMI device name
 - USB-Audio: ALC1220 - add support for Gigabyte TRX40 Aorus Pro WiFi Rev 1.2
 - ucm2: MediaTek: mt8195-demo: Add Initial support
 - ucm2: rk3399-gru-sound: Add missing symlink from conf.d tree
 - USB-Audio: Optimize regex for realtek-alc4080
 - USB-Audio: Add ALC4080 ID for Asus Z690-I Gaming Wifi
 - ucm2 profile for MOTU M4 interface
 - ucm2: Rockchip/max98090: add symlink to VEYRON-I2S
 - ucm2: Rockchip/max98090: add JackControl and PlaybackVolume
 - Added basic support for ALC4082 on ASUS ROG Maximus Z690 Hero.
 - ucm2: direct profile - allow to override the card name
 - ucm2 profile for Behringer Flow8
 - Steinberg UR44: fix the direction for steinberg_ur44_mono_in
 - Steinberg UR44: fix the Line2 channel mapping (2nd)
 - Steinberg UR44: fix the Line2 channel mapping

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../alsa/{alsa-ucm-conf_1.2.7.bb => alsa-ucm-conf_1.2.7.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.7.bb => alsa-ucm-conf_1.2.7.1.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.1.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.1.bb
index d60f22e7c7..79b8206592 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.7.1.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "b97f2395ca2c1fd9bfab7627f0178f9069868e2a42a35894dacd280e7e40680e"
+SRC_URI[sha256sum] = "ac5b2a1275783eff07e1cb34c36c6c5987742679a340037507c04a9dc1d22cac"
 # Something went wrong at upstream tarballing
 
 inherit allarch
-- 
2.25.1


