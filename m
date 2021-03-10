Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web08.7582.1615376958231430243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 03:49:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.84, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 18/6A-64503-C32B8406; Wed, 10 Mar 2021 11:49:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRqmu9ySP
  B4PMCK4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPS92dMBXs4Kprfr2VtYLzN3sXIxSEkMINJ
  YtvzWUwQznFGiR8/9rF0MXJysAloSvRu2cLYxcjBISKgJ3H1nyhImFlAXeLSuhawEmEBZ4mbf
  2awg9gsAqoSazq7wOK8Ai4SU8+0gMUlBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL14wQ9QoSsy+3M
  wCYVdK7Nn8kHUCI+8sJC2zkLQsYGRaxWiRVJSZnlGSm5iZo2toYKBraGika2hppmtkaKyXWKW
  bpJdaqlueWlyia6iXWF6sV1yZm5yTopeXWrKJERheKQVHru5g7H7zQe8QoyQHk5Iob1+BR4IQ
  X1J+SmVGYnFGfFFpTmrxIUYZDg4lCd7AJUA5waLU9NSKtMwcYKjDpCU4eJREePs2AKV5iwsSc
  4sz0yFSpxh1OXaeXryIWYglLz8vVUqc12kjUJEASFFGaR7cCFjcXWKUlRLmZWRgYBDiKUgtys
  0sQZV/xSjOwagkzCsCMoUnM68EbtMroCOYgI5QMHADOaIkESEl1cC0ke2tVJgt416VhC25Hku
  jpSfnLdrOMLXz3ctfe4LWhHqy7Eo/qbHmnPpKlam+bctfL+DrWOX4+kd76lpxoYuPuD0Xnpm5
  trhG5dcjfa6mjQ8Ybs77tZ/zypUveU6z1uwTzP8zUV5/iofwL4Gl35M8vGqupjCfjHJv1X0jL
  tI7e3vS7z9ZF64YCT34dcYgcp/Ej1/2L9ZYb9t+eO7k1eqiyQfVGDiblNylwjfdLT0usTZRNj
  inmvv8w3Mz9HZ9zhTImVo20U1rQ5T1dNupOdN5igXXVC4xjejfzfQrxa3wxYTJ1lGFb71sDjm
  6/t8jEeV0fufxfR7+usI5V99xmYk8PyBtoNE086ZmQOPqFU3FSizFGYmGWsxFxYkAPB2j5zYD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-285.messagelabs.com!1615376955!1645247!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7062 invoked from network); 10 Mar 2021 11:49:15 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-22.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2021 11:49:15 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ABnFj3027249
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 11:49:15 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Mar 2021 11:49:13 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] python3-pygments: upgrade 2.8.0 -> 2.8.1
Date: Wed, 10 Mar 2021 19:49:05 +0800
Message-ID: <1615376946-3261-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python3-pygments_2.8.0.bb => python3-pygments_2.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.8.0.bb => python3-pygments_2.8.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.8.0.bb b/meta/recipes-devtools/python/python3-pygments_2.8.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pygments_2.8.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.8.1.bb
index 6c8afc5095..a2e0083483 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.8.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.8.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=98419e351433ac106a24e3ad435930bc"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "37a13ba168a02ac54cc5891a42b1caec333e59b66addb7fa633ea8a6d73445c0"
+SRC_URI[sha256sum] = "2656e1a6edcdabf4275f9a3640db59fd5de107d88e8663c5d4e9a0fa62f77f94"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.25.1

