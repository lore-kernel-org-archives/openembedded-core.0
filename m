Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A249ECCA47A
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 07:38:30 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.4555.1655883502962087578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 00:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KcS6fMBP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655883501; i=@fujitsu.com;
	bh=eAXoUf5R9772TW9mHFTIBkDwz9h8jJE02+H4pNqQqk0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KcS6fMBPsGifJVCwxE6UIIYRG4DDw61Qp9XxCm2AZRfGvY5PST9LsAxAS47ybCoRg
	 mFYiDA5b3yj7Y7/wcmuwh8QrBXsGj7Exz9b+O5nKJ9oidruL3Ho9nJB94EW32q+SMS
	 m2QMzYN+934KHYssLCwTf3hTJQrECXqD4VhyQY/sjlDoKl1nJWr1eCNczF1NaN3CZr
	 jMmhUzO5s8y8LiUu4JviySrCkmpUjxySL8fxDZ0OboPXHUPJAKC88PWIDIJYAiOxyf
	 iHEMban7bclYCgavAzlv3eO5B2+7WJVw0hfLLRZZj6br88oQc8NaxoWujIthLWqhQx
	 jDgXg1drOH95g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8ORpPvm2KY
  kg/PPDC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oynzW9YCl5zVEx99ZClgfE6excjF4eQwANG
  ielLWli6GDmBnBtMEm3veSASexglbnc8YgZJsAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgJnEq/V7mEBKWARUJU7MkwQJ8wo4SdxcexSsREJAQWLKw/dgEzkFnCUOXu2AWuskse
  XWWyaIekGJkzOfsECMl5A4+OIFM0SvosTsy80sEHaFxIwZ29ggbDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGG2SijLTM0pyEzNzdA0NDHQNDU11Lc10DY0N9RKrdBP1Ukt18/KLSjJ0gfzyYr3U4mK9
  4src5JwUvbzUkk2MwCBOKU5o3sF4b98vvUOMkhxMSqK8kgc2JQnxJeWnVGYkFmfEF5XmpBYfY
  pTh4FCS4G0+DJQTLEpNT61Iy8wBRhRMWoKDR0mEV/UQUJq3uCAxtzgzHSJ1itGSY+rsf/uZOZ
  aDyZlf2w4wC7Hk5eelSonzfj0I1CAA0pBRmgc3Dhb1lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYp
  zMCoJ8949CjSFJzOvBG7rK6CDmIAOerJ8A8hBJYkIKakGps0PYwS7PJ6oRKlJG99jXTPlm9/t
  /uVWrlkfvxXeZfxR9dZu4ZOwk4oeG7V9I/99+FajeN1bLqFil8H0d1U/1p88IrnCQtW7bFtXy
  ooCBfHNmzwzj7V1CW58+nCe8wQ+jy9695W2LlMJZfy7SnKCuuWN79EmHz9/N3evv1HadCx/w2
  mHXQeubNq/8Osxv53BK/a8T5m27r/73cWhCT1L5P9ukg756Hzq+Nft2XXaxySmTVzP3GQTzDu
  tOCJfpM7F4sp6b7bMPYo6S3S533raTfXLZLpSYr1Y/8qjfQnXJ8Qu2NGRNvvTkgbnmtRr8/q2
  dViEfzpw8PbznCXmZSK//bT6HSY2BK/fv+f3NQcrA3YlluKMREMt5qLiRACMCyGudQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-728.messagelabs.com!1655883500!425400!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25353 invoked from network); 22 Jun 2022 07:38:20 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jun 2022 07:38:20 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 395371AC
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:38:20 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2DA617C
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:38:20 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 22 Jun 2022 08:38:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kbd: upgrade 2.5.0 -> 2.5.1
Date: Wed, 22 Jun 2022 15:37:50 +0800
Message-ID: <1655883470-22765-5-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 07:38:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167216

Changelog:
==========
keymaps:
-------
    Fix pt-latin1 failing to load due to euro2 include.

tests:
--------
    The tests do not depend on the data in srcdir/data.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/kbd/{kbd_2.5.0.bb => kbd_2.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/kbd/{kbd_2.5.0.bb => kbd_2.5.1.bb} (94%)

diff --git a/meta/recipes-core/kbd/kbd_2.5.0.bb b/meta/recipes-core/kbd/kbd_2.5.1.bb
similarity index 94%
rename from meta/recipes-core/kbd/kbd_2.5.0.bb
rename to meta/recipes-core/kbd/kbd_2.5.1.bb
index c0317a5d84..aa3ab6e121 100644
--- a/meta/recipes-core/kbd/kbd_2.5.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
@@ -16,7 +16,7 @@ RCONFLICTS:${PN} = "console-tools"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "ad95964a4dede55f9239dd63b455fa4498cf3db3a0075ccd1d65a9f0e622a0fd"
+SRC_URI[sha256sum] = "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                   "
-- 
2.25.1


