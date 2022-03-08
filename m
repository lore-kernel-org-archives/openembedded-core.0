Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C87C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 10:35:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.6592.1646735703071251347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 02:35:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TgOLqAmP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646735701; i=@fujitsu.com;
	bh=V2++MDDFtmy/gXtEGA/BpeUdAYpeua+lofW08W/tExI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TgOLqAmPDYbfvKy5p/pRBdz+8l27DOB2rvvhd5eH54cRt8Ug9xf+OTb/A4aJDAqxo
	 U5u7+BIw2Gxkplu6aN06Zv87g0csabpFrfJnZsE2TGVnpFgFNTyAoZOYOhg5r13zqf
	 gmvl6bQt174l1WvMl/GZcSE5GtGHIKiEf6Jqna9Vyr8E1uAUeQkK20gwWasRXrdU8o
	 xjlDqgB0Y9oOUZPt0gOP9ODHo3bF2RllRlTArfBYqyYeHHnIV7n61TwmpbYAYGFpjB
	 zEGz5hUIuILF0mEcrCBGt7WA3/UDPbYG3zR8u0OGqjkkrpd7APsYG9fS3bwFj9nCH4
	 GLwrM0IqLEgVg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqBtiqJ5
  kMG+mkcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtGxcjNbwUzOiuaJjewNjCs5uhi5OIQEHjNK
  LH04hRXCOc8ksWnvWSYI5zijRNvhv0AZTg42ATWJ6bduANkcHCICehJX/4mChJkFVCRe/O5hB
  7GFBawkJq5eAmazAMW/7V3HDFLOK+AkseZfBEhYQkBBYsrD98wgNqeAs8T1vysYQUqEgErWPg
  sFCfMKCEqcnPmEBWK6hMTBFy+YIVoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hc
  wMq1itE4qykzPKMlNzMzRNTQw0DU0NNU1NtY1NLfUS6zSTdRLLdUtTy0u0TXSSywv1kstLtYr
  rsxNzknRy0st2cQIDOGUYsXNOxgnrvypd4hRkoNJSZS3nk09SYgvKT+lMiOxOCO+qDQntfgQo
  wwHh5IE7x59oJxgUWp6akVaZg4wnmDSEhw8SiK8pVpAad7igsTc4sx0iNQpRkUpcd41IH0CII
  mM0jy4NlgMX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzPsaZApPZl4J3PRXQIuZgBbbGam
  BLC5JREhJNTDJZD4/93D9jv39repPJyxNEgw4If542Zkez72JjJdXbqlhfRx9zClpjdE1+9n/
  Nus8XuDY/2K3Knu91L169y2G05jzcg/nvq6Y4CgpyLUj9tR1mdby791XPngJuXW5ndzb4rLoz
  cNOD//8atOFKRkrX78zyXx99nlSZpOGZs0LsclLG7gTeSvOtPNFufhWL3ELZEh7u7redWZnIp
  tgE9+TMysjHupbXdqw9q3LHNEmmXL+a2dfrc0/fDVU4Z9ixPtDi7ZbXCkNz7mxRHmXxk6FyAP
  z7tX865HOLfyw/FHPuY2+Xx9GnwtV0PkzZcnEBSpP8+v0l6mpbfh8PkPnWN1HK2eNbB//1Buv
  l+R8ta9TYinOSDTUYi4qTgQAuDgaqFwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1646735700!12476!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23217 invoked from network); 8 Mar 2022 10:35:00 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Mar 2022 10:35:00 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5AAFB10019A
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 10:35:00 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 47A2810018F
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 10:35:00 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Mar 2022 10:34:48 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] pango: upgrade 1.50.4 -> 1.50.5
Date: Tue, 8 Mar 2022 18:34:33 +0800
Message-ID: <1646735675-58918-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646735675-58918-1-git-send-email-wangmy@fujitsu.com>
References: <1646735675-58918-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 10:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162895

Changelog:
=========
* Fix compiler warnings
* Enable cairo by default
* pango-view: Show more baselines
* layout: Handle baselines
* Windows: build cleanups

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.4.bb => pango_1.50.5.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.4.bb b/meta/recipes-graphics/pango/pango_1.50.5.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.4.bb
rename to meta/recipes-graphics/pango/pango_1.50.5.bb
index 0ea621bf67..3a0cbd57f0 100644
--- a/meta/recipes-graphics/pango/pango_1.50.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.5.bb
@@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[archive.sha256sum] = "f4ad63e87dc2b145300542a4fb004d07a9f91b34152fae0ddbe50ecdd851c162"
+SRC_URI[archive.sha256sum] = "6d136872da6207fe88c5cd2c95c36bcaf4ed29402b854663a86cd7efe99b0cf5"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.25.1


