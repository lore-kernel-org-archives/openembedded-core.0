Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DC9C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 10:19:36 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.38674.1676974770347365095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 02:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y/6akprh;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676974768; i=@fujitsu.com;
	bh=kZ8y0sM0fTeqV/9pknxK77r8WebHmo8UgIEL1xnF7p8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Y/6akprh4oYLLD1m6t1Y6SPqbGW0FWWMY6aQWfBfIBso6VP7BiZZcguynJd0Dp7rm
	 OyUtLVb6oPrGu3w0tYLPOL6qV44oYJWkrUXq3aueORVIpojFC2tvJks2XI90tssqA/
	 GUEDv+1czIJETdKI+yFJGo/deTaw/HNzbrUqzS5szXN2dKb2BW9N6yDVvvHCKZILUL
	 l+GY0xky1ad4q5TUrbxokm+E/tqiFUO0VMww/gu8HQWgjLzDAwEOo89YQsx5pxAoIk
	 fTJ0Sp2MYddNHCdm1dVIz/ZPz0YfJ9V5O0y5N+ORdNhxkkPxWGQlkwKcV9K+0StXTs
	 t1WtJTuuEp/YA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpLth1pd
  kg38NshZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bHqZvsBRO4Kl4+WMnSwLiKs4uRi0NI4AGj
  RMfhy6wQzhUmiYXne5kgnL2MEgfPtLJ0MXJysAlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgJvE0w8bWEFsFgFViQn3voK18go4SRw6fZINxJYQUJCY8vA9M8gYTgFniblNsSBhIa
  CSV5eWskGUC0qcnPmEBWK8hMTBFy+YIVoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUj
  aFzAyrWI0K04tKkst0jU00UsqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxN
  zknRy0st2cQIDN2UYpUXOxif9f3VO8QoycGkJMr77dTnZCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvH7TvyQLCRalpqdWpGXmAOMIJi3BwaMkwlvXBZTmLS5IzC3OTIdInWJUlBLnnTQDKCEAks
  gozYNrg8XuJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvBUgU3gy80rgpr8CWswEtNj9xwe
  QxSWJCCmpBqZHFz7vzey43yS5V2D71bXHJI6WKdysElwcsKU+fHGcldBXrq+3/HVKArK18pSM
  bTXjJ/JsX2a+fZ74pilHxWdvXH9MVsnyybMT1/9w9T61VhJ9VBrcPF/X8LdQzKe1a93zS5r8l
  i6euLnU7Vfzbc2ytsVTjb3cq45d1bkbyGaep5P95DznwqztJzZJrZl1RHm78nO3ywu/zvotvV
  CCfXEiI9PTucbqu/aWaK9iPyi17QuL/5x1Yc9yU2afXF3FxXR1ibZ8tPLB80k3Zq5NzdjQEJQ
  gLx4Smtp/XDQm8OyyKSJlcbOf+p0TK+CIT1IuS/IU5OKOP/6vouzz0Q4Z4SsL+iolfbcXaXCu
  cqzQu6zEUpyRaKjFXFScCAAZJjwyWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1676974768!607800!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18626 invoked from network); 21 Feb 2023 10:19:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Feb 2023 10:19:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 30B3F1B1
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:28 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 24DAC1AF
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:28 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 21 Feb 2023 10:19:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-poetry-core: upgrade 1.5.0 -> 1.5.1
Date: Tue, 21 Feb 2023 18:18:57 +0800
Message-ID: <1676974737-24910-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676974737-24910-1-git-send-email-wangmy@fujitsu.com>
References: <1676974737-24910-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:19:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177486

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Improve performance by caching parsed markers, constraints and versions (#556).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-poetry-core_1.5.0.bb => python3-poetry-core_1.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.5.0.bb => python3-poetry-core_1.5.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.5.0.bb b/meta/recipes-devtools/python/python3-poetry-core_1.5.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-poetry-core_1.5.0.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.5.1.bb
index 03db426b39..952ffef99d 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.5.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.5.1.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/typing_extensions.LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2 \
 "
 
-SRC_URI[sha256sum] = "253521bb7104e1df81f64d7b49ea1825057c91fa156d7d0bd752fefdad6f8c7a"
+SRC_URI[sha256sum] = "41887261358863f25831fa0ad1fe7e451fc32d1c81fcf7710ba5174cc0047c6d"
 
 inherit python_poetry_core pypi
 PYPI_ARCHIVE_NAME = "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
-- 
2.34.1


