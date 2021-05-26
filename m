Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web08.279.1622072847697517666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 16:47:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aWbaoklH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622072844; i=@fujitsu.com;
	bh=ack9ylutfoqcF13lJvzgUB7I9gQKKJYXQobOKUKRVyg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aWbaoklH7Yc9jeTRil1h4X1fXMv8xCLqXYV4PAcm3COXy/X3G8/2A6pKRaWC9kWZF
	 QsN11ZQrzEeAHFbqG2MDEGhazZT5nJ8rKb357pDvMhD8DOT6SNpjR1Pka8Zt/ju+yI
	 h7aTQZ1TVvWk3nPuRvxoOT8SgR/E5CdOVnIhDJ+jX1YZoVt8OFe4KiPSOlgkM23OMb
	 bjlXdp9Qb6Efmpu2AruT4kMGpMYnzGO/HrS/JKNFm6cZsgN3lckkBhm0LA5Z5lmhbd
	 GaBizmLh4JD0bL+v0xNA8Cb6V5c18mSqXTeM/tn/UmYl34WWFp+LYJEAe8TqWN1V+q
	 5O/9ger+aXNOA==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id D8/60-33893-B0EDEA06; Wed, 26 May 2021 23:47:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MRqst9b12
  CwZ718hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bU/04F9zkqZrUuZ25g7OHoYuTiEBKYxSTx
  adIDdgjnBKPE5J1NjF2MnBxsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3DzuILSzgKPH4+
  S82EJtFQFViz8wPLCA2L1C88/h5VhBbQkBBYsrD98wgNqeAk8Ss3lVg9UJANZPv/GSFqBeUOD
  nzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSLw+fIl5AiP/LCQts5C0LGBkWsVokVSUmZ5RkpuYmaN
  raGCga2horGuka2qol1ilm6iXWqqbnJpXUpQIlNRLLC/WK67MTc5J0ctLLdnECAzGlEIm4x2M
  115/0DvEKMnBpCTKe+3EugQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryTbwPlBItS01Mr0jJzg
  JEBk5bg4FES4e29BZTmLS5IzC3OTIdInWJUlBLnvQrSJwCSyCjNg2uDReMlRlkpYV5GBgYGIZ
  6C1KLczBJU+VeM4hyMSsK8H0Cm8GTmlcBNfwW0mAlosVAi2OKSRISUVAPTvriznXc8Nxz591r
  H/OebiTG5+u+8nmnVzckS3vhL6F303ZcrnkutXJR42fH36/aPl2fZ6Ds/23q8o0Ox8GjFoikS
  M1rMhS7cn9pZK7gwNdT+TeDta3FPDL7btL1jO/5+r7WYvPJLWbX5/+v2mrHUWj9dfVB/s96b1
  JlPL1ltu8yckt/dmugma9n5ZO6M+QzbEoKaJwn9YBBge1abuqqq61baGpFFa3o2yD3wdc8rUq
  moUG+b+HPh71y3krPnTmwwNk0Ks1tW7rzkcvSxCSq7GI5JdOarPqw+e0kqaMrLzFNJilnahmH
  X8g7+XZZpFrQmy2Z6pfActWmhLX/4zQU33p2zyCR2b+2U44bP1lT3K7EUZyQaajEXFScCAElM
  AfRBAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-226.messagelabs.com!1622072842!65756!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16945 invoked from network); 26 May 2021 23:47:23 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-24.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 May 2021 23:47:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14QNlMgg018025
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 00:47:22 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 00:47:21 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest: upgrade 6.2.3 -> 6.2.4
Date: Thu, 27 May 2021 07:46:46 +0800
Message-ID: <1622072806-6524-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1622072806-6524-1-git-send-email-wangmy@fujitsu.com>
References: <1622072806-6524-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_6.2.3.bb => python3-pytest_6.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_6.2.3.bb => python3-pytest_6.2.4.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_6.2.3.bb b/meta/recipes-devtools/python/python3-pytest_6.2.4.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_6.2.3.bb
rename to meta/recipes-devtools/python/python3-pytest_6.2.4.bb
index 7fb7baf188..fa43e6ebf0 100644
--- a/meta/recipes-devtools/python/python3-pytest_6.2.3.bb
+++ b/meta/recipes-devtools/python/python3-pytest_6.2.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
 
-SRC_URI[sha256sum] = "671238a46e4df0f3498d1c3270e5deb9b32d25134c99b7d75370a68cfbe9b634"
+SRC_URI[sha256sum] = "50bcad0a0b9c5a72c8e4e7c9855a3ad496ca6a881a3641b4260605450772c54b"
 
 inherit update-alternatives pypi setuptools3
 
-- 
2.25.1

