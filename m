Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D548C433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:05:46 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.189.1668308739551974073
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZEb14W2T;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668308737; i=@fujitsu.com;
	bh=VyBWBJg45ROVZaJflJPweAxDIY7Kal5HMLw8lOHK+/E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZEb14W2TnP2ulg+T9BbUTrS36lwXud6joZ4Wnd1PbDww3CHKMCMhDZRFG+f070uu/
	 rgLdFj67dgA4E2cOYpmL+PtkD76wk0kddjQ8PsM0mtNlUDllghFPyFTwP0M6UOLtbR
	 U29b90Qkj4nXylIVndy3Odz5h/ZP+ngdxcVmndH0fbts8B0V0a4N28NcnMRSnTg903
	 vcjhfJFvI3WBSfBZ7RXdaU73Ru992W6RnwRZvwN/41bGpnKaEFaCK8QusPtC9UFbm3
	 9RsgbzWNLhWT6tsWW3ofZUzRYSOqdiND1NxxBTdw0mKNF24gB1Lmt++aZdzuCrWglX
	 a/KkkDWR0PNvg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8ORqMsQX5B
  s0HxTyOLOz3fsDowe5zauYAxgjGLNzEvKr0hgzVjasIql4A5nRV/nU8YGxj8cXYxcHEICjxkl
  bi+5zwjhXGOSeNB6kR3C2cMosftyH2sXIycHm4CUxI37/9m6GDk4RAT0JK7+EwUJMwuoSLz43
  cMOYgsLeEu82fUSzGYRUJVoPvSSEcTmFXCS2Nu/CCwuIaAgMeXhe2aIuKDEyZlPWCDmSEgcfP
  GCGaJGUWL25WYWCLtCYtasNiYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRrPi1KKy1CJdQyO9pKL
  M9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMBgTClmT97B+H/Z
  H71DjJIcTEqivGnX85OF+JLyUyozEosz4otKc1KLDzHKcHAoSfD+jixIFhIsSk1PrUjLzAFGB
  kxagoNHSYS3wg4ozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vFQpcV6JGKAiAZCijNI8uBGwKL
  3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3bTTQFJ7MvBK4Ta+AjmACOuJ7ZB7IESWJCCm
  pBqbYRU28BR9XVnC0ttxvm84e0z9/2QIWy6y9pavlXL5933lcO1ncjnPnE23/xvbCUH7NS7u8
  v19xsCgMnhsqq3otZAXfW2/Z+rtW4rtVO+aHTftVvsxjetHHpCfb73Hl3v1veWuWUcqks8eKj
  jY9LZZ0FQlW3ffwNfu8TT9n3Tq6cPnj/Kpb4ptPTtb+f+O7cdu7hr5rJg58b+Y8eFBbdoRh45
  To4ouOpb4MHC/OXild/Dv6yg1tZtPf0+5WxzPK/f7F8bJp1RZ245/ZTWcnBvxiuXz59OPIM+c
  d5Gpk+fSumKlunTPXQDeo2/7pRcMeVy6Rnikq1+Yyievd2uU76+2hRZ9mLZA1ENNYVaXhcGO+
  EktxRqKhFnNRcSIAXGvstE0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1668308736!408479!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31568 invoked from network); 13 Nov 2022 03:05:36 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:05:36 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E6E9510019A
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:05:35 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DAD0F100198
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:05:35 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:05:34 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-sphinx-rtd-theme: upgrade 1.1.0 -> 1.1.1
Date: Sun, 13 Nov 2022 11:05:18 +0800
Message-ID: <1668308718-15030-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 03:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173177

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fixes wrapping bug on cross references (#1368)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...inx-rtd-theme_1.1.0.bb => python3-sphinx-rtd-theme_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_1.1.0.bb => python3-sphinx-rtd-theme_1.1.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.1.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.1.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.1.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.1.1.bb
index a4c882eab0..a8b2653ccd 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.1.1.bb
@@ -10,7 +10,7 @@ DEPENDS = "python3-sphinx"
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "6e20f00f62b2c05434a33c5116bc3348a41ca94af03d3d7d1714c63457073bb3"
+SRC_URI[sha256sum] = "6146c845f1e1947b3c3dd4432c28998a1693ccc742b4f9ad7c63129f0757c103"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.25.1


