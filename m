Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD79C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:30:17 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.36736.1656675015407328083
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eZLRsHmY;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656675013; i=@fujitsu.com;
	bh=kBhSiFdfWk9BgePhCgUQPoPz9z8bSQGuIgKWOqLQB9E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eZLRsHmY7qGB4ynqoj7/5XEmGOHKIui8prpAs6plXblL/Z3PWvbqwuAcDDM1xWJoq
	 O/x4nrwKIHaW7HV1aZwUlSL5MsSPFyJV80Pe7OAd5J4ePGv8fL+MUwXCVTijIB+ezp
	 gk/jRX0hySSuZuY2gzxzn8cRMiIYJh9zybobiIraWCb1xMgm6euC9E47075Ce5scPD
	 x+SOOV6N1GSy7uXRz8/vqBI5URL4Hj3d6wObFN8/pLAc5iu8qE9RCuemdv6se4sGA0
	 HcvystshGUnlPdPGx1X33+dyTTNL6iX3XkXdlOotpMYYou8pmLhvkqKpk41GKf0GTM
	 cTJDVtkGkhmrw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8OxWfforX1
  JBj3HlS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oy7sx+xFrzmrLjXvIm1gXEaZxcjF4eQwANG
  iR+H/rJBOJeZJCZ1rGSHcHYzSmybcYKli5GTg01ATWL6rRusXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBXwlLtzqYQEpYQGKz5jIAxLmFXCSOLFqKhOILSGgIDHl4XtmEJtTwFni4Z7JzCDlQk
  A13WugygUlTs58wgIxXULi4IsXzBCtihKzLzezQNgVEjNmbGODsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYrROKspMzyjJTczM0TU0MNA1NDTVNTbSNTQy00us0k3USy3VLU8tLtE10kssL9ZLLS7W
  K67MTc5J0ctLLdnECAzhlGKFuh2M11b+1DvEKMnBpCTKe/XaviQhvqT8lMqMxOKM+KLSnNTiQ
  4wyHBxKErx5N4FygkWp6akVaZk5wHiCSUtw8CiJ8PaDpHmLCxJzizPTIVKnGHU5Zn5tO8AsxJ
  KXn5cqJc779zRQkQBIUUZpHtwIWGxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMu+k60BS
  ezLwSuE2vgI5gAjpi57Q9IEeUJCKkpBqYlmY1+s8+8CI1oVkvhJ17/xntA901lR4bfp7fpXZ5
  T/vCV9u+57fkrxWp1bvGnLs5suvYnOzFeztZWVRd/CSsHKVZc3YsjZ//hH1zzMGF13vqnQP3K
  H7IXPix8/HFs+x/IgpbuM+eD5v4/rNmQ/3byKq8MG2ldRve3s0xCjtq/fpIzsafb2Rs036cv/
  nXLFnqYtY0i5Ivt6f87PSzSdlwIsVjheHl1Qd+CB4Ivj5Z5dnzPftWVFpFvJlgNJn5/f4mn/y
  HmT3GHdIiew9W5znHSx6o5im+9Op6pPdMp+jLjYcUIr69X30xONj/5NkNwZvuauVEdyzMq67Y
  ZDmtnmtS9xNWQyG16toFxbFl72e+VmIpzkg01GIuKk4EACDdMpdoAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-565.messagelabs.com!1656675013!20421!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13393 invoked from network); 1 Jul 2022 11:30:13 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 11:30:13 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 4315D151
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:30:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 3673114E
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:30:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 12:30:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/11] gstreamer1.0-vaapi: upgrade 1.20.2 -> 1.20.3
Date: Fri, 1 Jul 2022 19:29:49 +0800
Message-ID: <1656674989-20458-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656674989-20458-1-git-send-email-wangmy@fujitsu.com>
References: <1656674989-20458-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 11:30:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167464

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...streamer1.0-vaapi_1.20.2.bb => gstreamer1.0-vaapi_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.2.bb => gstreamer1.0-vaapi_1.20.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb
index 40dc21cf45..6e580f9f79 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "30126ab6e3105dab8da76bd9951a68886149bcd70c7fee0bac68de564de41d3d"
+SRC_URI[sha256sum] = "6ee99eb316abdde9ad37002915bd8c3867918f6fdc74b7cf2ac4c1ae0d690b45"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.25.1


