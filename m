Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.5205.1622709724306841626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 01:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GiW8u6uv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622709721; i=@fujitsu.com;
	bh=pbRajjsfjpSG3K9/VfYWUOCQ5n7tkKZwR0dVyBG7khg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GiW8u6uv4xKdvqB6Fqk9elYRrxPbL5RYMUaJpmimibmdibGpeG/+R5OlYrTEF7d54
	 B/lpb0qfGv1SHzTKkNKlQIUsNuiHnbSGYtVPusgLtqSvj3+48/qLxz1jQJIVC51QZT
	 OMn3H01Xt4wdD4goaRwaFXtvRxBMM2adCd3FfF6JRL20K1CYD4rKk1/6YPFFxXGYQv
	 dwnLnM0Q0QBaP4SdcMum9IUxcPeaGxwcgx09WNgv7RNqIVKor437s4gdl9Zb7vz4qB
	 t/z5wPv79Ci0KxkH4i8nhzAYVPeji7ZK+CbmDcYQuxNcqsO4vMZDhy7L6FvI0lSm83
	 I+jdh/EnHY9jw==
Received: from [100.113.4.24] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 18/A5-27273-8D598B06; Thu, 03 Jun 2021 08:42:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxVffG1B0
  JBq/m61nc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBmbnz9nKfjCUbHpySaWBsbZHF2MXBxCAjOZ
  JJrm7mXvYuQEco4zSizpZwOx2QTUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x6wcmEBZ4nLX
  1ezgtgsQPHN/+eBtfIKOEk8Xv8CLC4hoCAx5eF7Zoi4oMTJmU9YIOZISBx88YIZokZRYvblZh
  YIu0Li9eFLzBMYeWchaZmFpGUBI9MqRsukosz0jJLcxMwcXUMDA11DQ2Ndc10jY0O9xCrdJL3
  UUt3k1LySokSgrF5iebFecWVuck6KXl5qySZGYHilFLI/38G46s0HvUOMkhxMSqK8d9p3JAjx
  JeWnVGYkFmfEF5XmpBYfYpTh4FCS4E2bApQTLEpNT61Iy8wBhjpMWoKDR0mEtx4Y7kK8xQWJu
  cWZ6RCpU4yKUuK8i0H6BEASGaV5cG2w+LrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZi3GG
  QKT2ZeCdz0V0CLmYAWC3htA1lckoiQkmpgmmgfcLDwm5TMpO73StbWMzYfiLnl0iCay/HRa51
  dwVezMxsNu/MZD7DH3Nut/CMmfW5nygct741vnq9f8teX9WPT46KMR6v+lB81fmawNJjp50W9
  q8cdLkzvCenf89o6cKmLVem9C19NTDwYd2Ue47ji2hZ7ZolFkbmGpa9NnG/cxoWf2lrZD4UZq
  3rc3Pj0tYZl/GM3C735B3vvRhfc33FYvOtTaoJD2ybxB81L4zK3/th0cGWGyumqU6KN5VfTTy
  /843dxs+nypR5egRuTezdci3a2eN49r+PFpTMP10ceybKecczvVdSeS1+32x5uP+aguq2Oj/3
  ywe6MT7PvdCx2tzosfKgoqO5IkdqPeCWW4oxEQy3mouJEABAsgXoqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-245.messagelabs.com!1622709720!12235!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13762 invoked from network); 3 Jun 2021 08:42:00 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-3.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2021 08:42:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1538fsvd007353
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jun 2021 09:41:59 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 09:41:52 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-libarchive-c: upgrade 3.0 -> 3.1
Date: Thu, 3 Jun 2021 16:41:39 +0800
Message-ID: <1622709699-26384-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-libarchive-c_3.0.bb => python3-libarchive-c_3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-libarchive-c_3.0.bb => python3-libarchive-c_3.1.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb b/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-libarchive-c_3.0.bb
rename to meta/recipes-devtools/python/python3-libarchive-c_3.1.bb
index d29195545f..debd1f119d 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb
@@ -9,8 +9,8 @@ PYPI_PACKAGE = "libarchive-c"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "920885f5910aa8245e30896996e0415b"
-SRC_URI[sha256sum] = "6f12fa9cf0e44579e5f45bbf11aa455a930fbfdb13ea0ce3c3dfe7b9b9a452ba"
+SRC_URI[md5sum] = "8c62da42a8b9bd24642e5430427e6f5a"
+SRC_URI[sha256sum] = "618a7ecfbfb58ca15e11e3138d4a636498da3b6bc212811af158298530fbb87e"
 
 RDEPENDS_${PN} += "\
   libarchive \
-- 
2.25.1

