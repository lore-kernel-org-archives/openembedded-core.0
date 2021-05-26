Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web11.261.1622072837704236668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 16:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YyDtPafz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622072836; i=@fujitsu.com;
	bh=ZvmIzgSKp9Lx2sMu+4WviHl3APNLY4qtafp5SucdScc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YyDtPafzXBXGW6CSdmKOFi4p4bFNPZQ5lWZtxCK1IT2g4vGCeNf5+Jwm/yrePvc8+
	 uh4701XgOdxQ2zg2CNaW/o816FS8sXybA58SVEwNpkXCy0WqQjd0xGuURpw49NYjGs
	 y8SPufuX8ut+Vz8Mc7HndVFpJK3zUPT0ROR5xiZJ7KBmaa8+ZAA7PNJ85IAQ+/itmi
	 gLMnh4z+llW56t7Ec7PhWYnkXabCsldqS1E243Wtm2JOSVldkR9Jg5Az4itQwDEN+c
	 B5cJWkT8Ufrz2ArdoaCPXWRlIG0z+VtEuorlB1FufbU18PRxFSCI7JhvxGoH3Cod3y
	 nHloG4Gbzd/gQ==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id C9/DF-64908-30EDEA06; Wed, 26 May 2021 23:47:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxVZf53ro
  Eg8mNTBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bX70+MBRe5K7r+dbA0MK7l6mLk4hASmMUk
  0b+llxXCOcEo8b6rj6mLkZODTUBNYvqtG0AJDg4RAT2Jq/9EQcLMAioSL373sIPYwgKeEmeXX
  WQBsVkEVCWe3nsO1sor4CixZsJssBoJAQWJKQ/fM4PYnAJOErN6V7GB2EJANZPv/GSFqBeUOD
  nzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSLw+fIl5AiP/LCQts5C0LGBkWsVokVSUmZ5RkpuYmaN
  raGCga2hopGtoaaZrZGiil1ilm6SXWqpbnlpcomuol1herFdcmZuck6KXl1qyiREYjikFR67t
  YDzw+oPeIUZJDiYlUd5rJ9YlCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgnXwbKCdYlJqeWpGWm
  QOMDZi0BAePkghv7y2gNG9xQWJucWY6ROoUo6KUOO9VkD4BkERGaR5cGyweLzHKSgnzMjIwMA
  jxFKQW5WaWoMq/YhTnYFQS5v0AMoUnM68EbvoroMVMQIuFEsEWlyQipKQamI7Ime5prNITayl
  WX9/EHl37UHzWA06f8wVlBvHzKnd+7n0zNfq6/aLA7nUGX3o+a9x1F3yf9dX6/w+ft/kBrTGr
  NO/OYojgvLTv1MFfPL8/aNvHPWnkcxE/9p11pc8+r1rnWeklR7XiXqr77rMxSTB/V/j46SSTZ
  qVLceHfo8Rmf6/OtBBvT7ouHeZ5e2HphqCojdtMP/NmhOdM8Hyg8UXgUWflkm/fFypO/3dy43
  wX3wclM3nTGK98XjKNNS0y/LZ7Xs/2qLMOHltecgfrLD0TP3/y+teTewTmaKwwummisi+O232
  i1TLpy4rlV2usks2T7a5MFud4NUVXb3cg0wlvv+J3nPsT586aMJuZUYmlOCPRUIu5qDgRABCH
  PpdCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-291.messagelabs.com!1622072834!222539!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21121 invoked from network); 26 May 2021 23:47:15 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-5.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 May 2021 23:47:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14QNlEKh008922
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 00:47:14 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 00:47:12 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-more-itertools: upgrade 8.7.0 -> 8.8.0
Date: Thu, 27 May 2021 07:46:45 +0800
Message-ID: <1622072806-6524-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1622072806-6524-1-git-send-email-wangmy@fujitsu.com>
References: <1622072806-6524-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Add runtime dependency to resolve errors that occurred when import more_itertools.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...itertools_8.7.0.bb => python3-more-itertools_8.8.0.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_8.7.0.bb => python3-more-itertools_8.8.0.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb
index 0cb61915bf..1c0e84d27f 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "c5d6da9ca3ff65220c3bfd2a8db06d698f05d4d2b9be57e1deb2be5a45019713"
+SRC_URI[sha256sum] = "83f0308e05477c68f56ea3a888172c78ed5d5b3c282addb67508e7ba6c8f813a"
 
 inherit pypi setuptools3 ptest
 
@@ -11,9 +11,13 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+RDEPENDS_${PN} += " \
+        ${PYTHON_PN}-asyncio \
+        "
+
 RDEPENDS_${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
-"
+        "
 
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
-- 
2.25.1

