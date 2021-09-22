Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.7110.1632316449947091730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 06:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cfzWPHQ1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632316447; i=@fujitsu.com;
	bh=NqaarxKpDUfC27Dy2067j5tRVll6u42SWKwmBQfSynk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cfzWPHQ1SiTVd1Q46yFvaDbCkwEFV94fmnqn5tOT+Kkl8tXesCLvEnfMARcG8I3Gw
	 KSFfjNO8tXHv3lWaaPJWFme+miC+Hrld7jtJ5PLA4PWccSMuDdmqLFlOdK3axBkiOZ
	 B5BsRhR0v9DkA0RHgHhVP0FKALktzlhXuNS1UK/EeMsDOwNZyNrRDuNKKUYLoTLanC
	 rMT/ZM9kInQ9eT4ZvPDmV4zzifuJjVQmBCPUFbAWx3WWEpbTdO4B5dayrBIRVTq1nS
	 Ki8k4eHLNtyTzcswpiG6z+xHZDTRe1trGK6g/0aK74BUkWT+D5uKLHoATX34lQprUC
	 vFFi4MPHznrpw==
Received: from [100.113.6.157] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 57/DE-23595-F1C2B416; Wed, 22 Sep 2021 13:14:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxVVdexzv
  R4FqjgsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnFk92f2gsWcFZv3bmJtYPzP3sXIxSEkMItJ
  4tnzC4wQzglGiQWbD7N0MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3z3sILawgInEz
  IULwGwWAVWJddPOgbXyCjhJPP/VygxiSwgoSEx5+B7M5hRwlvgxexOYLQRU8+DNNmaIekGJkz
  OfsEDMl5A4+OIFVK+ixOzLzSwQdoXErFltTBMY+WchaZmFpGUBI9MqRsukosz0jJLcxMwcXUM
  DA11DQ2NdcyDLVC+xSjdJL7VUNzk1r6QoESirl1herFdcmZuck6KXl1qyiREYkCmF7Jk7GCe/
  +aB3iFGSg0lJlFfoileiEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQleD23vRCHBotT01Iq0zBxgd
  MCkJTh4lER4BUHSvMUFibnFmekQqVOMilLivBEgCQGQREZpHlwbLCIvMcpKCfMyMjAwCPEUpB
  blZpagyr9iFOdgVBLmlQKZwpOZVwI3/RXQYiagxfwrPUAWlyQipKQamDzNq3/d4DHXe1O37+H
  nz0vPLrGSrgksl/svkPXe/e+khVs+6O979ZWJT/fnR5X8nrzvr4q4/s7Zuoopuu/ClsKEa5eU
  vwTmaz8OlSjx/FP0d2vaYyZm+YqWHWtTFll9ad/Hp96ln63py+1sbvsz2bn9W61Hts70+yFyX
  BxhWxmvKh8/79J0wWpRUPrkzVxy38UvNR04/Lfl9orLR51Ome902ZK58KaxieM2gciWxuzz/m
  57S7V7pT23PGt1TuJYIua9PInje5jgg+9s1b9tgtu4sk2Ple9q/bs8qXr5vavPpCo/W95uNFE
  5Mefv+lVxk4KE81SutLwtdWI9Gq6au4T/+vFTp5dU/PFikXf8pMRSnJFoqMVcVJwIAArZoT1D
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-238.messagelabs.com!1632316447!44196!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22985 invoked from network); 22 Sep 2021 13:14:07 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-2.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Sep 2021 13:14:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18MDE3Zl010429
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 14:14:07 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 22 Sep 2021 14:14:04 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ell: upgrade 0.43 -> 0.44
Date: Wed, 22 Sep 2021 21:13:36 +0800
Message-ID: <1632316416-58153-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1632316416-58153-1-git-send-email-wangmy@fujitsu.com>
References: <1632316416-58153-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

ver 0.44:
        Fix issue with allowing zero byte input for AEAD cipher.
        Fix issue with filling in DNS info in DHCP lease objects.
        Add support neighbor discovery utility helpers.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.43.bb => ell_0.44.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.43.bb => ell_0.44.bb} (90%)

diff --git a/meta/recipes-core/ell/ell_0.43.bb b/meta/recipes-core/ell/ell_0.44.bb
similarity index 90%
rename from meta/recipes-core/ell/ell_0.43.bb
rename to meta/recipes-core/ell/ell_0.44.bb
index 3d3ef82668..d1f1691645 100644
--- a/meta/recipes-core/ell/ell_0.43.bb
+++ b/meta/recipes-core/ell/ell_0.44.bb
@@ -17,7 +17,7 @@ inherit autotools pkgconfig
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-pem.c-do-not-use-rawmemchr.patch \
            "
-SRC_URI[sha256sum] = "b6c75895ad64bf78f5b5c464de871048d02f9403be518084e0d64b58f508c9fc"
+SRC_URI[sha256sum] = "41a6f8fa4d285b52cb7a5a87bda3e7370ecaac02d94aaa7ec1a23f0480b8bc3f"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1

