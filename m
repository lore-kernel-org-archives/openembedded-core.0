Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973A0CCA473
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:28:04 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.31229.1654518476768899880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XLYXbRHW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518475; i=@fujitsu.com;
	bh=kjdo1XErcccWcL+05s6Np0jc888WlbTncbIoD/mFMAo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XLYXbRHWO30siEo+upHSS/FKn5ibCQcfnE7eY363CmUImGqcSU+twgFyT4/Yg9++2
	 mEcUAjKwGttrn/wofjJj93FNUJacyEuzaCsbzPvQ0oo5mqbCN4+Q51Ffh9a1dvk3FJ
	 +TJRjTvAsYFT23bBobeQQDwcHgH4lJUJ9r9VR6NnchzuozEMtmC0ubzdWJQjGxaBZj
	 DSeAZmcip81pKRHoBBjKeQ4C0Qs36JWQMYbUv1+Fs/4iOL1Tv41UpczJhF2D9pR/lj
	 zc9Ll4ZeMGPBTrRHVsZh7DEKRF1YzkCkNifWGqBvdrXpK8HAX+SOc7bteLaFKWPBLW
	 q4tBN0hIgOWww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRWlGSWpSXmKPExsViZ8ORqHvq09w
  kg7OvjCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyr6xazFkzlrFg4az5TA+Nuji5GLg4hgceM
  Ep3LrjBBOOeZJA7/b2WDcHYzSsy4uAXI4eRgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e
  9hBbGEBZ4n/3VfBSliA4hcPxYCYvAKOEpd/uINUSAgoSEx5+J4ZxOYUcJL4vA6kmhNok6NE06
  SrTCA2r4CgxMmZT1ggpktIHHzxghmiV1Fi9uVmFgi7QmLGjG1sELaaxNVzm5gnMArOQtI+C0n
  7AkamVYyWSUWZ6RkluYmZObqGBga6hoamusa6FmZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiB4ZtSzBy2g/FP70+9Q4ySHExKorz21+YmCfEl5adUZiQWZ8QXleakFh9il
  OHgUJLgrfsAlBMsSk1PrUjLzAHGEkxagoNHSYTX+h1Qmre4IDG3ODMdInWK0Z5jbcOBvcwcU2
  f/28/MsRxMzvzadoBZiCUvPy9VSpz3OMhUAZC2jNI8uKGw2L/EKCslzMvIwMAgxFOQWpSbWYI
  q/4pRnINRSZj3AcgUnsy8Erjdr4DOYgI6y+fBHJCzShIRUlINTJs73846edq0jGtZ0vPj7w5O
  mDflx+dNeyz9lv7j19/c91BAvO/JC6NVv6cevfbekk9ycfNrLjWhep4TrH2PJx0646soU8tee
  3CBvWOVANtSt/qgtCnulQctvJoMwpsvKQZ6fPaqX3vn+l3LzBRjg8vTGrt2c7cJqHoukM14du
  v1z1/9T2foqJz8wtlxpp2XwTW79bj9AZ7qpJtPlRv/Wgh+7117slzr7QkDq2K/S4fFliyfFOf
  kszhF+d9sBWMvv2s9VotViw7cNL32+3Cng5eGA8v92b38b+67ewu+3r62X2dp+e9PJfqLVnfk
  h9j3fjS/tk9WIHP3vPmVBpfvVn/sXWF2/Wpx6s6vXh+OGiixFGckGmoxFxUnAgBdLmH9eAMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1654518474!415551!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25692 invoked from network); 6 Jun 2022 12:27:54 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:27:54 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 57F0A100184
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:27:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3910A10018D
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:27:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:27:36 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xkeyboard-config: upgrade 2.35.1 -> 2.36
Date: Mon, 6 Jun 2022 20:27:14 +0800
Message-ID: <1654518434-9263-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654518434-9263-1-git-send-email-wangmy@fujitsu.com>
References: <1654518434-9263-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:28:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166624

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xkeyboard-config_2.35.1.bb => xkeyboard-config_2.36.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.35.1.bb => xkeyboard-config_2.36.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb
index 5215131e3e..9e6d17c780 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "18ce50ff0c74ae6093062bce1aeab3d363913ea35162fe271f8a0ce399de85cc"
+SRC_URI[sha256sum] = "1f1bb1292a161d520a3485d378609277d108cd07cde0327c16811ff54c3e1595"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.25.1


