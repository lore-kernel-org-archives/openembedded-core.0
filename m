Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.4175.1617860473524319879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZtDkkto8;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617860472; i=@fujitsu.com;
	bh=lP7XFkdKUEAdsOY0N1eG47aF2CmsV9Rx3tZpeAT9C6w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZtDkkto8XTXvQXcPPoNaUf+TnceTsZxGNAx74Zjx1w8Q68BtS8jLY77ec0yedEoR8
	 sms8bIdCNGcHh8CEsO2lPVfQwtGHyAJfuflK6WfFo+HWfYw/SqzQD49YBDEnV47KuV
	 vEFuCpLo4TB2ykpCw0o5IpS1e/e/po3cgzYJHaHh8bb9HgPeUuZXaWii3Y9n/GChxg
	 bmi3wEzvx6kzmv+fcdyzQLr9QMj88R6rMM/l9kaGd/S02bfBJLpcF0YC5df7edMCzj
	 hd4tTqA3W6W7QLjn41+TNtzC9xKCtxvbg2NzGEJPJJ1T2qNIKVehfspnoj40iFznfJ
	 6FajJOIiEBKXA==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 5A/7C-56778-7779E606; Thu, 08 Apr 2021 05:41:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRols+PS/
  B4Pt7Tos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaPl82fmgv0cFVdXPGNtYLzO3sXIxSEksIVJ
  oqFvMROEc5xR4m5DJ1CGk4NNQE1i+q0brF2MHBwiAnoSV/+JgoSZBVQkXvzuASsRFrCUOLJxB
  iuIzQIUn/LxMhuIzSvgKPGm/xaYLSGgIDHl4XtmEJtTwEli77bzYPVCQDV9M05B1QtKnJz5hA
  VivoTEwRcvmCF6FSVmX25mgbCrJDo/HGebwMg/C0nLLCQtCxiZVjFaJBVlpmeU5CZm5ugaGhj
  oGhoa6RpaGukaGZjoJVbpJuqlluqWpxaX6BrqJZYX6xVX5ibnpOjlpZZsYgSGY0rBgTM7GE+9
  /qB3iFGSg0lJlDdrUl6CEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQleu2lAOcGi1PTUirTMHGBsw
  KQlOHiURHjdQdK8xQWJucWZ6RCpU4yKUuK85iAJAZBERmkeXBssHi8xykoJ8zIyMDAI8RSkFu
  VmlqDKv2IU52BUEuatApnCk5lXAjf9FdBiJqDFJQdzQRaXJCKkpBqYlmRL/lkZe//Ni1nnPiy
  eLf/Y7vU7s59fVU592HvzprJumNiUig2qHzXeRsjIqU+beEnZ/ZDK5sPMf37M3Ry5aWHPPcdy
  wXNVu9/vMNg4QT+/vPK2YsM1zpKu/04/NxRoz6/8Pnffn418ZrGS72wP26sKLd7xy+jjd07Hn
  NaPAoyTPiyZMmHDrq2/LxqWvd69qduyz0jhXE/6DfUfi3POirU52a8xmrfv6Z75D78VNNzK3F
  vx7LCa4+bFffmuYm/VYnx2bAjv9Xs23T92zTN/73P6uatPHNi2n6+jXm9L+6dXxz3/f7n+TGa
  XRt0SEcmNkftcQtqURO913Z31/UfmU79z7gcv+s24nZp6fst/LuNaJZbijERDLeai4kQAN/d/
  XkIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-267.messagelabs.com!1617860470!369334!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24836 invoked from network); 8 Apr 2021 05:41:11 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-8.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:41:11 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385fAFx009633
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Apr 2021 06:41:10 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:41:09 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] curl: upgrade 7.75.0 -> 7.76.0
Date: Thu, 8 Apr 2021 13:40:49 +0800
Message-ID: <1617860454-5064-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617860454-5064-1-git-send-email-wangmy@fujitsu.com>
References: <1617860454-5064-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/curl/{curl_7.75.0.bb => curl_7.76.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.75.0.bb => curl_7.76.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.76.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.75.0.bb
rename to meta/recipes-support/curl/curl_7.76.0.bb
index 7666c7b608..68315d9f77 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.76.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
+SRC_URI[sha256sum] = "e29bfe3633701590d75b0071bbb649ee5ca4ca73f00649268bd389639531c49a"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.25.1

