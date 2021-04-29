Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web10.1065.1619661515233702936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 18:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=U0mjX6z1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619661513; i=@fujitsu.com;
	bh=A56t8y6KEMF/17A4smpWttZ6fNM45H/cBfRMtRNxplY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=U0mjX6z1oDE2ZdLFPVDhWwqdkGky1sr2XmUmGP5bqOkGJgp1dHtXPlUEfH5bAkBAn
	 hUC8f882hmBYhiRuUnE62g1iD9Aaifzz7B9wBmO4dY4hRePqANgyO/9aCsSy+yDDmm
	 6UzPa/7s+IHCpMQUuqDXWtaasdThPFZTjvprUtVUImcWjFwQadqnyf7GPaJB+hRl9p
	 J2Tvhev7GCFM7C2XA/fGNtYjrAvi4c+XgqaMpOX6KKDRFcrgKo+J6npafPPNCAIdPQ
	 SA8wcM5QjAzEQQHb/vwxfgHHF5B9GSeNK4MTkctH5fbp6l0wupdABMoErC3Kd7lZUy
	 Q0hen/CyxhHxA==
Received: from [100.113.6.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 2B/3A-44603-8C21A806; Thu, 29 Apr 2021 01:58:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxVfeEUFe
  CwerLghZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aMRQ9YClbxVLzeV9XA+J2ri5GLQ0hgFpPE
  pb3bWCGc44wSndPXM3cxcnKwCahJTL91AyjBwSEioCdx9Z8oSJhZQEXixe8edhBbWMBSYk7bL
  jYQm0VAVeJpSxsTiM0r4CTx4NAGVhBbQkBBYsrD98wQcUGJkzOfsEDMkZA4+OIFM0SNosTsy8
  0sEHaFxOvDl5gnMPLOQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGuua6RqZGeolVukl
  6qaW6yal5JUWJQFm9xPJiveLK3OScFL281JJNjMDwSilk/7OD8frrD3qHGCU5mJREebd0diYI
  8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCtE+hKEBIsSk1PrUjLzAGGOkxagoNHSYS3nR8ozVtck
  JhbnJkOkTrFqMtxZdWSRcxCLHn5ealS4rwcgkBFAiBFGaV5cCNgcXeJUVZKmJeRgYFBiKcgtS
  g3swRV/hWjOAejkjCvDsgUnsy8ErhNr4COYAI6Ytn5NpAjShIRUlINTL03lk3yu2KxZAW3Lbe
  D1huv92v/vFi8fpfurT++hYpBrz7I7FjzlCffQcqR3duP0UBE6t1J64AX8yrc2zeJm4p816s7
  eTPfzpZ900sPA1mTYyaJzyZFRP080so7ne+2Juua7P0pc3Y4VLRcNekWOyg+wU17P8NuFbHib
  4rhf/Z+1Vmo47KmJvyT9e9VCTWfN1tNcd3cKPJk8wTVrKY5Xs81ZSby+WZMurDkt11kkqR8hK
  qmpaT8nppO7lwDnVnaZRlCU9rlqvk+bw06tVDu+KU94f4eD2+qSm60ucTxaquWW2HOzwmntn6
  e2GedZq3k//TVxxtuf1radvyLv77u4hwh0ZzDy2pE9bM6b5kwKrEUZyQaajEXFScCAPXqsjM2
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-248.messagelabs.com!1619661511!229229!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23918 invoked from network); 29 Apr 2021 01:58:32 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-18.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Apr 2021 01:58:32 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13T1wQEF012971
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 02:58:31 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 02:58:24 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mesa: upgrade 21.0.2 -> 21.0.3
Date: Thu, 29 Apr 2021 09:58:13 +0800
Message-ID: <1619661493-24302-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mesa/{mesa-gl_21.0.2.bb => mesa-gl_21.0.3.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.0.2.bb => mesa_21.0.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.0.2.bb => mesa-gl_21.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.0.2.bb => mesa_21.0.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.2.bb b/meta/recipes-graphics/mesa/mesa-gl_21.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.0.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.0.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5705ae0f08..a85f94c75e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "46c1dc5bb54a372dee43ec3c067229c299187d5bdadf1402756bbf66a6df5b88"
+SRC_URI[sha256sum] = "565c6f4bd2d5747b919454fc1d439963024fc78ca56fd05158c3b2cde2f6912b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.0.2.bb b/meta/recipes-graphics/mesa/mesa_21.0.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_21.0.3.bb
-- 
2.25.1

