Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.3279.1618466886020801099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 23:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=B41kU9gz;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618466884; i=@fujitsu.com;
	bh=iispOonD84J76crSpxMQCeeXLjECZwcYFl9rpBrpQVw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=B41kU9gzs23qbXz1iwJ9iI63lYH4LqWXwsg9ohWWYvY4oCVqJ/6eDbgOyummxAkr9
	 c0F4on1BbGnf3j9zDPfWyQ/79r7d2SBUYnstdJzK9R0khHu/yKMPc256HoE1eJ2yaF
	 D8mSJWvQhOAZ4ro+ZLsE9LnAERzpW+PXL6Nw2vnFz17BWhMXFnqsY6kOIg9yqCweMZ
	 3SF9aLBaTGIL6jutpA1mCLlrO9Ev2ww2aJ/zBsPb2hVfVjEL0j4fu+EYieb0du/Fbg
	 cGTNFJUiySD8/+ZcPeLqBRIW42x5yHkBSMoIFezmYy9nkL18k11TQw6ayU+7b7ypdh
	 lOPlHFcpGR/2g==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 63/46-14281-448D7706; Thu, 15 Apr 2021 06:08:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRout8ozz
  B4PoBXYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPJ/HusBbM5Kr4tM29gPMjexcjFISQwi0li
  yocFLBDOcUaJY6v+MXcxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfPewgtrCAlcSOO
  W8YQWwWAVWJzyensIHYvAJOEleufWQFsSUEFCSmPHwPNpJTwFli8r5FYPVCQDUvO2ewQtQLSp
  yc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyU61y9gnMDIPwtJyywkLQsYmVYxWiYVZaZnlOQmZub
  oGhoY6BoaGuua6RqZGOglVukm6aWW6ian5pUUJQJl9RLLi/WKK3OTc1L08lJLNjECwzGlkO3D
  DsYpbz7oHWKU5GBSEuU9tKIsQYgvKT+lMiOxOCO+qDQntfgQowwHh5IE745r5QlCgkWp6akVa
  Zk5wNiASUtw8CiJ8H67DpTmLS5IzC3OTIdInWJUlBLnlQFJCIAkMkrz4Npg8XiJUVZKmJeRgY
  FBiKcgtSg3swRV/hWjOAejkjBvDcgUnsy8Erjpr4AWMwEtrlhVCrK4JBEhJdXAxLLlv8TVHRe
  2WnMF7de/c3/hg1291x4Ih/pfvjpzFzvLJenZSyvTeYJVmqwmOxktOPuwS7B7avxBeWYeUfb0
  NP9tp37aNbDbdnG//5yq8rnz6f+vTM2aPqYF2w70rV7AfFZ6hpfrqlf/eoI2z+l79kia+a2Xm
  5rxJ8mlcw3mxQbMkbuj3Wvz3J9/xaP9lf52G8x/qBo4bv93bk/y1jkCR+rfcx//NfuJo85eX1
  0G6+rnsktbQ5+ePrPyaP0Miws7K0q2HjvwfYHZrSyr8w1fuX90bZReXHNt4vYSNd4C/QNrTMs
  cBFZe3lyt9r16y8cT4sstXjdJ2DHZfiy5aM9qYtGQMfkqi+D0vo8tSy7LbVdiKc5INNRiLipO
  BADknh2VQgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-248.messagelabs.com!1618466883!224436!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28346 invoked from network); 15 Apr 2021 06:08:03 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Apr 2021 06:08:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13F682s7005084
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 07:08:03 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 07:07:34 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] man-pages: upgrade 5.10 -> 5.11
Date: Thu, 15 Apr 2021 14:07:19 +0800
Message-ID: <1618466841-24292-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1618466841-24292-1-git-send-email-wangmy@fujitsu.com>
References: <1618466841-24292-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../man-pages/{man-pages_5.10.bb => man-pages_5.11.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-pages/{man-pages_5.10.bb => man-pages_5.11.bb} (91%)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.10.bb b/meta/recipes-extended/man-pages/man-pages_5.11.bb
similarity index 91%
rename from meta/recipes-extended/man-pages/man-pages_5.10.bb
rename to meta/recipes-extended/man-pages/man-pages_5.11.bb
index 8874516aa2..3cd0bc5259 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.10.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.11.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=207f70f56526417514ac46b6680e314f"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "f2ce94a7250c49910db91806996699e1deac656097d4d53bdf56bdab4b61f228"
+SRC_URI[sha256sum] = "3759aee7cd4a229173d3cb651fbba438777bee6206da8d75ea04caaa7c8662b0"
 
 inherit manpages
 
-- 
2.25.1

