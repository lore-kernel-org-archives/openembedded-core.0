Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.6164.1617956864561136584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 01:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=X1U9cs1B;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617956862; i=@fujitsu.com;
	bh=AjLTvGb330BUhCxe4e7kP7un5Xi/GCQkPbHg4NYRKaU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=X1U9cs1BzZqsban5o3iHunmqDw37zdko1tvuIB4nAeJ58DYC4SjELUf7924XlLcTJ
	 Vq5q1uE6OkDnsVYccfaWG8lCFmNo81P+l+x1lz3qka3/olQvpDIBlj5OP2tDY82aK2
	 Y1xzLaqcCfgV4XXacaK52qJqBMonlg/GVUnra5qDbe8g6zRvFJxS3Vvl/XN1mscIkf
	 gvGs+VNV5vFR/QsuMirFk0JHhpWi/6aD+HoIJx/bsLpbbl9StgFjuWUHdNcZRTkeyU
	 h7g9zLzHg3pKwgbL56lvHF1pXLhBkxEGl69nGi4ySNRDD3ZGa5ZWdHvfAZC5diGyJP
	 r3+NSg2grrxhw==
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 16/2B-55623-EFF00706; Fri, 09 Apr 2021 08:27:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxRfcvf0G
  CwevvBhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8ajW2cZC57wVCy9rdzAeIu7i5GLQ0hgC5PE
  zwVNTF2MnEDOcUaJHX9YQGw2ATWJ6bdusHYxcnCICOhJXP0nChJmFlCRePG7hx3EFhawkVh4e
  BlYOQtQfOWEL2BjeAUcJU7PmMsKYksIKEhMefieGSIuKHFy5hMWiDkSEgdfvGCGqFGUmH25mQ
  XCrpLo/HCcbQIj7ywkLbOQtCxgZFrFaJlUlJmeUZKbmJmja2hgoGtoaKxrqGtkZKaXWKWbqJd
  aqpucmldSlAiU1UssL9YrrsxNzknRy0st2cQIDK6UQsZHOxhPv/6gd4hRkoNJSZT3F1NBghBf
  Un5KZUZicUZ8UWlOavEhRhkODiUJ3kI+oJxgUWp6akVaZg4w0GHSEhw8SiK89VxAad7igsTc4
  sx0iNQpRkUpcd7NIH0CIImM0jy4Nlh0XWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzBsFjF
  Uhnsy8Erjpr4AWMwEtLjmYC7K4JBEhJdXAtHzH6ufH9V+sZHsb+qe9cEl3rPW2VR7arPc3qR4
  1XHanPub75fDMqr0/fDdq/QjIUogvOOUhVGgt3Lh+5o3CGaqF8Z9O8a5ex7d/daVXnQfjui3e
  gkXTrOWmF17/cPbVqan251oOqnA/0+OO7LedHGy6dWVoaCfz7DslK6Rlr4iKTp56UCG2d/u/C
  8/dn1z8nWd92vZLvEJsy7OJ1iUn2SsuXD2Z83lew6fXx/aXznTa3tW6JPNBmvi2c+9cTx0LXn
  fXubHj1Y8PPrlrL6xNjwrNnzm/cuM0p6kT5pv+m+Fm2/Svc8U80ZlSd1qzphrX7un/scWdvWX
  aNtXbz1LSNueyfdomu1x4x4856rsrli5TYinOSDTUYi4qTgQAuDDkBCkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-232.messagelabs.com!1617956861!89527!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10572 invoked from network); 9 Apr 2021 08:27:41 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-25.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Apr 2021 08:27:41 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1398RXfm003253
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Apr 2021 09:27:41 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 9 Apr 2021 09:27:32 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] curl: upgrade 7.75.0 -> 7.76.0
Date: Fri, 9 Apr 2021 16:27:20 +0800
Message-ID: <1617956840-8177-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/curl/{curl_7.75.0.bb => curl_7.76.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.75.0.bb => curl_7.76.0.bb} (96%)

diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.76.0.bb
similarity index 96%
rename from meta/recipes-support/curl/curl_7.75.0.bb
rename to meta/recipes-support/curl/curl_7.76.0.bb
index 7666c7b608..634bbd72c2 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.76.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
+SRC_URI[sha256sum] = "e29bfe3633701590d75b0071bbb649ee5ca4ca73f00649268bd389639531c49a"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
@@ -36,6 +36,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
 PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,"
 PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
+PACKAGECONFIG[libgsasl] = "--with-libgsasl,--without-libgsasl,libgsasl"
 PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
 PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
 PACKAGECONFIG[mbedtls] = "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls"
-- 
2.25.1

