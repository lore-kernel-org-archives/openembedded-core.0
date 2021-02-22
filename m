Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web08.31743.1613974302065806787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 22:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.195.19] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id EA/2E-42970-B1B43306; Mon, 22 Feb 2021 06:11:39 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MxRVfa2zj
  B4NYDYYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaNj3n+mgrMcFUeut7M3MN5g72Lk4hAS2Mwk
  8WvhbFYI5wSjxOcp61i6GDk52AQ0JXq3bGHsYuTgEBHQk7j6TxQkzCygLnFpXQtYibCAjUTvn
  MXMICUsAqoStxcZgIR5BVwlruxoYAOxJQQUJKY8fM8MEReUODnzCQvEGAmJgy9eMEPUKErMvt
  zMAmFXSazpmMY2gZF3FpKWWUhaFjAyrWI0TyrKTM8oyU3MzNE1NDDQNTQ00jW0NNG1MNZLrNJ
  N1Est1S1PLS7RNdRLLC/WK67MTc5J0ctLLdnECAytlIJDwTsY+9580DvEKMnBpCTKe/m1UYIQ
  X1J+SmVGYnFGfFFpTmrxIUYZDg4lCV5ZT+MEIcGi1PTUirTMHGCYw6QlOHiURHgzPYDSvMUFi
  bnFmekQqVOMilLivI4gfQIgiYzSPLg2WGxdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMWw
  8yhSczrwRu+iugxUxAi5UyjEAWlyQipKQamOavMg/WnVKX9DvL1nqdR9+75PbGPuWHOW07O7m
  U7osv+bFmo2y6o4f0zWT23XklR9bNyYnQnXjce86M7pZcsbcz1kc5313hXijjpTRnjVOd6F9O
  vu8G7vfn7+kSfJwrfEn4ulfhmdyS+be+MD3Tk2pfd1dXz1Rv1hTnj63RCj2Wkjq/nzO9VPmXJ
  tST+MrnZ0ds1X2DrJMpp04d/ySU7rfm6u/MWZtLGwQi/z5NqNc35xabu+V/8K3t7Leub6udGs
  +Ue3Hy+0nRD+L8Lt8pazHUiv4l+OHnyce9NuImb7Sf/5cRFdowtfHg7DBuSw5ttndKtgY57LV
  BrlFztTt+1jKdfKfP97y0eqW7zbMGJZbijERDLeai4kQAeYqnzCgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-26.tower-267.messagelabs.com!1613974298!278751!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10983 invoked from network); 22 Feb 2021 06:11:39 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-26.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Feb 2021 06:11:39 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 11M6Bcnu025814
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 06:11:38 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Feb 2021 06:11:37 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] openssl: upgrade 1.1.1i -> 1.1.1j
Date: Mon, 22 Feb 2021 14:11:30 +0800
Message-ID: <1613974290-13556-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../openssl/{openssl_1.1.1i.bb => openssl_1.1.1j.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1i.bb => openssl_1.1.1j.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
index 86950f7544..c431f22643 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1j.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
+SRC_URI[sha256sum] = "aaf2fcb575cdf6491b98ab4829abf78a3dec8402b8b81efc8f23c00d443981bf"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1

