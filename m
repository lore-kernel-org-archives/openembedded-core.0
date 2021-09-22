Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web11.6810.1632316449479562762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 06:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jTqomtww;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632316447; i=@fujitsu.com;
	bh=+VFfip7RKpUc5aQRnzXy9+E+TO5t5H9JzO+T3on39ns=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jTqomtwwUVV5UKxxA2oLUpZps3omgngSR56K6Epv8lggKWGAekJ5KuSuwkFiOMAPS
	 FMS6/NWnISOmsgun5eTUzllkpp0kcsM+kqxcxZDgfhHK0tsbDyMqV4FjYu5H4Ffj8u
	 hDKdBNUL0bR3vhMyfP4ZPIMIVzywj5ntdhKtLrJQSL86dMniRX4T7KwLN6427OO2gT
	 /NpG4ZPVdHiAWIZYg5jINC16dTuPlKsgKRv6Tsu4QgISyDlqg1KEaU9yN7OEVOPBHQ
	 8J/DhP8SAr7RocllSp+cFP8RR3beSyzeOCSKA1Ap1fDjRz01EVJSb1T4rWD9YbypHE
	 wCgln9NPS9mJw==
Received: from [100.112.195.47] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id AD/9F-14609-F1C2B416; Wed, 22 Sep 2021 13:14:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxVVdexzv
  RYOoxWYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaPvnm3BYvaKNQtfMDcw7mbrYuTkEBKYxSSx
  9h5fFyMXkH2CUWL7uRksIAk2ATWJ6bdusHYxcnCICOhJXP0nChJmFlCRePG7hx3EFhYwk/j6b
  x2YzSKgKnHt3AWwmbwCThL9E64zg9gSAgoSUx6+B7M5BZwlfszexAyx10niwZttzBD1ghInZz
  5hgZgvIXHwxQuoXkWJ2ZebWSDsColZs9qYJjDyz0LSMgtJywJGplWMFklFmekZJbmJmTm6hgY
  GuoaGRrqGlqa6hqaGeolVuol6qaW65anFJbpAbnmxXnFlbnJOil5easkmRmAophQcnr6Dsf/N
  B71DjJIcTEqivEJXvBKF+JLyUyozEosz4otKc1KLDzHKcHAoSfB6aHsnCgkWpaanVqRl5gDjA
  iYtwcGjJMIrCJLmLS5IzC3OTIdInWJUlBLnjdQCSgiAJDJK8+DaYLF4iVFWSpiXkYGBQYinIL
  UoN7MEVf4VozgHo5IwrxTIeJ7MvBK46a+AFjMBLeZf6QGyuCQRISXVwOQftMw38fHc5AyRX4/
  32e2IYjd4cs9rwf99mree9Ks+tX9Vxz179rVTdda71p5IipS33JJ/tNnQXUXyeGewzoJvKqGH
  Zshdjano006yWhYXl6n8YsnHP75PbufMfV9wuuWsie3E7vsfmX4vYBb+dt7zmZ7M1h63SVeeK
  Bo+vGOlefTBBX/tFXGzHJhfML5qvB3dJpRtYNd2vLVDsU6F8XWAS16NrPFcObVAHRXZ9GPmdm
  dWbijwl/73ZtV/5oVvC6STBfaVmEWeX31Gtmj25ol3n1cfvZG5r4Z/op1U7LnvH0pCnYPcZmU
  ar7U4kCBx6MVXJ6bt1kXnEyZz7GrinH+Lwd9zqeyx6Ud/zqsLlFFiKc5INNRiLipOBADFZfRH
  QAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-271.messagelabs.com!1632316447!565938!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10868 invoked from network); 22 Sep 2021 13:14:07 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-5.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Sep 2021 13:14:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18MDE3Zk010429
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 14:14:07 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 22 Sep 2021 14:14:01 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dnf: upgrade 4.8.0 -> 4.9.0
Date: Wed, 22 Sep 2021 21:13:35 +0800
Message-ID: <1632316416-58153-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1632316416-58153-1-git-send-email-wangmy@fujitsu.com>
References: <1632316416-58153-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dnf/{dnf_4.8.0.bb => dnf_4.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.8.0.bb => dnf_4.9.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.8.0.bb b/meta/recipes-devtools/dnf/dnf_4.9.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.8.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.9.0.bb
index f51d74797d..27df88342e 100644
--- a/meta/recipes-devtools/dnf/dnf_4.8.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.9.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "e7b29753dce94769d30f92e671f55863985d24f0"
+SRCREV = "f85cf31395156a2aa5d75e894e5794a771054fe4"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

