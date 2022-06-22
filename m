Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7F9C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 07:49:40 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.4874.1655884170787446390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 00:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=li1Gfi/w;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655884169; i=@fujitsu.com;
	bh=hsvVWnWAF6LXb8I5So1B5pwaebGKspUHGISMR3KOrbE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=li1Gfi/wjrLu+u4QMieGLlVf3fbRPXI/M5yD1cChaJ5N5GH8Qqm3F6e4YuBweZ/Xq
	 13iKWWuDLA1LSGXXi+if65TziiJO7eM8MRuBofxZfQyWYNCUstXb50vJ6jZQ2usVGo
	 uxX4UE7sPixplJIXPDvElhoeN1VMU2QcZv9W8+2O3pLnoPR9GkSvssuHre1hrqJwF4
	 nCXrRpl8QhLodgasES9aW3XeoGrQK67j067n9T3pe0BKXyETb1XnA3bYsh1n83iuxX
	 dGlp3958JZDHTl42sfmNvl87BJfAno7RjbwVyFvRJHYWuGvAKmLfoaU2rOV0QwBOHB
	 ISyo7gLcd9Esw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8MxSbfj5KY
  kg8k9mhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0ZT6ye2gpWcFR2/2lgbGPdydDFycQgJPGaU
  ODv3BAuEc4dJYmHDWyhnD6PE2vd3WbsYOTnYBNQkpt+6AWRzcIgI6Elc/ScKEmYWUJF48buHH
  cQWFrCR6N2wlw3EZhFQlZg45TcTiM0r4CSx+GQjWI2EgILElIfvmUFsTgFnicV394PZQkA1rU
  sfQNULSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzNjGBmGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVonVSUmZ5RkpuYmaNraGCga2hoqmtsoWtkaKSXWKWbqJdaqlueWlyiC+SWF+ulFhfrFVfm
  Juek6OWllmxiBIZxSrHalR2Me1b91DvEKMnBpCTKK3lgU5IQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd6440A5waLU9NSKtMwcYEzBpCU4eJREeG1PAKV5iwsSc4sz0yFSpxiNOdY2HNjLzDHza9
  sBZiGWvPy8VClx3q8HgUoFQEozSvPgBsFi/RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5
  ikIU8mXklcPteAZ3CBHTKk+UbQE4pSURISTUwxYtHaD9Xl/hq/XlC3CT2/zHP7rp2Xg3mlpQ6
  cPzutOK9rbx/PF+28Kkc1Xb/U894Yx3j7ZhF8+91ndpY+VB67vwHrmtu7fWTjbeYf2oTw30xI
  dtGnic/bzjHxXkveVsvLrrxZSfLxPdZqXP/3y4/l934VjrdcUGyWLjd+ludq4y4WBleLX7cfS
  7UJmKbe31mxK31BR7s4j2v2xxmWx65nZ4kymTxa6Gu6sSD+5v+66kflEoTt8lPqPA5s+LMyVf
  ffqxxuKZWk3A0r8nM7M8fk3bFK/63/9UrMxg6z9awsnumOyeQMd5O56K40kG1eOtq3/9X791I
  y3mltetWNePmCe9fvi1YeVTig2ki7/vDSizFGYmGWsxFxYkAA7oZa3ADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1655884168!672306!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31990 invoked from network); 22 Jun 2022 07:49:28 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jun 2022 07:49:28 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 557171000C1
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:49:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 48B66100077
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:49:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 22 Jun 2022 08:49:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xcb-proto: upgrade 1.15 -> 1.15.2
Date: Wed, 22 Jun 2022 15:48:50 +0800
Message-ID: <1655884130-22843-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655884130-22843-1-git-send-email-wangmy@fujitsu.com>
References: <1655884130-22843-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 07:49:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167221

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-proto/{xcb-proto_1.15.bb => xcb-proto_1.15.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.15.bb => xcb-proto_1.15.2.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
index f050ed366c..08c7f5bd6b 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
 SRC_URI = "https://xorg.freedesktop.org/archive/individual/proto/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d34c3b264e8365d16fa9db49179cfa3e9952baaf9275badda0f413966b65955f"
+SRC_URI[sha256sum] = "7072beb1f680a2fe3f9e535b797c146d22528990c72f63ddb49d2f350a3653ed"
 
 inherit autotools pkgconfig python3native
 
-- 
2.25.1


