Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CC8C6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 10:20:26 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.38686.1676974822880382827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 02:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FmpvCoX7;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676974820; i=@fujitsu.com;
	bh=x8iz3xfBc/tr0l6PG2vOb6QklLWYaeRSEIVlDBtOYPI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FmpvCoX7g6JNWXbzvziYdgSRQ4uFO9V6aMCe1wiNGneE1V1EfmpypqsCioHSVucyC
	 qpvT33lCIS47IeANC0UPrH5+HlIA+vR1HSJBJ7PEejTpOQusPC4/EL3u8++9Vngia9
	 JzmMYxdWupY5EeTs80inIXd9MW8Zw8tUzd/qrYyeWAPdp7WzOkAKSg4/VHz1EL+N+X
	 w75bjr+m2aKxywYIM8NaHrFvVcJWlXlYxSzgZn9msr5SR6FBYYhChN53o3mTS2c5LJ
	 UsHmQkEyDEja5YV50VfNWzTMHjTywjIOH2mkCCWq0p42vHCGZ397j9GWU12BxOKMoY
	 X8JUY3TuWkSRg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORqPtk1pd
  kg3UT+Czu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyGnrnMBbu4K1pavzM1MO7n6mLk4hASeMwo
  seP3AmYI5zqTRO+BA+wQzl5Gia3Hf7F0MXJysAlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgLdEf+N8RhCbRUBVYtLZM2A2r4CTxJvrDWC2hICCxJSH75kh4oISJ2c+YYGYIyFx8M
  ULZogaRYnZl5tZIOxKidYPv6BsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYzYtTi8pSi3QNLfWSijL
  TM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTyUks2MQLDMaU47esOxtl9
  f/UOMUpyMCmJ8n479TlZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSv3/QvyUKCRanpqRVpmTnA2
  IBJS3DwKInw1nUBpXmLCxJzizPTIVKnGBWlxHlrZwIlBEASGaV5cG2weLzEKCslzMvIwMAgxF
  OQWpSbWYIq/4pRnINRSZh3CjC6hXgy80rgpr8CWswEtNj9xweQxSWJCCmpBqbKdcbV2+5LODH
  s+XFp8edvd1S793xgnnbdNbydQ3/2/D02Fy3PfdB4d3OmhqWH9r6nvT+7bcsbLTj35YcY8Mff
  3e2w/8x28/Lky9+tft69c5lN/OH6s1dXNnns1msK5LlrWz6pOjS5+vECAXa+HLfFpeW/M49u/
  /lm8t8I080z5PKulot/XuMn8P5prdSnezeDRbrLXpVO19AMlEm8Jblzrt7Vy3dF/nR/+bdkdV
  H7n7vTbUvznWJsn7pnv1wb8t+KczbXSQPW5bw2X9MifO28Yi9Pf7L/SLap18JLqUyP3gv11C5
  JT11VdaT/xqvFJlsShRYZtso7XLr3fun0+fwztVsUJkvv/n9w2Rm2h2cLlFiKMxINtZiLihMB
  l/aYgEIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-728.messagelabs.com!1676974819!1485348!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13953 invoked from network); 21 Feb 2023 10:20:20 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Feb 2023 10:20:20 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 93F3B100195
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:20:19 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8527F1001A2
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:20:19 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 21 Feb 2023 10:20:17 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest-subtests: upgrade 0.9.0 -> 0.10.0
Date: Tue, 21 Feb 2023 18:19:58 +0800
Message-ID: <1676974800-24948-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177487

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Added experimental support for suppressing subtest output dots in non-verbose
mode with --no-subtests-shortletter -- this allows the native pytest column
calculations to not be disrupted and minimizes unneeded output for large CI systems.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...test-subtests_0.9.0.bb => python3-pytest-subtests_0.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.9.0.bb => python3-pytest-subtests_0.10.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb
index bfaff39077..e1f2a49d31 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.10.0.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "c0317cd5f6a5eb3e957e89dbe4fc3322a9afddba2db8414355ed2a2cb91a844e"
+SRC_URI[sha256sum] = "d9961a67c1791e8c1e32dce7a70ed1e54f3b1e641087f2094f2d37087ab7fb17"
 
 inherit pypi setuptools3
 
-- 
2.34.1


