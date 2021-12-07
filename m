Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE76C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:06:54 +0000 (UTC)
Received: from mail3.bemta32.sdw.messagelabs.com
 (mail3.bemta32.sdw.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.52767.1638803213749276165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:06:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=udgstopA;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638803212; i=@fujitsu.com;
	bh=Xnzd7OFOEfhaiJR9/DTyhbd7dPdYJcHB92kSFZwYMSU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=udgstopAdtfCW3ZJBVufho0zXaAr1EVMG7c4tSTGFd3//NZL/PY1aL8KniVSeqmxA
	 z6q++0f32LhkrrQFWmCQn+kZf1WqBHYAbXKGJ5XhvC0ceNWrBSLrUi4hRb1b55fZFR
	 Pj20YjtuaA5c4nNsmaHM/GEk9UF7lCuqsftbHlYpu91DmuJ+QK2zasDpG6oKxQXW3k
	 g0sDLCEqb/h2KbX7I73GmQsGGffHq2YSWEQMXGauUZiAo33ysOQ93ZOeS00DRih6AD
	 TEpLnjuQ972uCKSq82WKpqWsNo11Gm98sKk+tJFn+OXd75mnOwBe1P8xgnkt5zefGY
	 P+FvGEzkyqTkg==
Received: from [100.115.1.47] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id 5A/1C-28408-B072EA16;
 Mon, 06 Dec 2021 15:06:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8ORqMutvi7
  R4PdVDYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPd+xvMBdM4K/5uX8HewLiVo4uRi0NI4DGj
  xOnXU9ggnPNMEp0vT7BDOLsZJTbs/8HUxcjJwSagK3Hu8VqgBAeHiICexNV/oiBhYQFbiYs3z
  7KD2CwCKhLNh+6xgti8Au4Sh961MoPYEgIKElMevmeGiAtKnJz5hAXEZhaQkDj44gUzyEgJAU
  WJ2dPlIcorJF4fvgTVqiZx9dwm5gmMfLOQdM9C0r2AkWkVo1VSUWZ6RkluYmaOrqGBga6hoam
  uoa6RobleYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZg6KUUM97cwdja91Pv
  EKMkB5OSKK+H2LpEIb6k/JTKjMTijPii0pzU4kOMMhwcShK8+1WAcoJFqempFWmZOcA4gElLc
  PAoifBuUAJK8xYXJOYWZ6ZDpE4xKkqJ8x5VBUoIgCQySvPg2mCxd4lRVkqYl5GBgUGIpyC1KD
  ezBFX+FaM4B6OSMO8tkCk8mXklcNNfAS1mAloc078aZHFJIkJKqoHpsjp/v43Xk7V1YbL+9/h
  UdiUs8T2ouvXm39qQeG2b/0kcEZefsS945qq5Ic7h9GyLhUuMuy8oqEfyvH1n6/Xa2aGxtmbF
  P73v1y/mzEx2OGqU/HP9bJU6kRkfVuRx6esYn+ut+LssInrTkQ9LMnhr++docH7aWhv3i93/8
  ldh333exlejGbVyTvvo9R/qN53vn8e8LkjeiJdfyeJb7Q5PW577Zqc3XTnTrpBpdn23juEJ4Y
  6tQe5l8ziXR21usn4h9/zda/1a+6eCE763/7uw79rvt7Hnb82SSuiMT13io3pozoVPQh1Lol/
  tzXt+xFgxRkL03sLvQsubnl2LlkyzfCHmcH31uccztC3qTzsrsRRnJBpqMRcVJwIAOw5OODgD
  AAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1638803211!227483!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2598 invoked from network); 6 Dec 2021 15:06:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Dec 2021 15:06:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 34612100242
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:06:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 28E1010023C
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 15:06:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 6 Dec 2021 15:06:32 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] opkg-utils: upgrade 0.4.5 -> 0.5.0
Date: Tue, 7 Dec 2021 08:06:25 +0800
Message-ID: <1638835585-3872-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:06:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159236

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../opkg-utils/{opkg-utils_0.4.5.bb => opkg-utils_0.5.0.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.4.5.bb => opkg-utils_0.5.0.bb} (94%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
similarity index 94%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
index a2bcc7f661..21678a27b2 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.5.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb
@@ -12,8 +12,7 @@ SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV
            "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
-SRC_URI[md5sum] = "025b19744e5c7fc1c8380e17df1fcc64"
-SRC_URI[sha256sum] = "528635e674addea5c2b3a3268404ad04a952c4f410d17c3d754f5dd5529770c9"
+SRC_URI[sha256sum] = "55733c0f8ffde2bb4f9593cfd66a1f68e6a2f814e8e62f6fd78472911c818c32"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.25.1


