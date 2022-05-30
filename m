Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2ABC43217
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 06:23:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.33558.1653891808417185997
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 23:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ay+IY90F;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653891806; i=@fujitsu.com;
	bh=rLlqDJutiVcm7dPkv/kEuN61BF59QHs69gDa4vAgocM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ay+IY90F0LT254dNmP/XcmAS9HxeeOIrf5tVkDxd73I7jdbnrdZQS9iIBNBpnxFdA
	 qQ0SocfxA5o6fAPIQ9/pvz663MA4hUKkpBnV+f1KkSpoSxF9gHSm6U2V/Nwzn5BL0A
	 fPWK56eRKGVmgl20UAk6hfnwtFZqgCsFjExYhT+l101D8opOQKddDoeYYmlNvFd22N
	 cMvUpckVJKrDuodrf+cXX0+HfH8o66kvmYBevW7PS+pyKgvzFAMZQ39mPy8x43b0x5
	 X+k+8Ckhq+3ncGTJQuGtgWHEkh+DpNmAUPyAtYsbklSrfgDjGL90nHDPseh2AI2goc
	 0XgLRsioEebVQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqHsvaUq
  SwblZfBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aRafMYC3o4Kvb072ZqYFzH3sXIxSEk8JhR
  Yu3J01DOeSaJxff2MkM4exgl/k27wtbFyMnBJqAmMf3WDdYuRg4OEQE9iav/REHCzAIqEi9+9
  7CD2MIC7hJfLkwDK2cRUJXoXD0BzOYVcJKYdmYvE4gtIaAgMeXhe2aIuKDEyZlPWCDmSEgcfP
  GCGaJGUWL25WYWCLtCYsaMbWwQtprE1XObmCcw8s9C0j4LSfsCRqZVjNZJRZnpGSW5iZk5uoY
  GBrqGhqa6xia6RoYWeolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkpenmpJZsYgWGZUqx0
  awfjhlU/9Q4xSnIwKYnynlWdnCTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtczfkqSkGBRanpqR
  VpmDjBGYNISHDxKIrxLEoDSvMUFibnFmekQqVOMilLivOcTgRICIImM0jy4NlhcXmKUlRLmZW
  RgYBDiKUgtys0sQZV/xSjOwagkzHsHZApPZl4J3PRXQIuZgBZzM00EWVySiJCSamBa3sN71ve
  Xai7f/XeWhcw7Tn6IX2vJLcx8UuvSB61vdf9qH+y0fP3+7ckZ7A3Rfs/4NPfZ8L+2mreyIZ7x
  qEyNaNma/Ttvu+5jm/898bkcS9WOsPa89rZkjxzJy9Vm5+qa67uXa524/OZ8xKIDryu2pSzpa
  j1dt+bQgSWLz/RHB+06V3DHLLZ/QQQjk/PDVe3x2dOXfDR55OJ0pfji1Fy1o+X/QhZvT30jOm
  mxTzmDoJ1DVMh0uVtzAl5NOnXXlPGMjLKy+8YtU5Jj/qzed93R6Jxbp9VKr9i1uqE3cvYoWNt
  2v69r3fl5iWds7oPLEWKJoTesdtm9txE8rTOtT8oio1anuXivQO3/i0u2rd6lxFKckWioxVxU
  nAgAqgyb+EYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-565.messagelabs.com!1653891806!110813!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28379 invoked from network); 30 May 2022 06:23:26 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 06:23:26 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BF089100193
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:23:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A2B8A10018C
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:23:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 07:23:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.46.7 -> 6.46.9
Date: Mon, 30 May 2022 14:22:50 +0800
Message-ID: <1653891773-23292-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 06:23:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166259

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.46.7.bb => python3-hypothesis_6.46.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.46.7.bb => python3-hypothesis_6.46.9.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.46.7.bb b/meta/recipes-devtools/python/python3-hypothesis_6.46.9.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.46.7.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.46.9.bb
index 06bbe02f47..1a1defc583 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.46.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.46.9.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "967009fa561b3a3f8363a73d71923357271c37dc7fa27b30c2d21a1b6092b240"
+SRC_URI[sha256sum] = "8b1349dab58cf9bc85687e2721c008e99f23a32fb70e688779c81b0298904160"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.25.1


