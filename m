Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F8CCCA473
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 08:20:24 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.2134.1655281218023223506
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 01:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WBjlx7qS;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655281216; i=@fujitsu.com;
	bh=2ubKEZ7NMm714lO2yC66pHPjeazwWJ7SzR538yyCRgA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WBjlx7qSRgMjUdgjdvHJkilxL3UT86F6Ov/NYR4L/KF1Gp7JCp6cTwPXUsUWYBSL8
	 HpzF95zmPWzqQjZy6SwO3AcPUr4Vbqlwpi0A2SQtP8iZSdjlEjalfP0htxGmadWdh7
	 /1zLkfnqtW9JGIvzcrJ3LXzfSmHF2cHg2OzT+cSCW7BW8fri0UUTmqwYYJYH1CZmcW
	 Tqj1vS+SPrU35qkk0+P7mG5HpPWcCkkCmGK8jfwTD6lyEYND4zu84P7jPDG7i4gDa2
	 N8uggDNp7xJMdrgU7YTkKWiibiHzjSFZIAJqPpWCjG9iX+Fg5PiI/Qtu9lVEzN7XvD
	 fUZwr8FY/nwrg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSdd+2so
  kg72rVS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oznDTuZCu5wVPx/9YupgfEvexcjF4eQwGNG
  iSXb77JBOOeZJJZ2v2WGcPYwSrReWg/kcHKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCApcTUWdMZQUpYBFQl5t7wAQnzCjhKfNy8FWyKhICCxJSH75kh4oISJ2c+YYEYIyFx8M
  ULqBpFidmXm1kg7AqJGTO2sUHYahJXz21insDIPwtJ+ywk7QsYmVYx2iQVZaZnlOQmZuboGho
  Y6BoamupaWgIpS73EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzknBS9vNSSTYzAsEwpTi7f
  wbh93y+9Q4ySHExKorzKk1cmCfEl5adUZiQWZ8QXleakFh9ilOHgUJLgdZ0ElBMsSk1PrUjLz
  AHGCExagoNHSYQ3cSpQmre4IDG3ODMdInWKUVFKnDemEyghAJLIKM2Da4PF5SVGWSlhXkYGBg
  YhnoLUotzMElT5V4ziHIxKwrwrQMbzZOaVwE1/BbSYCWhx474VIItLEhFSUg1MRv2LA6+YLTR
  4/Saae8WZZMMMw8hJL7kyjwhsvrnu6GrhOr3t1cEScr6fHvUGsKclyymaPTtVbfpVdvo5Juud
  EZPvsjEfEaitWCv8/Ofn58pPSg6lLnk1gX/jNO0U950NGy4Lx0QWXF2b97zr/4zIGWv+W35eJ
  X2oNDHdnnPTJa2712N/SD7wyA2pixI5/M7K/UzV/Zpt8XWrDlSFdzzOOrZOceGn7l/2jxX4dJ
  lvpS7iF63nLZ75WvuwmV1ryzz3FWzhhTt92lbHz7I9M3vB0k2XNB6ETpj2+sneG1bz9obN5pm
  sGGbT+u3n/Hyz4JPlq2Zd/3/4xyftH/ZTnpre4tg7zetg9ZQvBmu6JWvWlCixFGckGmoxFxUn
  AgDR4K/9RgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1655281215!162020!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3239 invoked from network); 15 Jun 2022 08:20:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jun 2022 08:20:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DA80B1000E9
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:20:14 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B51601000C2
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:20:14 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 15 Jun 2022 09:20:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sudo: upgrade 1.9.10 -> 1.9.11
Date: Wed, 15 Jun 2022 16:19:50 +0800
Message-ID: <1655281192-6663-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 08:20:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166920

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/sudo/{sudo_1.9.10.bb => sudo_1.9.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.10.bb => sudo_1.9.11.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.10.bb b/meta/recipes-extended/sudo/sudo_1.9.11.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.10.bb
rename to meta/recipes-extended/sudo/sudo_1.9.11.bb
index aa0d814ed7..5e97d8a2cc 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.10.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.11.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "44a1461098e7c7b8e6ac597499c24fb2e43748c0c139a8b4944e57d1349a64f4"
+SRC_URI[sha256sum] = "b5476e30d83ca14734da9370f2206beb21c8a33fc85a504fb8a61d18d8b351be"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.25.1


