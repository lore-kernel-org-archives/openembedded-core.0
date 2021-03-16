Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.6182.1615889473354931599
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 03:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.4.174] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 34/CF-38008-F3480506; Tue, 16 Mar 2021 10:11:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxRde+JSD
  BoG8Ou8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrHj6n62gn0cFevaJ7M0ML5i72Lk4hASmMEk
  8eHuZmYI5zijxMPHr1i7GDk52AQ0JXq3bGHsYuTgEBHQk7j6TxQkzCygLnFpXQsLiC0sYCVxb
  cElZpASFgFViafvE0DCvAKuEosu7mUEsSUEFCSmPHzPDBEXlDg58wkLxBgJiYMvXjBD1ChKzL
  7czAJhV0rs2fyQdQIj7ywkLbOQtCxgZFrFaJlUlJmeUZKbmJmja2hgoGtoaKxrrmtoZKiXWKW
  bpJdaqpucmldSlAiU1UssL9YrrsxNzknRy0st2cQIDK+UQvbKHYxr33zQO8QoycGkJMr7tzwg
  QYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb2QTUE6wKDU9tSItMwcY6jBpCQ4eJRHesDqgNG9xQ
  WJucWY6ROoUo6KUOO8UkD4BkERGaR5cGyy+LjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5m
  0DmcKTmVcCN/0V0GImoMWG0n4gi0sSEVJSDUzqnacc96zU3rp/7xoF1ti040vynkv+chNhWOn
  CM+WqmsvXfcaXjsy74rXSfOqfdR8EMqPPTll3hu8w/5fNTre6pOLYLDW5F3yf8O2WpUAGn+1f
  5qp7zLXMfZZWMU+q79bNqlhnMDe66Pf3M4tXum63tOI71p2dydknJTzjNfMFvy09B5fqrAjOP
  3e9o3shK2O3Je9H/gvO3Eat/5l29Yctl1JcGxX3Pavv6FxFu54Yw+SGSS1KreeOM3duLpgi/W
  GZQ2rKqvqPV+Zd3lgU/eDmPM3wZ7Z2nYeFG39GMzssvn1IiD9kwbtrLhZlF5mvvL/2su3x6ZX
  frfk36+xKPNLuFai0eKHVrFvub8MMHl9RYinOSDTUYi4qTgQAUg6XZioDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-245.messagelabs.com!1615889470!2385145!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29849 invoked from network); 16 Mar 2021 10:11:11 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-21.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Mar 2021 10:11:11 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12GAArCs001285
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 10:11:10 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 10:10:52 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] msmtp: upgrade 1.8.14 -> 1.8.15
Date: Tue, 16 Mar 2021 18:10:38 +0800
Message-ID: <1615889439-19781-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.14.bb => msmtp_1.8.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.14.bb => msmtp_1.8.15.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.14.bb b/meta/recipes-extended/msmtp/msmtp_1.8.15.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.14.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.15.bb
index 3bd5f9edeb..e85873e90f 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.14.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.15.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d56f065d711486e9c234618515a02a48a48dab4051b34f3e108fbecb6fb773b4"
+SRC_URI[sha256sum] = "2265dc639ebf2edf3069fffe0a3bd76749f8b58f4001d5cdeae19873949099ce"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.25.1

