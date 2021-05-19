Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web09.1408.1621468453710578742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 16:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y0OkIxLZ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621468450; i=@fujitsu.com;
	bh=s0O8BM7ih/fkSCgj2SDEWMm8AxVoS4kOJ2wxwi70oNU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Y0OkIxLZTuKpZAJfmxCYzz5ryhQSFn8aol0tiBVELfkbx21ZfxD3gNUp8U8K0ZE1F
	 +8zeLXyFCr5j2Lvi+5CCkT7Em4kaHhNto/RdNyWV1hyXFZ4//08SkhIb/Q02kgwmTI
	 Td5NIZDbd4E5LgD6hQwRlE2F81HvbaroJYNM839bcjwh3ic2/XxHIegVNxQyOA5RWt
	 SwqQktc/rBnYcruyHBLIKJE8VOmrrq5TiR0HScA1wOTMornETB8Zl/Jb64eBU+Zx0f
	 xU+mGCev/Cyylv+cK0NeSoGyhE66OEZ4FZT9U8fnLsIRzNPlFnAYb7NufRQmCfUwDo
	 txraot5C3fZyg==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 3F/2B-16595-225A5A06; Wed, 19 May 2021 23:54:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRWlGSWpSXmKPExsViZ8MxRVdx6dI
  EgwvbTC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oyXB74wFxxkr7g2qYWlgfEsWxcjJ4eQwCwm
  iQ/bMiHsE4wSmw/kgNhsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3DztIWFjAXGLi3nKQM
  IuAqsTFXR1gE3kFnCROvr3CBGJLCChITHn4nhkiLihxcuYTFogxEhIHX7xghqhRlJh9uZkFwq
  6QeH34EvMERt5ZSFpmIWlZwMi0itEiqSgzPaMkNzEzR9fQwEDX0NBY10jX1FAvsUo3US+1VDc
  5Na+kKBEoqZdYXqxXXJmbnJOil5dasokRGFgphUzGOxivvf6gd4hRkoNJSZTX7P6iBCG+pPyU
  yozE4oz4otKc1OJDjDIcHEoSvNMWL00QEixKTU+tSMvMAQY5TFqCg0dJhFdjClCat7ggMbc4M
  x0idYpRUUqcd/YSoIQASCKjNA+uDRZZlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ81qCTO
  HJzCuBm/4KaDET0OL/jYtAFpckIqSkGpjEd6+x3WG12KxeVHhLVOrRfXNr13/jyTOsULulL7J
  FatKEnO37PSqan3UlavZlCP419Kmu0lxpVVNzPIvLr+G8tS+f2t4L7Wdar/z69PvTXePZx6dK
  Lcu73OEV/q/rTpRkzy4NHa9dvjJK25bn24qfcXqQdUvwrePfLStXpi2sY14unCzpesjrgWR8o
  Z7ymUtzT/cViJ9crNJr7TKb1bFuouUvu3fz9zz9tyVDfMnls78WLNzNuOBTvvfnY96CBj4vmk
  W+PXH1k9RxjpyXcijzm6n4w9NPfkee2GgrrfR6W+/KX36iLGo/N6ev2F7c+/pKrqyp1/b4rg8
  uKVtFXh1m2VZ9oGh3zjv3y1fUDJiVWIozEg21mIuKEwERTBBWJwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-226.messagelabs.com!1621468449!65001!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23260 invoked from network); 19 May 2021 23:54:09 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-9.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 May 2021 23:54:09 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14JNs9OF010007
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 00:54:09 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 00:54:07 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] distcc: upgrade 3.3.5 -> 3.4
Date: Thu, 20 May 2021 07:53:51 +0800
Message-ID: <1621468435-21509-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/distcc/{distcc_3.3.5.bb => distcc_3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/distcc/{distcc_3.3.5.bb => distcc_3.4.bb} (98%)

diff --git a/meta/recipes-devtools/distcc/distcc_3.3.5.bb b/meta/recipes-devtools/distcc/distcc_3.4.bb
similarity index 98%
rename from meta/recipes-devtools/distcc/distcc_3.3.5.bb
rename to meta/recipes-devtools/distcc/distcc_3.4.bb
index 5c2644199e..3bab6d53eb 100644
--- a/meta/recipes-devtools/distcc/distcc_3.3.5.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.4.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/distcc/distcc.git \
            file://distcc \
            file://distcc.service \
            "
-SRCREV = "8572e2a1af39e69b2a2d74622fed6d2dd7dca9b7"
+SRCREV = "50d821efe99cae82c05be0a4ab3b4035ef0d3883"
 S = "${WORKDIR}/git"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1

