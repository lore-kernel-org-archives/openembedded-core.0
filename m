Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web09.1884.1614817626286777305
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 16:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.4.174] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id A4/91-23163-85920406; Thu, 04 Mar 2021 00:27:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MRohuu6ZB
  gcPOChcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrHy0D2mgmMcFWdOn2FvYHzA3sXIySEksIlJ
  4trkZAj7OKPEs43OIDabgKZE75YtjF2MHBwiAnoSV/+JgoSZBdQlLq1rYQGxhQWcJKbu2M4MY
  rMIqEhMv9wPZvMKuEq8fPmZEcSWEFCQmPLwPVicU8BN4uP3XywQq1wlThw4B1UvKHFy5hMWiP
  kSEgdfvGCG6FWUmH25mQXCrpJY0zGNbQIj/ywkLbOQtCxgZFrFaJFUlJmeUZKbmJmja2hgoGt
  oaKxrBmTpJVbpJumlluomp+aVFCUCJfUSy4v1iitzk3NS9PJSSzYxAkMxpZCNawfj09cf9A4x
  SnIwKYnyHvhinyDEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgldCwyFBSLAoNT21Ii0zBxgXMGkJD
  h4lEV41NaA0b3FBYm5xZjpE6hSjopQ47zGQPgGQREZpHlwbLBYvMcpKCfMyMjAwCPEUpBblZp
  agyr9iFOdgVBLm5VQHmsKTmVcCN/0V0GImoMWz3OxAFpckIqSkGpg8epZsWaZ/mM/hyGx2dyH
  Tiy+8nn94zZuTV7ai/lzpsnZ/6ytLCn+8c/txdunkKTOPu6Wb6QqFXZ8QdWL65rY1Lxnufwrp
  Tauf2RtQeDuw5WrR6X0ycz8q/+VucxXNsjjOvvHkhSdOP1sEnBfnhjRzLctZkxeZtKega0nVj
  zMWO/o8u15EVUgHTWHhndHdw+XYfWfOW7WZkmarGNfkmqya1sU4M87/f/P9+ZxHyq6pF+2Ndf
  thKX1n4po9t0KDn5x3PXtyWoeP8dQDLJcKArmvvNY3n7NgwkRDBRvt1x8y7F+oNT84P+vmDAl
  O6aXHDyyY/JV5x3Kl01eV/1uxfmrIPCw6955X2PZVwt/TDb9FKrEUZyQaajEXFScCACy1DuxA
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-245.messagelabs.com!1614817623!1204536!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31665 invoked from network); 4 Mar 2021 00:27:03 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-18.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2021 00:27:03 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1240R3Zs021946
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Mar 2021 00:27:03 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 00:27:01 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] lttng-modules: upgrade 2.12.4 -> 2.12.5
Date: Thu, 4 Mar 2021 08:26:35 +0800
Message-ID: <1614817602-40383-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1614817602-40383-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1614817602-40383-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../lttng/{lttng-modules_2.12.4.bb => lttng-modules_2.12.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.12.4.bb => lttng-modules_2.12.5.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
index 3ca59f789a..48e91e158d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            "
 
-SRC_URI[sha256sum] = "fe66400fa1b85bff1b9ae24419c74e3bb7d358d643eade0594d81b48bd190688"
+SRC_URI[sha256sum] = "c4d1a1b42c728e37b6b7947ae16563a011c4b297311aa04d56f9a1791fb5a30a"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.25.1

