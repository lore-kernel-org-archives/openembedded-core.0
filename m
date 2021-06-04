Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web08.3135.1622773121043272625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 19:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZJSVA7cm;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622773119; i=@fujitsu.com;
	bh=exjFxeG5wRLh06/rGXks/Q3W3ouMzUnhk83OOXLlujo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZJSVA7cm8vbRw/VIXg3D7Vz3aUeZ3hHsGQtVmsdbHUFFb8sw4QEmeZygMbkhfGcIq
	 I/PgE9oj9fdQWe8p1HF1tQRU21D+qB7y49ykeNi6dgfZR+CSVmwa/AchQCN82SaAuH
	 5hkNWhKsLi/7aSpBE5B2EAn+KNrTYQDgJCK9+HOYM6sTh1mEh9jlICu8qY3BE2fT9W
	 NM2/syfFFtIXpQESWwTKLN7v/bsQyn+OwxslQizoMJ7xT98fWzugMu8il0Mvl/alYQ
	 JODTAJ1xG7ZvCh99HIdb4e/bzUcA6WMU0YLuVAR7K8XkTTXHJKnqRyHpq0eaWMYQ96
	 LkYoizAl/hTug==
Received: from [100.113.2.110] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id DE/1A-19780-D7D89B06; Fri, 04 Jun 2021 02:18:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRolvbuzP
  BYPFSRYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPJ78ssBeu5Ko5PW8zewLiFs4uRi0NIYCaT
  xNy515ggnOOMEl+3zgdyODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvHnYQW1jATaLry
  iIwmwUoPnP6BxYQm1fASeLs4W9sILaEgILElIfvmSHighInZz5hgZgjIXHwxQtmiBpFidmXm1
  kg7AqJ14cvMU9g5J2FpGUWkpYFjEyrGC2TijLTM0pyEzNzdA0NDHQNDY11DXWNjMz0Eqt0E/V
  SS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgQGWUsj4aAfj6dcf9A4xSnIwKYnybg/emSDE
  l5SfUpmRWJwRX1Sak1p8iFGGg0NJgndXF1BOsCg1PbUiLTMHGOwwaQkOHiURXt8eoDRvcUFib
  nFmOkTqFKOilDhvEUhCACSRUZoH1waLsEuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkTQa
  bwZOaVwE1/BbSYCWixgNc2kMUliQgpqQYmwf93Ul+VR60wfes+ccWB6C2NJ+9cEd35oy6wp80
  rlG92+Y8H+WbVM6U/n37a+mLBoeIZ1VINi03cjjwUdzXeKCevVJ32/Idk+oWc9YW/fZt0kpv3
  Vld2LLDjWL1n08muwh+/ZWcsWvwln8EgpmDqze3Wu6/xbdk7l3fB0cfbm293S2mfLKya+CXza
  0X34nLPl7VNjB8730lydXuzHNNdPiV5U2rYgrbJH7pKvY4vzbx7de/PtXyFHyYlx8Q2GRZNmv
  Po+GEnf44vItduii2VncN9ac3Jgwzn1yiutBIJbGd4/f582+7Hmxze8R6L6Wb2/Pkq+uQFHwf
  Wwg7X3wXpbIrtBsnV7oz1BcGC5/N8lViKMxINtZiLihMBFbj3YisDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-228.messagelabs.com!1622773116!214719!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18648 invoked from network); 4 Jun 2021 02:18:37 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-11.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jun 2021 02:18:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1542IVHu003473
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Jun 2021 03:18:36 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 4 Jun 2021 03:18:29 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] python3-libarchive-c: upgrade 3.0 -> 3.1
Date: Fri, 4 Jun 2021 10:18:14 +0800
Message-ID: <1622773094-28550-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Add runtime dependency to resolve errors that occurred when import libarchive.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-libarchive-c_3.0.bb => python3-libarchive-c_3.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-libarchive-c_3.0.bb => python3-libarchive-c_3.1.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb b/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-libarchive-c_3.0.bb
rename to meta/recipes-devtools/python/python3-libarchive-c_3.1.bb
index d29195545f..d8f7862f92 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb
@@ -9,13 +9,14 @@ PYPI_PACKAGE = "libarchive-c"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "920885f5910aa8245e30896996e0415b"
-SRC_URI[sha256sum] = "6f12fa9cf0e44579e5f45bbf11aa455a930fbfdb13ea0ce3c3dfe7b9b9a452ba"
+SRC_URI[md5sum] = "8c62da42a8b9bd24642e5430427e6f5a"
+SRC_URI[sha256sum] = "618a7ecfbfb58ca15e11e3138d4a636498da3b6bc212811af158298530fbb87e"
 
 RDEPENDS_${PN} += "\
   libarchive \
   ${PYTHON_PN}-ctypes \
   ${PYTHON_PN}-mmap \
+  ${PYTHON_PN}-logging \
 "
 
 BBCLASSEXTEND = "native"
-- 
2.25.1

