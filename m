Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web10.33292.1623052395261608822
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jun 2021 00:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gQsIZ0ed;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623052393; i=@fujitsu.com;
	bh=9XD4nD2b/22/vtHVrU+9Ns6dIJCY80sumGzg13OiD6A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gQsIZ0eduQ92HDKRsSwze3x71ARZW8MKHa3iXl0zsntz1gXX+mA3RpEBfCIXuagTK
	 nV9z2yYDKLCSZQ9zCRUW+rHr8O4MfW/N3vHWRAu3Ezg/ZSdscMlYFvKIUeGh5Yx0zT
	 dLaOUkHMfvJXrD648fUMsExi1srsgdteA9FGrpG1YtDZoYzZ7SsrVs2Fw5kkwlZx/l
	 0pbwE6lq08UVM/KAV5nuXweK9BtBLR8QnBN/rOD4iNoBqV2PT5svxbOmry6s7UTJhD
	 XVY0bEdJSIvWqqtq2gqavS92ZrSMFhnzgx/flX6diK4KC7Ha1tZIx1cFZUsUAUqQW6
	 o271qR1+nvbNA==
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id C1/FC-16595-860DDB06; Mon, 07 Jun 2021 07:53:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqptxYW+
  CwZbZChZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aRBzvYCt5zVuxcHdjAOJWzi5GLQ0hgJpPE
  wutNLBDOcUaJn10fgBxODjYBHYmOF91ANgeHiICexNV/oiBhYQEXie2Tl7GC2CwCKhI7j01nA
  7F5BdwlNh1dDtYqIaAgMeXhe2aIuKDEyZlPwOLMAhISB1+8YIaoUZTYvvMMVH2FxIwZ29gmMP
  LMQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGusa6RqaGeolVuol6qaW6yal5JUWJQFm
  9xPJiveLK3OScFL281JJNjMAwSilk/r2D8fHrD3qHGCU5mJREedmO704Q4kvKT6nMSCzOiC8q
  zUktPsQow8GhJMHbdX5vgpBgUWp6akVaZg4wpGHSEhw8SiK8184BpXmLCxJzizPTIVKnGBWlx
  HmrQRICIImM0jy4NlgcXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzPsWZApPZl4J3PRXQI
  uZgBZX2+8CWVySiJCSamAKe7su4uAEk5MtHVJ87DtXcgrMCP3jr8z9XN9cJMDh1uXUFedlFDr
  czVas4j/8OnfK1Gs51/Im3H+tqqvudyhh1c+dL5ZdCmt2MOh/3nFw/gKtK6LTTI99nvi9u6w0
  XEKZP+FBzbPe0uBYHs3l0id3JOrm81/J09v6a8ffDVfOt6dkHpF5HeKgFHjJWWtt413ze0svf
  PzbVBal/82qR7NisYHekpy4Te/0JDK3Z595vm6d/XnFe0sNnFa2HDbetbVt3gNultkHzdyNpW
  f+m8HJP1dhp94e7pbnVo0FU1pEl8jyf2qWbCt8tlzmgcXrY12STzK5d1e8Ou2uwdXBu/Wck+Q
  JWefVZwtNrxn+3OilxFKckWioxVxUnAgAxdBE7h4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-226.messagelabs.com!1623052391!212533!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25420 invoked from network); 7 Jun 2021 07:53:12 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-11.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Jun 2021 07:53:12 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1577r6MN023360
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Jun 2021 08:53:11 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 7 Jun 2021 08:53:01 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-pycairo: upgrade 1.20.0 -> 1.20.1
Date: Mon, 7 Jun 2021 15:52:53 +0800
Message-ID: <1623052373-20370-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-pycairo_1.20.0.bb => python3-pycairo_1.20.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.20.0.bb => python3-pycairo_1.20.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pycairo_1.20.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.20.1.bb
index 8987b7a428..d169a3ca79 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.20.1.bb
@@ -13,8 +13,8 @@ DEPENDS = "cairo python3"
 SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[md5sum] = "a1f9b661a0000c2f42281db933284451"
-SRC_URI[sha256sum] = "5695a10cb7f9ae0d01f665b56602a845b0a8cb17e2123bfece10c2e58552468c"
+SRC_URI[md5sum] = "fa88a28cadbfb34192fe743d32c0ee33"
+SRC_URI[sha256sum] = "1ee72b035b21a475e1ed648e26541b04e5d7e753d75ca79de8c583b25785531b"
 
 S = "${WORKDIR}/pycairo-${PV}"
 
-- 
2.25.1

