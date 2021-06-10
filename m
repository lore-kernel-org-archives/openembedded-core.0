Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.6301.1623305061330514133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 23:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=y0kgtwsP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623305058; i=@fujitsu.com;
	bh=mvDeSyqzp6uBlaqbdiDDJMWIlI56oddQAmEHmiLHkyc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=y0kgtwsPu1kKC/xPZFWvFZlMmyf9iTQSKCjNZQiP4fvLPr3/1BLmoeXJg/kGxGzaF
	 HQzkGvyeXgfr8dh4k9KRp3+oEXTYFa+5A9kHr6orgmQ8z32vfkORSZsfxORuaFnDm+
	 x5zqMjfbEtIWim3DjLYIL4zkua/sR9kHwlMcQBGaY3tzTQyNVl3mxVzyBDxkNX64hp
	 cmlVJPjSKzx9G/GBx+hQU4F+ZIyfzw3XS9E+7eZVFlNWvelASkKMn+Os7uTh3bQMj7
	 y2ySypQ3xdlzcWyMZZTErZTWgyAwBMlNnZzIFVLhWbVmVBH4MlYJVIY6Yrv493kUrH
	 hSBAiz7Y1zRTQ==
Received: from [100.113.2.110] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id F4/C2-37841-26BA1C06; Thu, 10 Jun 2021 06:04:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxRTdh9cE
  Eg8fneS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ozVvxewF7RzVDzY2sTYwLiKvYuRi0NIYBaT
  RPOruywQzglGiRvXXzB1MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3z3sIGFhAUuJR
  1NMQcIsAqoSq2fPYgWxeQWcJH7t3c4CYksIKEhMefieGSIuKHFy5hMWiDESEgdfvGCGqFGUmH
  25Gaq+QuL14UvMExh5ZyFpmYWkZQEj0ypGy6SizPSMktzEzBxdQwMDXUNDY11jXUNLE73EKt1
  EvdRS3eTUvJKiRKCsXmJ5sV5xZW5yTopeXmrJJkZgeKUUMh/awfjk9Qe9Q4ySHExKory3FxxM
  EOJLyk+pzEgszogvKs1JLT7EKMPBoSTBG7cSKCdYlJqeWpGWmQMMdZi0BAePkgjvrBVAad7ig
  sTc4sx0iNQpRkUpcd73IH0CIImM0jy4Nlh8XWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzC
  u5CmgKT2ZeCdz0V0CLmYAWOxrvA1lckoiQkmpgEo7oevt73nzj1E3BXHOePtgq9tLURs53t/T
  hgypTDp1danfe4DrHDevbTox/XL07+V7sqzqVK31yybFPhvOXFz6U+93oNyHKxVns7qLXS/JD
  7pYs+/XWqif2ipOProFhwt0du2sEJ7HFBl3ze3KU6fWB9uK5T+KNmRlVjZvifCZqBP5X5j+sv
  bdnu7Z2Ic8CliuHHn5yuu5caLP3w/uiX57uEkIHJvBEJ12817yWSWvnTvZ5y1YpTnl/n2X7lg
  lnF2ssP/s3JIJFe2XaW7vrR3esnX75ceBaxTlx7SWbe7ic4rk9k2dqnPAt9ZnUcUvR/EeR5su
  HTBp3DlppcSnM/2oi9uyviu+CKXf2lK6wEVdiKc5INNRiLipOBABmetIdKgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-226.messagelabs.com!1623305055!20005!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22304 invoked from network); 10 Jun 2021 06:04:16 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jun 2021 06:04:16 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15A64AOX000818
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 07:04:15 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 07:04:08 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] diffoscope: upgrade 175 -> 177
Date: Thu, 10 Jun 2021 14:03:49 +0800
Message-ID: <1623305030-45242-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_175.bb => diffoscope_177.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_175.bb => diffoscope_177.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_175.bb b/meta/recipes-support/diffoscope/diffoscope_177.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_175.bb
rename to meta/recipes-support/diffoscope/diffoscope_177.bb
index 853f8dd3a0..0d9061dda0 100644
--- a/meta/recipes-support/diffoscope/diffoscope_175.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_177.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b87481752815140e35088647ccdea13297e41a2d72772e842590360b662f7533"
+SRC_URI[sha256sum] = "8ac0cad150914bab2a53caa3f21876a78b092f3d2a36b9134874cd5c04a26b2e"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.25.1

