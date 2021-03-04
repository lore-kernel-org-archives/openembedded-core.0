Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web12.1843.1614817631102201294
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 16:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id BA/71-60958-C5920406; Thu, 04 Mar 2021 00:27:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8MRqhuj6ZB
  gsPSqoMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrHnxmfWgg0cFT+P32RsYDzA3sXIySEksIlJ
  4s0ClS5GLiD7OKPEy/UrWUASbAKaEr1btjB2MXJwiAjoSVz9JwoSZhZQl7i0roUFJCws4CBxu
  1UQJMwioCJxZ/42ZpAwr4CrxKwDaiBhCQEFiSkP3zOD2JwCbhIfv/9igdjqKnHiwDmwOK+AoM
  TJmU9YIKZLSBx88YIZoldRYvblZhYIu0piTcc0tgmM/LOQtMxC0rKAkWkVo0VSUWZ6RkluYma
  OrqGBga6hoZGuoaWZrpGhiV5ilW6SXmqpbnlqcYmuoV5iebFecWVuck6KXl5qySZGYCCmFBy5
  toPxwOsPeocYJTmYlER5D3yxTxDiS8pPqcxILM6ILyrNSS0+xCjDwaEkwSuh4ZAgJFiUmp5ak
  ZaZA4wKmLQEB4+SCK+aGlCat7ggMbc4Mx0idYpRUUqc9xhInwBIIqM0D64NFomXGGWlhHkZGR
  gYhHgKUotyM0tQ5V8xinMwKgnzcqoDTeHJzCuBm/4KaDET0OJZbnYgi0sSEVJSDUyaNoqeKkX
  LN0Qs2MS2IeNwdkzNXMfn2x3sp4ao9Yj4bajiu3/y6ztZg9qJ19d0iiosSTyypI7TXTHINvaX
  aRrjef601zececOtn8W+yevTLJ9fNueJo8Yk9nSh3HX2HZN6lB5PXH1Zc1oI5yPR7bdsa7N+1
  q3S0EnptL265O1MrmBJOfMi80eOPwRdm36GvVxWH/bMcsWqSxd2fJtvIiCoZmLpdIynjuXZ4x
  qO02ntJ9dcX5FyyJV9ifNhLY86QduCKc9WHTFLeL/dat7Eux6Ztt7e3xyOKjM0TjLdePd85IE
  Qbsk9t4Os625Hptke8zs0J+Fa3WLrBHbLR3ypAnGGD5QShOewLXUyLjeWVmIpzkg01GIuKk4E
  AOgB4O0/AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-285.messagelabs.com!1614817627!1110898!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4130 invoked from network); 4 Mar 2021 00:27:08 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-20.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2021 00:27:08 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1240R7B0008795
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Mar 2021 00:27:07 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 00:27:05 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] lttng-tools: upgrade 2.12.2 -> 2.12.3
Date: Thu, 4 Mar 2021 08:26:36 +0800
Message-ID: <1614817602-40383-3-git-send-email-wangmy@cn.fujitsu.com>
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
 .../lttng/{lttng-tools_2.12.2.bb => lttng-tools_2.12.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.12.2.bb => lttng-tools_2.12.3.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
index 52bfd36370..7074096ee7 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://determinism.patch \
            "
 
-SRC_URI[sha256sum] = "9ed9161795ff023b076f9f95afaa4f1f822ec42495c0fa04c586ab8fa74e84f1"
+SRC_URI[sha256sum] = "2890da230edd523fcf497e9eb28133b7606d64fa01bcbffadbfcba42104db153"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.25.1

