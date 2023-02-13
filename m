Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF33C636D7
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 02:38:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.5651.1676255893429876327
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 18:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=I14POaPa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676255891; i=@fujitsu.com;
	bh=F2zrrEnFR0/46rMn0c1jcxFpKUpDx5Gfg7WHP614dPg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=I14POaPatScO7yuYj1oSh5LDFT3CjyMRd4ceZrmFip3n5rTnja91NRsMYeOsDWYVm
	 4e9c21o9/jWCFMU++KSBJIzq8jT0Rqf60X5XwkUVyuPHTbltLWOlrkBy9f0OOLYTEn
	 2tcA03Mgui9NRPrsmz6Fhq/pPy2gmc0KlFvA0pfRf8i3cAf5OCjyCB2BuhT+cP/ZaA
	 SQ3g+yHa7MvcYxcF/C/vaR5IvhTr3IzNuzCpAJs48iu2GiHLeGztltHHpFnUy6wF0T
	 kWLmm5qgMJk/ggL7EDMPJBM42UycB0aNm75Rh8kJa5B3rHF9EDiMeF9a/uEtfbGnc2
	 wjIudvrEBalwQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqDtp0ct
  kg6VrVS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oy/R1pZC94JVpz70cTewPiAv4uRi0NI4DGj
  RMeq1ewQznUmiSXv7rNAOHsZJSa0r2fsYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhASeJuX1PWUBsFgFViecTIeK8QPFjx/+C2RICChJTHr5nBrE5BZwlPm/5yApiCwHVvJ
  80hwmiXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0p0frhF5StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjaXFqUVlqka6xXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTope
  XmrJJkZg6KYUM/ftYPza+1fvEKMkB5OSKG8fx8tkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8U
  guAcoJFqempFWmZOcA4gklLcPAoifBaTABK8xYXJOYWZ6ZDpE4xKkqJ8/IvBEoIgCQySvPg2m
  Cxe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO/uWUBTeDLzSuCmvwJazAS0+DEf2OKSRIS
  UVANT+lKvPwmJCVOD2Dc45D3Irb/RGeZgcMv9wcN1J6YLmD42n7+EWSfw674qW+6zoVePG954
  sEDkR+SGmhW3bsmcEzZhdDV+rDSpftHs5wEaD95G86grf3GxKnh0I8JVzV/JIeKnmXN65LUU7
  Rd5h19Wy3yUPmB2f3PCLzvWn6dT7+mJJ7yf9OY0hz3fCTenG+5cbxs3NIT8/aXOJmqytiRLae
  6fZzcqv/2ayF/++JpjaYNATMJxsRexnjWrzvMJhEbqXZB6Z9b1OaopfYeT71XO3A9qNzxCrP7
  o5fjn2QRKTam8suHKoTPBbs+CRPiUr986qGhqGLVJSvmcdL7A8817lp7dF/9Tz83MXdvygqsS
  S3FGoqEWc1FxIgC4HxkuWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1676255890!519076!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21317 invoked from network); 13 Feb 2023 02:38:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Feb 2023 02:38:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 36AAF100194
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:38:10 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 29E60100182
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:38:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 13 Feb 2023 02:38:08 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libjpeg-turbo: upgrade 2.1.5 -> 2.1.5.1
Date: Mon, 13 Feb 2023 10:37:52 +0800
Message-ID: <1676255874-19490-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676255874-19490-1-git-send-email-wangmy@fujitsu.com>
References: <1676255874-19490-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177074

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
1. The SIMD dispatchers in libjpeg-turbo 2.1.4 and prior stored the list of
supported SIMD instruction sets in a global variable, which caused an innocuous
race condition whereby the variable could have been initialized multiple times
if 'jpeg_start_*compress()' was called simultaneously in multiple threads.
libjpeg-turbo 2.1.5 included an undocumented attempt to fix this race condition
by making the SIMD support variable thread-local.  However, that caused another
issue whereby, if 'jpeg_start_*compress()' was called in one thread and
'jpeg_read_*()' or 'jpeg_write_*()' was called in a second thread, the SIMD
support variable was never initialized in the second thread.  On x86 systems,
this led the second thread to incorrectly assume that AVX2 instructions were
always available, and when it attempted to use those instructions on older x86
CPUs that do not support them, an illegal instruction error occurred.  The SIMD
dispatchers now ensure that the SIMD support variable is initialized before
dispatching based on its value.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jpeg/{libjpeg-turbo_2.1.5.bb => libjpeg-turbo_2.1.5.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.1.5.bb => libjpeg-turbo_2.1.5.1.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
index 4d21ca1e1d..e086830c02 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[sha256sum] = "bc12bc9dce55300c6bf4342bc233bcc26bd38bf289eedf147360d731c668ddaf"
+SRC_URI[sha256sum] = "2fdc3feb6e9deb17adec9bafa3321419aa19f8f4e5dea7bf8486844ca22207bf"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.34.1


