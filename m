Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D6CC433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:22:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.4933.1665476536633418722
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lDf0Umh5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665476535; i=@fujitsu.com;
	bh=l3AA7qQBNRn0e4EoXj4eU0UEvjKmN6lKnT/lw8oi+iU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lDf0Umh5Am8TOJeZ78t/JxrGJxelnnvnTCsY0WCsZeWxXwfu0n2x4OPucIqxBotm6
	 vWBaszKLFTAR74a6BfqH8bLZPGjj+i/ykj6H2omBg/y2MUikGuj0oHlONO7FK/o0/D
	 IR8r/PeNM5jKC44KSHpUwmGM32X3sL4e7UQgkgMt4O2nyM8bSkXj/qU3gDvqoeAkpH
	 QeZARfbPfPcJY32IarzmOqfOfRjWOqb7WDAp54kjL2U0wsrEWdXYkwFsMop8VBHqD8
	 L2VFij2ElYS5A26b0wk9lcaDN4/VhSZPNm3L1LL9lBrRFy2uCXcx+rwi69Oq6f1B3L
	 iIBE7mmPvN1dw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8OxWXebumu
  ywbXPGhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8alqRPYClZzVFy//Zu9gfEQexcjJ4eQwH1G
  ib+3oroYuYDsy0wSr3ddYoFw9jBKdD3sZQWpYhNQk5h+6waQzcEhIqAncfWfKEiYWUBF4sXvH
  rBBwgKWEuu2XwezWQRUJe4cnMEEUs4r4CRxeFMmSFhCQEFiysP3zCBhTgFniYalgRAnOEmsO7
  uBDcTmFRCUODnzCQvEdAmJgy9eMEO0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWiVVJSZnlGSm5iZo2toYKBraGiqa2ypa2qkl1ilm6iXWqpbnlpcogvklhfrpRYX6xVX
  5ibnpOjlpZZsYgSGb0qxuskOxu6VP/UOMUpyMCmJ8l597pIsxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYL3haprspBgUWp6akVaZg4wlmDSEhw8SiK8S1WA0rzFBYm5xZnpEKlTjLocM7+2HWAWYs
  nLz0uVEudtUwMqEgApyijNgxsBi+tLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5V4BM4cn
  MK4Hb9AroCCagI05edQI5oiQRISXVwMT8RehpyurZOhb9f5SzRH/KPt++serT0sZQhVn13WfP
  aby/V+kT8tbs74Nn9/4G5nYXyfgUaUvvyH+za5MLu3pIdoKNVdzrhc7cr6z2MNybeZXPM6r7R
  VvK9Om+S8p61U+VWKtdWf73iX9F4f/i01XmCxpuz36f65z9fpbgkR1H1wkK3JpQdXTOt0vHws
  87agd2TPYJ/hldaaP9s0/iRLVy8DmmNR1fZgZwLP1me3dGZIjuu4YEabVbz7Zv5ln96bz6kUi
  9r+b1KY8UmFicn+5bEPvVcl1UGKvu5117WO+9X1vuG3gjzrTO8e3OJwdSeKQer5hRPku0Wb3p
  c3rjmWtrHSxMhV1r755ecdr/qIYSS3FGoqEWc1FxIgCNCYi/ZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-565.messagelabs.com!1665476534!186276!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1484 invoked from network); 11 Oct 2022 08:22:14 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:22:14 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 614E373
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:22:14 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 52C22152
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:22:14 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:22:12 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] repo: upgrade 2.29.2 -> 2.29.3
Date: Tue, 11 Oct 2022 16:21:47 +0800
Message-ID: <1665476508-16543-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665476508-16543-1-git-send-email-wangmy@fujitsu.com>
References: <1665476508-16543-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:22:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171609

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.29.2.bb => repo_2.29.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.29.2.bb => repo_2.29.3.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.29.2.bb b/meta/recipes-devtools/repo/repo_2.29.3.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.29.2.bb
rename to meta/recipes-devtools/repo/repo_2.29.3.bb
index 42fd18ac24..66b632c29d 100644
--- a/meta/recipes-devtools/repo/repo_2.29.2.bb
+++ b/meta/recipes-devtools/repo/repo_2.29.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "891e8f72ce3551a19c377456574bbfbeac5c8b8e"
+SRCREV = "acc4c857a0b6e2e33e3647028cbd312498fd5900"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.25.1


