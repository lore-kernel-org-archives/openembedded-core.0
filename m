Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.31334.1613974165938974852
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 22:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 4F/4F-55623-49A43306; Mon, 22 Feb 2021 06:09:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxRXeyl3G
  CwZ8FRhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aEx+wFrZwVN14tYGtgnMTRxcjFISSwmUli
  w9MVrF2MnEDOCUaJr5eyQGw2AU2J3i1bGLsYOThEBPQkrv4TBQkzC6hLXFrXwgJiCwvYSXx8s
  pEZxGYRUJXYt+gE2BheAVeJdc83s4PYEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmCFqFCVmX2
  5mgbCrJNZ0TGObwMg7C0nLLCQtCxiZVjFaJhVlpmeU5CZm5ugaGhjoGhoa6xrpGhma6SVW6Sb
  qpZbqJqfmlRQlAmX1EsuL9Yorc5NzUvTyUks2MQKDK6WQ6cYOxm+vP+gdYpTkYFIS5b382ihB
  iC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvrKdxgpBgUWp6akVaZg4w0GHSEhw8SiK8mR5Aad7ig
  sTc4sx0iNQpRkUpcV5HkD4BkERGaR5cGyy6LjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5q
  0HmcKTmVcCN/0V0GImoMVKGUYgi0sSEVJSDUxne/nPO7ZcfXXL54OBW8v9w5paG5LkPA79bnJ
  gLXK4lW/c+WCf0NIrv62rpfdZfOnnTtfZm3z0pHGtu39h/PKF78ONXsmw6xfPFnXOn/bS97vG
  pRLlrvK/f9RzuH0jXQwe7VjnfLLM/uGdH8923Gpp0FAO1D28+fVp9S7eDZaPIw9s5uvo2mDZc
  rPDydUjKLk3wvp6a0ydVKBBxDTHqCReQzbmjAhm+xLl/mln93euOCi07oBhXtk0RYksjoPvM4
  7Oe7GZu2FdVc6nvPzEWVw2F9jEIn46eh2xWDS1f5GyX/HiCpYsRmm2/W4PAgXyTj0XS4xg7Vi
  pkFM+tTTi0o8dX/g53qeyn5kv92SvEktxRqKhFnNRcSIAJA3JDykDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-232.messagelabs.com!1613974163!140346!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9182 invoked from network); 22 Feb 2021 06:09:23 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-8.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Feb 2021 06:09:23 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 11M69NPJ024772
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 06:09:23 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Feb 2021 06:09:21 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] lttng-ust: upgrade 2.12.0 -> 2.12.1
Date: Mon, 22 Feb 2021 14:09:15 +0800
Message-ID: <1613974155-13502-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../lttng/{lttng-ust_2.12.0.bb => lttng-ust_2.12.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.12.0.bb => lttng-ust_2.12.1.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb
index 67a4307c7b..67b53cbbba 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.12.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.12.1.bb
@@ -33,8 +33,8 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
            "
 
-SRC_URI[md5sum] = "3bf4a04c305271d13cf6596c4e7b9b3c"
-SRC_URI[sha256sum] = "1983edb525f3f27e3494088d8d5389b4c71af66bbfe63c6f1df2ad95aa44a528"
+SRC_URI[md5sum] = "11787d1df69b04dd7431614ab43b2e12"
+SRC_URI[sha256sum] = "48a3948b168195123a749d22818809bd25127bb5f1a66458c3c012b210d2a051"
 
 CVE_PRODUCT = "ust"
 
-- 
2.25.1

