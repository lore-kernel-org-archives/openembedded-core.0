Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE821C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 08:20:43 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.2105.1655281239653424714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 01:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mfZ1BcjF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655281237; i=@fujitsu.com;
	bh=4yQxv9CmCs9xHngiduht/kTVJ/su42qtiJg/XBzB2hU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mfZ1BcjFYXkfrHKoIPRsutKTZKjeJlluNDQi3WiEEBuDqCC0BcMHMEHazoRrUsK9N
	 W0zNvTQEXUtgr2A2ZFaO31+IB23ycTMqRUv5zJhd/iv0K/UeY+XKHz5fezIMYy3+8D
	 41O5Bn0NaGx8E6CofgSObiYc7SAFUYIHdNqNTjYnhMncsy6xSdSPXXwhmr23afUCHR
	 rpE9JcbmV9iFzVx7JGe+u5tbHiQQvgpRMptNloGnyiKRh/+KWZ54ZkF2YM/wkt2lw6
	 qoz9uHo9Utt/VZ5JD8u1ruKmj/1rtrNlDLX8l8LziuVU7xWs0AtnXcMFeyGt3+Kk/8
	 oTV8fawj1ZFVA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8ORqBs6bWW
  SwcbrjBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bBC0eYClZwVFxu5mtgvMjexcjFISTwmFHi
  7Js2NgjnPJNE+5MTTBDOHkaJLSuXApVxcrAJqElMv3WDtYuRg0NEQE/i6j9RkDCzgIrEi989Y
  CXCAg4SU/bcYAGxWQRUJY4umsIKYvMKOEosut8AViMhoCAx5eF7ZhCbU8BJ4uPStWD1QkA1LX
  +7mSDqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSM2ZsY4Ow1SSuntvEPIFRcBaS9llI2hc
  wMq1itEoqykzPKMlNzMzRNTQw0DU0NNU11TUyMtVLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuu
  zE3OSdHLSy3ZxAgM4ZRi1oc7GBf3/dQ7xCjJwaQkyqs8eWWSEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQle10lAOcGi1PTUirTMHGA8waQlOHiURHgTpwKleYsLEnOLM9MhUqcYLTmmzv63n5ljOZ
  ic+bXtALMQS15+XqqUOG9MJ1CDAEhDRmke3DhYzF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsG
  oJMy7dQrQFJ7MvBK4ra+ADmICOqhx3wqQg0oSEVJSDUwxb+d9fHh35k1JJhNmNm8Pw/Oev77w
  iPuy711y3+PCRvuVyVdO3G98Hr4zdO0KIdWEpDO7KlVsJfWEzrZ9/u2x76vD35Yagb+xIZmLb
  ke4aQWIa8nYt78yFarVs1A97ZqovusCi6j3Olc7RS5GRnlRJqUNpWkW2zZdYJv4iuPg/Zluv9
  5KVN76J/hp2nflT0uFWQxnHz126pzhIU83VeY3j34kW2knWhbVFKp825E79/Mdo82folfH/7Q
  9XJ5/cnVkg5mngL9beUPsiVtb/3S6JOy8vLhXcvGDb0Yfit40a6cekexb18Lp1+W0/7uaZbZU
  oKS1MltClwan1NZUKRPvZW+2rRBjvxeSG2nHrMRSnJFoqMVcVJwIAOkH9iF0AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-587.messagelabs.com!1655281236!133217!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15969 invoked from network); 15 Jun 2022 08:20:37 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jun 2022 08:20:37 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 82B1210018F
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:20:36 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5D94F10018C
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:20:36 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 15 Jun 2022 09:20:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.14.01 -> 0.14.02
Date: Wed, 15 Jun 2022 16:19:52 +0800
Message-ID: <1655281192-6663-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655281192-6663-1-git-send-email-wangmy@fujitsu.com>
References: <1655281192-6663-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 08:20:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166921

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stress-ng/{stress-ng_0.14.01.bb => stress-ng_0.14.02.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.14.01.bb => stress-ng_0.14.02.bb} (93%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.14.01.bb b/meta/recipes-extended/stress-ng/stress-ng_0.14.02.bb
similarity index 93%
rename from meta/recipes-extended/stress-ng/stress-ng_0.14.01.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.14.02.bb
index cba15e947e..000a640917 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.14.01.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.14.02.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
-SRCREV = "597da6154263c9317291f2dd0ed71a8ff1e8b2dc"
+SRCREV = "5239ae6c82bfb239637b5a66cd39a035a158e641"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.25.1


