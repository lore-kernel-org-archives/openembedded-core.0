Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web08.6158.1619700205006835545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 05:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ye8WFSB8;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619700203; i=@fujitsu.com;
	bh=5s1sae4LHwiczgSA1GDeiYgSqLKLo0+ovjjTLCKDKAg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ye8WFSB857gtGszzeaSY3HXYrV8vREoikMXOOwQwT/JGZW3euaDv8x8Z+UNjmz+HK
	 7WFg2tUANR+WVHzmeNS0IKkBCmGr/OP0K96l33aU6ajKL0sDdsIG7rUpjNNxcLJ4wO
	 2boa7MTDJ3LDDcQ8NYwNVnfkPBDGCjyeiG/RcK+TeOBnjOj6yfIebVvVmhIMN72hHU
	 tt9uVjM2sbkz5bmsmwSejvJDQjXwuvPzRHjNdYixbA9dHlZl3bDuVtbDzGkuKId6OG
	 zGo2g0RAKZeJXNqQ4PsiaQ2X+TA03NMvSkMbyLDFtALugmrIPrfmKYcJh/3IWK0eGs
	 Xd0enOK7VgEeQ==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 8C/64-64503-AE9AA806; Thu, 29 Apr 2021 12:43:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYovtqZVe
  CwcwZGhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8avxqVMBY84Kx6sPMrawPiZo4uRi0NIYBaT
  xO0ZixghnN2MEjMuX2DrYuTkYBPQlTj3eC17FyMHh4iAnsTVf6IgYWEBJ4lVnyczgYRZBFQl1
  i41AwnzCrhL7N/yH6xTQkBBYsrD98wQcUGJkzOfsIDYzAISEgdfvGAGaZUQUJSYPV0eorxSYv
  u0s4wTGHlmIemYhaRjASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNLC11Dc2O9xCrdJL3UUt3
  y1OISXUO9xPJiveLK3OScFL281JJNjMAQSik4tnYHY8+bD3qHGCU5mJREebd0diYI8SXlp1Rm
  JBZnxBeV5qQWH2KU4eBQkuDdsKIrQUiwKDU9tSItMwcYzjBpCQ4eJRHeImBIC/EWFyTmFmemQ
  6ROMSpKifPOBOkTAElklObBtcFi6BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4OkCk8mX
  klcNNfAS1mAlq87HwbyOKSRISUVANTyJXmfW2GnacuLWFZGiL6s3Hb7N9nnk13+qMzS/nR9pt
  5/2TNTxVu/zXxRJDQ5pDIygjuhM2ac92Wrlha+eOknqeMcoKa/wdjTgGpxjsHBc82zFN+mr6v
  svpCte7mohu300OON27Lmr7i8607UyayFBUab5vRnv14+ZX3m8wETwRnzNN9LepamNh2Kf7Kg
  46d2c/6Hubbbtsyu63t9P7D195cCG30azp1YOeehlMVG7sOvirJ/nrjc5Rkj/6XvWGly9TVjp
  jOjsjZnGTvefXgh2tdiyxWhz6sevomuIf/6gSvLd8u5xd8iZb2e3JIZAP/NNO5+x7n5WTWGdd
  aLmBkvXva12qnuPbfO0+qIiZI6imxFGckGmoxFxUnAgAXTQW5HAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-287.messagelabs.com!1619700202!258796!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8373 invoked from network); 29 Apr 2021 12:43:22 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-12.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2021 12:43:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13TChMTh021813
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 13:43:22 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 13:43:20 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-numpy: upgrade 1.20.1 -> 1.20.2
Date: Thu, 29 Apr 2021 20:43:10 +0800
Message-ID: <1619700190-5500-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-numpy_1.20.1.bb => python3-numpy_1.20.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.20.1.bb => python3-numpy_1.20.2.bb} (96%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.2.bb
similarity index 96%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.20.2.bb
index 6c3b886782..0a60ca7467 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.20.1.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.20.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "9bf51d69ebb4ca9239e55bedc2185fe2c0ec222da0adee7ece4125414676846d"
+SRC_URI[sha256sum] = "c049f410c78e76ffb0af830a8afbdf8baac09897b4152b97b1a3b8345ee338ff"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1

