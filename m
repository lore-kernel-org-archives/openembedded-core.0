Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39F3C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 05:20:21 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.3432.1668576017392383163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 21:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AN3ipobx;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668576015; i=@fujitsu.com;
	bh=TXifLYRuemh9cCgf/sV/TqoQeypVujoL2aKTz1dJ644=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AN3ipobx3Bn4bUbYg30hWGOT3bKS0eiJdX7D3KlJjUFdt5kFdA1xcDAVqRKV+ZcGa
	 ScMUFzYBUXAuHbU21bl4IcnnFS3P5kA2MMZI/bAkRw/PeVV2zoGHWeZ3sg5qtcw7g8
	 Q8SLpZx7uBRGZ95KcUrT5gk7rPwJqjop5c2xDWXh0WWFJCL8qV8dtONN4spGWCFwsN
	 QI1gUv+HB2WuBUQijyUevBTatNUUZNRWcJKCwP89gtVdGXbXsvmWn3QAsNyPtlO1X0
	 a8WubE5Yv+oHVuRjuOBh5LwvwzPpBZJhGTNLkSi7b4tCFOL069sUsWjlZMZodG3tuq
	 9COuHn0PiYyIA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8OxWZe/uCT
  Z4OAUbos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePQ7sCCTu6KpX2FDYy9XF2MXBxCAg8YJX7/
  fcMK4Vxikpj4dR4ThLOHUWL+hTbGLkZODjYBKYkb9/+zdTFycIgI6Elc/ScKEmYWUJF48buHH
  cQWFrCT2Db/LyuIzSKgKtFy5QdYnFfAUWL/lV9MILaEgILElIfvmSHighInZz5hgZgjIXHwxQ
  tmiBpFidmXm1kg7AqJWbPaoHrVJK6e28Q8gZF/FpL2WUjaFzAyrWI0K04tKkst0jU00Esqykz
  PKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDMSUYpb4HYwPl/3R
  O8QoycGkJMrL4VacLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCN3cuUE6wKDU9tSItMwcYFTBpC
  Q4eJRFeuQagNG9xQWJucWY6ROoUoy7HzK9tB5iFWPLy81KlxHn5QGYIgBRllObBjYBF6CVGWS
  lhXkYGBgYhnoLUotzMElT5V4ziHIxKwryXZwBN4cnMK4Hb9AroCCagIw74FYEcUZKIkJJqYFI
  8o7Z29RuhjsID7llBIb9WP4s/Ejr77IqQR99ZC5dt3LqCN4Bxk5Cn33U2nxM7lZcsmnXoi1+/
  ngRrWcDyuXs4BJes1dnDv7F04ovddUZVhr1Oh9sVzsx6Zp/yWO+dV1hurstGy38epwumzLpme
  8Lj/hJ1F/t16av1p8kKTbsuxSXc5rend9Pn5ndvbLferpAt8y75ktF7sXfmlxUeufEW1tnMoe
  dfTj7Gk76+do2DSabA26KdFlO9O30szJ4IL67Nfsfwu/l6BZv+TGdvd/nVvxNu6oWcdg/6VXJ
  SilPykuLNCCPmMw7n2v9e2Gz+3fWtt+zTbNnNN3c/cd4b0HN++u7X8aE8x6QeMBYeWqHEUpyR
  aKjFXFScCAC1BvGPSwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1668576014!1064291!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23381 invoked from network); 16 Nov 2022 05:20:15 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Nov 2022 05:20:15 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id CDF3A150
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 05:20:14 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C198373
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 05:20:14 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 16 Nov 2022 05:20:13 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libpipeline: upgrade 1.5.6 -> 1.5.7
Date: Wed, 16 Nov 2022 13:19:56 +0800
Message-ID: <1668575996-9192-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 05:20:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173376

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 * Add notes to libpipeline(3) of when functions were added.
 * Transferred Git repository to https://gitlab.com/libpipeline/libpipeline.
 * Make `socketpair` tests used by `./configure --enable-socketpair-pipe`
   compatible with C23.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpipeline/{libpipeline_1.5.6.bb => libpipeline_1.5.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libpipeline/{libpipeline_1.5.6.bb => libpipeline_1.5.7.bb} (85%)

diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.6.bb b/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb
similarity index 85%
rename from meta/recipes-extended/libpipeline/libpipeline_1.5.6.bb
rename to meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb
index 7007608a39..73c7aaaa91 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.6.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipeline-${PV}.tar.gz"
-SRC_URI[sha256sum] = "60fbb9e7dc398528e5f3a776af57bb28ca3fe5d9f0cd8a961ac6cebfe6e9b797"
+SRC_URI[sha256sum] = "b8b45194989022a79ec1317f64a2a75b1551b2a55bea06f67704cb2a2e4690b0"
 
 inherit pkgconfig autotools
 
-- 
2.25.1


