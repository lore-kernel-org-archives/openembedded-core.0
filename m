Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31E9C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:10:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.6971.1670479841837852645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iOgRJSC9;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479840; i=@fujitsu.com;
	bh=5uhff8juiRPZ2V1sIXoK6s7rdtbLeAtIcRe3LuaPqOM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iOgRJSC9hpB0+eZ454abas14B82xZCpZNe46aO7NrVjkp9/m+bccnJzYm1clZQxsZ
	 H5z1s2osvszAtoaVXmhWWvE3+A88RxzLRLlFJp6Z8gdgIUp22Hym2ytTpIkfnSQn0X
	 KZc/qzLdnz6zAGDpBsm/Um946V6GyfnyvnDITJ/XLP1aUoY6wfFFDRnaw2uWHWE4Gj
	 UaBHoFo5FlIeep5r01CBE/J06xF6R77WVfjIBModzV3TRtUtyZwyZh8zYUSbKoBeE8
	 1Kk3wvbZ3VzIchSD/wRLRKkWjue9rbE+fEi7HcDbjHeUM1Q7/cI1rPeqGqsjBApKgL
	 EPBh0tlIVya/g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqHu/fmK
  ywfV+AYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWN3z2fmgq1cFe9nzWFqYNzL2cXIxSEk8JhR
  4ublpWwQzjUmiYO7tzBDOLsZJWY/e8fSxcjJwSYgJXHj/n+gKg4OEQE9iav/REHCzAIqEi9+9
  7CD2MICnhKfNp1kBrFZgOLnG5ezgdi8Ao4S055eARsjIaAgMeXhe7AaTgEniW1vW8BsIaCaqR
  Oms0PUC0qcnPmEBWK+hMTBFy+YIXoVJWZfboaaUyExa1YbE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjaXFqUVlqka6RXlJRZnpGSW5iZo5eYpVuol5qqW55anEJUCaxvFgvtbhYr7gyNzknRS8v
  tWQTIzB0U4oVvu9g7F76R+8QoyQHk5Io74vq/mQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwXK
  icmCwkWpaanVqRl5gDjCCYtwcGjJMLrWwuU5i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+XqqUOO
  +6OqAiAZCijNI8uBGwmL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZi3DmQKT2ZeCdymV0B
  HMAEdce9/L8gRJYkIKakGJlMNrywNn8wft602HV+a8Kzuab5ZT/6PnFTOtMqNUkuvm16ar/2m
  7LuN2JlXkm+acn+Vb1I+rlhukn5JesPyGPmSN25GcVOWPr1SW7R677+axw+5I/V+ZLT4bCstX
  Gwz/0pRUMSJZsbgG9uXbVj11kJhefscq3s3479yWhR6Lbzh7X9Qk3Vj2Ez3pSfjdNXZa51PXg
  /r7OiylHvLdUNn6hlN23U/LJNrZmkL/rW0vJ/7SeZE6a6PayqY3v88ZL45a87ff9oyNxM9pNY
  fUrT/YKZ24/ZMm5ftjnLPFV5JT5y16Iibs2j4N9nd1yaI/JzfP8/LZM7MqA/yxTMCo9OO8D97
  5Kdgz9vp+mjzy6lvtJRYijMSDbWYi4oTAV2rd+pkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1670479839!17140!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24332 invoked from network); 8 Dec 2022 06:10:39 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:10:39 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EDF5610019C
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:10:38 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E1FE3100192
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:10:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:10:37 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ujson: upgrade 5.5.0 -> 5.6.0
Date: Thu, 8 Dec 2022 14:09:53 +0800
Message-ID: <1670479794-1225-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670479794-1225-1-git-send-email-wangmy@fujitsu.com>
References: <1670479794-1225-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 06:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174380

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
  Update vendored double-conversion to 3.2.1 (#570)
  Fix len integer overflow issue (#567)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ujson_5.5.0.bb => python3-ujson_5.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.5.0.bb => python3-ujson_5.6.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.5.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.6.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-ujson_5.5.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.6.0.bb
index 9f080eb27..ee12deffb 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.6.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5418f0b03302d0a"
 
-SRC_URI[sha256sum] = "b25077a971c7da47bd6846a912a747f6963776d90720c88603b1b55d81790780"
+SRC_URI[sha256sum] = "f881e2d8a022e9285aa2eab6ba8674358dbcb2b57fa68618d88d62937ac3ff04"
 
 inherit pypi ptest setuptools3
 
-- 
2.25.1


