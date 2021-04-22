Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.9305.1619078364286646678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 00:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MPzbqqCo;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619078361; i=@fujitsu.com;
	bh=gqJM8TY4+yn+iPgi+at47Tk1Y8hmxFJxDwXO9c8cGAI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MPzbqqCo7LlL71e10lXkbz6mjyYTqX2kbtEZ83zmMB8z2+goiGP8zbe9tbHzYy/gY
	 xnFBykDKyQJE65Fhnj6WzXB8tDksXQZWTync6ohrSxr6xtuLip4znnGdUHHDTftFiK
	 1/1W9S1AC9i7LPDvIZ/1/FOPRHkQvJPKb9WodFDHa878iRK7iIm730MlmayXqHJeZN
	 W6OBAKEjtlDaY5nLBUUklX5NrEYEXLS4wPAZj9O8E2ER2gKvua39Xe9IuoyxqKVnc5
	 kHlRtP9YR0p0rYS1WxFYf+XWCC1inUIDxY7yeD5XxYSORzepV8qEr+eFlEZrOtR2wa
	 CnqUJN0KNeLVA==
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 73/B8-07430-9DC21806; Thu, 22 Apr 2021 07:59:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MxVfemTmO
  CQfMFWYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPhwU+MBZ84KuYcb2VpYJzI0cXIySEkMItJ
  onWVdRcjF5B9nFHiyIE3rCAJNgE1iem3bgDZHBwiAnoSV/+JgoSZBVQkXvzuYQcJCws4Spw6k
  Q0SZhFQlZi7ZTEjiM0LFO76MBXMlhBQkJjy8D0zRFxQ4uTMJywQYyQkDr54wQxRoygx+3IzC4
  RdKdG5fgHjBEbeWUhaZiFpWcDItIrRIqkoMz2jJDcxM0fX0MBA19DQWNdI19RQL7FKN1EvtVQ
  3OTWvpCgRKKmXWF6sV1yZm5yTopeXWrKJERhaKYVMxjsYr73+oHeIUZKDSUmUdyFfY4IQX1J+
  SmVGYnFGfFFpTmrxIUYZDg4lCd4XWkA5waLU9NSKtMwcYJjDpCU4eJREeO1B0rzFBYm5xZnpE
  KlTjIpS4ryrQRICIImM0jy4NlhsXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzCuvDTSFJz
  OvBG76K6DFTECLtafUgiwuSURISTUw3WCuVtITE1g3QU3X+dJVp7ZXL6POlZ/Xvc6xoUvQf1H
  f3z6LmatWeB3l/yKwyomTO/n8Qx+x2pwpOlvM17X6iziV/L8Zd141x2ZVf/PFwOKaxz//xnCW
  ze4MSsg9coPPttzq4A/7kwWzGB856p8sLiloUs4Q2DjzVuAE/h0qN6PPXcmqMT28mWevBsOBt
  6vzf+T8ujnNtqdrS/FGMfkcw6Z3x1h+TVnG3Xu4qMlKMnNuZ3ZAvebEHbniPUekenfHhXN0Jl
  jpPyxPnNYq+abs79oLxx/baJwIXLGxtN6W4ffKHoZFPzfcPrc45Y24yY+7n1jkvm35e7c3Ss9
  4hdit4Hi18A1lPzp/aRZtaWNXYinOSDTUYi4qTgQAaWGJ5igDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-226.messagelabs.com!1619078360!199243!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7019 invoked from network); 22 Apr 2021 07:59:21 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-3.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 07:59:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M7xKLp008345
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 08:59:20 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 08:59:18 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] wpebackend-fdo: upgrade 1.8.2 -> 1.8.3
Date: Thu, 22 Apr 2021 15:59:10 +0800
Message-ID: <1619078350-5670-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webkit/{wpebackend-fdo_1.8.2.bb => wpebackend-fdo_1.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.8.2.bb => wpebackend-fdo_1.8.3.bb} (89%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.2.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb
similarity index 89%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.8.2.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb
index 2ce631a73c..d27111a456 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.8.2.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.8.3.bb
@@ -13,7 +13,7 @@ inherit meson features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "98c291071128326a72918d670a46ef63268c43267928560ac3b84b6aebb2d78d"
+SRC_URI[sha256sum] = "3d0b4282a1bd9e0664d7a20abe14e982f3285296ac62de56cae2a404b9d28b9e"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.25.1

