Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.1224.1622078758227887516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 18:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sq09bTDS;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622078755; i=@fujitsu.com;
	bh=W0mASOB7KoxEp301PRQAo0095tPtd1l2fqUpPTavaYc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sq09bTDSNgKtELjgQvpm1727NG3Ix58LAYn378PeHklm9S1eJZQlm5MrbZ/cA16Wn
	 T27VeSXOqYwMjC7g7+GAZRvaiDsxk10vqXzFCPoUj+P+CrfOekvgxpwoacTIfqQwLT
	 hcXsH0RmiNG8ZBPSObERG6QcGuxqJZrMk/h+Vg4X9xhCg6sALD4CBp10CX3l1GmCjF
	 koUVbtB9vDh88Tki+Lwa9etMZ74pL484WaqpPTe3K6Wwfi6FM20Xwp4f5RaZHC8pu2
	 mDagVukyazxPkJRZB4JoqPNVv/3VxECY3hWQNBZ7JhHkcjkpCGfRQpNRXSTMuxr4t6
	 IZGLgcg0GpyXQ==
Received: from [100.113.5.216] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 28/B7-57985-225FEA06; Thu, 27 May 2021 01:25:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI1VX6ui7
  B4MNfIYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePEpMKC3RwVp+evZ25gPMvexcjFISQwi0mi
  ue0/axcjJ5Czh1Hi7gJ2EJtNQFfi3OO1QDYHh4iAnsTVf6IgYWEBD4kTs5rBSlgEVCV2brjBC
  GLzCnhKvGu6C2ZLCChITHn4nhkiLihxcuYTFhCbWUBC4uCLF8wgIyUEFCVmT5eHKK+QmDFjG9
  sERp5ZSDpmIelYwMi0itEyqSgzPaMkNzEzR9fQwEDX0NBY10TX0NhAL7FKN0kvtVQ3OTWvpCg
  RKKuXWF6sV1yZm5yTopeXWrKJERhCKYUsTTsYf7/6oHeIUZKDSUmU99qJdQlCfEn5KZUZicUZ
  8UWlOanFhxhlODiUJHhZnwPlBItS01Mr0jJzgOEMk5bg4FES4W18DZTmLS5IzC3OTIdInWJUl
  BLnzfoClBAASWSU5sG1wWLoEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3h0gU3gy80rgpr
  8CWswEtFgoEWxxSSJCSqqByeZd60ORLsFNide1L7qcTWH52SocpLBDuLslomXzJ9MUiU++FWo
  ez2XsTD8e1pVfMNl0V8Hb0rQV9lWHDbNs4j2nlZeVK8cbLfa58F/dZH32ySPPH85VPXrbp2bN
  w+VGvtzdF7jV7/yqV3jvvP3biYUmX5UD83ffjXg3gzf+sO+KPWfTIgp1p1h0/fwq8K9w4eHDf
  Eby3QdNr21eLZP7oXTl1RCPwwttxG5fzv6Xmf7kKStjRStr/sduvcOc8opH0kyzfy5+YTgnwq
  9Q0q2P3TusXHfxow9XUyz9eoNllgY370/z+Oy29qg0f+G17/zppgerb5obt7zcst+Oj1lEZWs
  eB6P32oshs8q0lqkqsRRnJBpqMRcVJwIAhDsobRwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-238.messagelabs.com!1622078753!53868!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6490 invoked from network); 27 May 2021 01:25:54 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-14.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 01:25:54 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14R1Pj13017064
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 02:25:53 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 02:25:43 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libedit: upgrade 20210419-3.1 -> 20210522-3.1
Date: Thu, 27 May 2021 09:25:24 +0800
Message-ID: <1622078724-116389-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{libedit_20210419-3.1.bb => libedit_20210522-3.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libedit/{libedit_20210419-3.1.bb => libedit_20210522-3.1.bb} (88%)

diff --git a/meta/recipes-devtools/libedit/libedit_20210419-3.1.bb b/meta/recipes-devtools/libedit/libedit_20210522-3.1.bb
similarity index 88%
rename from meta/recipes-devtools/libedit/libedit_20210419-3.1.bb
rename to meta/recipes-devtools/libedit/libedit_20210522-3.1.bb
index a34b773288..43e6f2244b 100644
--- a/meta/recipes-devtools/libedit/libedit_20210419-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20210522-3.1.bb
@@ -13,7 +13,7 @@ inherit autotools
 SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
            file://stdc-predef.patch \
           "
-SRC_URI[sha256sum] = "571ebe44b74860823e24a08cf04086ff104fd7dfa1020abf26c52543134f5602"
+SRC_URI[sha256sum] = "0220bc2047e927c0c1984ef5f7b4eb2a9469a5b7bf12ba573ca3b23ca02bbb6f"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1

