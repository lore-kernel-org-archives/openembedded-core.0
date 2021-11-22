Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1337C433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 14:59:05 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.7405.1637593145152549434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 06:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rSA6uygg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593142; i=@fujitsu.com;
	bh=A4hiiy50HJncS+tZS+FSLZZrs36+lXeei6tmD+L+yQk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rSA6uyggSreIn4lWyq+GAPEcOpSy/gzGiX+C14k32Todro+6mnRQtatMVxG53RxZs
	 VuycZIfoSeLECGBv3G7frUzicW4sj0Z7DS6+XHmWMeLh3EUJDdwjoWggKN7hngc6ux
	 z88+liJFyG+1gzAaaDThSf4bVEAXo3DjWhNTK8N8borWGsySupE9AcmbdENGROh+n1
	 UyOVfKjtLdDRgbtkJ5u2CwPV5bFf5XDMN6bCS+GoQVU6pFpOcCYE6kzc+iT7TE9yRm
	 uBg22np90AvLCm9Zr12o8i1dL3L44O4ThjSoWTAEDyDioHdQK+v1ze7JFlIMEUwnQ2
	 xMF04Lpgu1mtA==
Received: from [100.113.7.250] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 91/16-14220-630BB916;
 Mon, 22 Nov 2021 14:59:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MRomu2YXa
  iwcrprBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bzh2+ZCqZzVlyfv5m1gXEqRxcjJ4eQwAwm
  ie1PZboYuYDsE4wS8y5eZgdJsAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3z3sIGFhAXuJD
  6fUQEwWAVWJhk1uIBW8Ak4SizdtZwaxJQQUJKY8fA9mcwo4S9xesIUZYquTxKo5lxgh6gUlTs
  58wgIxXULi4IsXUL2KErMvN7NA2BUSs2a1MU1g5J+FpGUWkpYFjEyrGC2TijLTM0pyEzNzdA0
  NDHQNDY11zXQNLcz0Eqt0k/RSS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgaGYUsi2awfj
  59cf9A4xSnIwKYnyGs2enSjEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvfxOqCcYFFqempFWmYOM
  C5g0hIcPEoivA4gad7igsTc4sx0iNQpRkUpcd7bIAkBkERGaR5cGywWLzHKSgnzMjIwMAjxFK
  QW5WaWoMq/YhTnYFQS5rVfDzSFJzOvBG76K6DFTECLTx+fDrK4JBEhJdXAxLZiubDS13vlqq3
  9qorHFW8v/jt58eRP92Wrb1rqNCS89Fj2oqgyL212blFGWZlpvRKbqM+13OSQ503LT83T9cnh
  m3pMOLucfa19ltvUIzKLkjcrXQqp9190VECvrkSf56/XiuaUprMaiZcu7qvtvrzkifdzw0e1F
  bzmthb++jLbr3ud3eWyTeTl9Ws/N3vXPX1tsLPwhPPVm//Wdc2Svn11z3aPT21BJyr9DQoFeh
  h+v1khJMXptVn3bXtSlla1yaYH6zbMfqEx7drfV7Oqg9YLLbz3c2Gn9uSz2xefZH1dGzJ9Nb8
  CczZzvqLsmt8a0w516P6PONPTZy3teUv0nXfpbdWbDrP3zOJz5XU/p8RSnJFoqMVcVJwIAKBN
  QldAAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-248.messagelabs.com!1637593141!210404!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29761 invoked from network); 22 Nov 2021 14:59:02 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-16.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 14:59:02 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1AMEwtZ7031838
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 14:59:01 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 14:58:53 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-mako: upgrade 1.1.5 -> 1.1.6
Date: Mon, 22 Nov 2021 22:58:33 +0800
Message-ID: <1637593113-99188-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637593113-99188-1-git-send-email-wangmy@fujitsu.com>
References: <1637593113-99188-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 14:59:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158574

Fixed issue where control statements on multi lines with a backslash would
not parse correctly if the template itself contained CR/LF pairs as on
Windows.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mako_1.1.5.bb => python3-mako_1.1.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.1.5.bb => python3-mako_1.1.6.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.5.bb b/meta/recipes-devtools/python/python3-mako_1.1.6.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-mako_1.1.5.bb
rename to meta/recipes-devtools/python/python3-mako_1.1.6.bb
index f8be44a837..ec8c9cc12a 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.5.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.1.6.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "169fa52af22a91900d852e937400e79f535496191c63712e3b9fda5a9bed6fc3"
+SRC_URI[sha256sum] = "4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-html \
                   ${PYTHON_PN}-netclient \
-- 
2.25.1


