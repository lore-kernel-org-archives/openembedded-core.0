Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE92C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 06:46:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.3867.1653461173876277946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 23:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=y/KawoF7;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653461172; i=@fujitsu.com;
	bh=mKRIty2987K7Y7cZL/CMqPUd6nWqBldYpLRiRBgVXQE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=y/KawoF7QjROmdm++7a83D7VMO957Zze3p8KmjZhGjcVLL4FT3cOQpw7/4pJXxYFX
	 rW8Xb90B0M2/jhGYBKz8AMMa493xtkSB6Smgvg3gO25DpQ1y1oZiBkMBL+PMzasXln
	 oh95UKE8/VSS7j35yI14dfI0YbIuiB6ROERn5BvFk5zqKUTQ99xHAWChzHRGtm2TZL
	 mFXRBPsIjHLO1QWTCXfLPvjmrfURF+F/4kaOcB58dTKWm0Ad7N5LmrJd2huFKYk6dm
	 MvCLzFLWYU5bjxeL9O5VrGeXRAdzE7r0Ie32nG8AaciGK1dKM8d45pQ1gUEG7Is0tp
	 mFloCmgH44Dyg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqLv5Qm+
  SwfQFihZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8akv1NZCrZyVGy/6d3AeIO9i5GLQ0jgMaNE
  34/fzBDOeSaJCWuWM0E4exgltpz7zNLFyMnBJqAmMf3WDdYuRg4OEQE9iav/REHCzAIqEi9+9
  7CD2MICdhJ72xvBylkEVCW+/z7LBmLzCjhJTLs2mwnElhBQkJjy8D0ziM0p4CzxaudrVhBbCK
  jm/fk7UPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsCokZM7axQdhqElfPbWKewCg4C0n7LCT
  tCxiZVjFaJxVlpmeU5CZm5ugaGhjoGhqa6hpbAJmWeolVuol6qaW65anFJbpGeonlxXqpxcV6
  xZW5yTkpenmpJZsYgUGcUqyWu4NxysqfeocYJTmYlER5T2zoTRLiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwZt8HignWJSanlqRlpkDjCiYtAQHj5II7w+QNG9xQWJucWY6ROoUoy7Hsa/f9zMLse
  Tl56VKifN+AykSACnKKM2DGwGL7kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlZgKlCiCc
  zrwRu0yugI5iAjsjnBTuiJBEhJdXA5CPGEL5gbrOFVPLB2VMSk+u6bW24ZvsFtFdUzZZa/PN7
  0SPZtU1vK3ed3D73PaP2PIUNAXozt7aondO/++rSBOsDl4r0diR3PT20oX6m79Js9ebnc8v49
  kXkujR48N35ZLnS1THq4peXNvxah/ffkX/eXriBkfXAM/Nco/RD6e+Wbc6RsN+3qEM0V6/25a
  nNyaFHH+4PMWhXtFHcIDRrccJELV+HyZtWqm+JfLTiwyT2e8tCN3LWbZ6hsaskadruIweWNu1
  e07hz0Y6dB4QXSbV+Kv6+xiXWum0F89Luo9em/p7WZNKeVeHVoh7f8/xKXO+P5poXG5dLncv9
  FB6deePTY91UMauuK0pek5305iixFGckGmoxFxUnAgALo/D9aQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-548.messagelabs.com!1653461171!28596!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13176 invoked from network); 25 May 2022 06:46:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 May 2022 06:46:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0476810019E
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:46:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D000610018F
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:46:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 25 May 2022 07:45:52 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pip: upgrade 22.1 -> 22.1.1
Date: Wed, 25 May 2022 14:45:32 +0800
Message-ID: <1653461133-12463-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653461133-12463-1-git-send-email-wangmy@fujitsu.com>
References: <1653461133-12463-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 06:46:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166101

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pip_22.1.bb => python3-pip_22.1.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_22.1.bb => python3-pip_22.1.1.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip_22.1.bb b/meta/recipes-devtools/python/python3-pip_22.1.1.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_22.1.bb
rename to meta/recipes-devtools/python/python3-pip_22.1.1.bb
index 1aef9bca33..ad239e952a 100644
--- a/meta/recipes-devtools/python/python3-pip_22.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.1.1.bb
@@ -37,7 +37,7 @@ SRC_URI += "file://0001-change-shebang-to-python3.patch"
 SRC_URI += "file://no_shebang_mangling.patch"
 SRC_URI += "file://reproducible.patch"
 
-SRC_URI[sha256sum] = "2debf847016cfe643fa1512e2d781d3ca9e5c878ba0652583842d50cc2bcc605"
+SRC_URI[sha256sum] = "8dfb15d8a1c3d3085a4cbe11f29e19527dfaf2ba99354326fd62cec013eaee81"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.25.1


