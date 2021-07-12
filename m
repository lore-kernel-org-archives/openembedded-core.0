Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web11.5386.1626052582070948275
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 18:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=r+uMM2OK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626052579; i=@fujitsu.com;
	bh=YQQgcOKDHIztM0G7On3D3uB86FUc3ib38LXvNvurqw0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=r+uMM2OKt5uR0nCf+2i32Xs+hZDCPip2ZY8IuFv6EDZOqLIWIUsk0IpRcO9+RGXrP
	 zmam2nrWOfcB5W0K/Xd9yU84iduyCwJk/O48gjpkhAkrCfJVzu4CC037NXalmKTzr4
	 iF/ANjNP7lISxfblHVOP45WLGpsaKFtnGT5F82k2tteE1JtxuMN3wH1dk5W6p9x/fo
	 j/pNTwq0Wg249cMCPEBg/i7YH+a/g3V/lMdlgkWyIpkju33XK60d0QusY6RTdnCjlq
	 JlvK97Fjw5B2FKsMolhyngvSe7CNhVMCzrEvG+GQRa5KqQByYfXA94KtT0uvYqzyqD
	 fh9FPnciFhqjw==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 35/28-07274-3E79BE06; Mon, 12 Jul 2021 01:16:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCIsWRWlGSWpSXmKPExsViZ8MxVffx9Nc
  JBm3z2S3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oyX/T+YCz7yV6w6rNPAOI2vi5GLQ0hgK5PE
  j42vmbsYOYGck4wSHybLgthsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3DzuILSzgJbHv1
  DqwVhYBVYkXrxcxgdi8Ak4S/zd/BbMlBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL14wQ9QoSsy+3M
  wCskpCoFLixuPUCYy8s5B0zELSsYCRaRWjRVJRZnpGSW5iZo6uoYGBrqGhka6hJRAbmeklVuk
  m6qWW6panFpfoGuollhfrFVfmJuek6OWllmxiBAZWSsGBuh2MD15/0DvEKMnBpCTK28vyMkGI
  Lyk/pTIjsTgjvqg0J7X4EKMMB4eSBO/2qa8ThASLUtNTK9Iyc4BBDpOW4OBREuHNBEnzFhck5
  hZnpkOkTjEqSonzigFjQ0gAJJFRmgfXBousS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeR
  umAU3hycwrgZv+CmgxE9Diwh0vQRaXJCKkpBqYEovM7/6+c8zK6rLUp/+rj0RvWhsbeXvKPG8
  Op5zn7I08vvcYRH3mrT29vMh7waH3/evSz37g0r3+c0GKJ0OYv8ULnRz13f4PFv5wVZe7qRoU
  /sm2Q3j98qzL4j7fVtTP/pTw1F9N7+7l+au+X85jan7+0tzutpSnUlzG2nu566PiGgXl7cSOT
  w4pnqmmNpHx6Imj/n8fPr/VUn79+uynzRnuW6xcs46kKN+4MlHeY9fOSW7/km75B0hMkLV7de
  vqszkvOl597Njho/GqONsxcHnbK76MOyEff+7NsuuO+10aJ7My5NHkHzKvXFfNtGC6Gevjk+O
  71FxBWdbUbI6kyplpdw4c1sgtWHHqaOOLTiWW4oxEQy3mouJEAOcqDMEnAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-265.messagelabs.com!1626052578!452900!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2255 invoked from network); 12 Jul 2021 01:16:19 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-5.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Jul 2021 01:16:19 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16C1GAeC004435
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:16:18 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 12 Jul 2021 02:16:08 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v3] python3-setuptools: upgrade 57.0.0 -> 57.1.0
Date: Mon, 12 Jul 2021 09:15:55 +0800
Message-ID: <1626052555-16162-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

reproducibility.patch
deleted since it's been merged upstream.

v57.1.0
-------

Changes
^^^^^^^
* #2692: Globs are now sorted in 'license_files' restoring reproducibility by eliminating variance from disk order.
* #2714: Update to distutils at pypa/distutils@e2627b7.
* #2715: Removed reliance on deprecated ssl.match_hostname by removing the ssl support. Now any index operations rely on the native SSL implementation.

Documentation changes
^^^^^^^^^^^^^^^^^^^^^
* #2604: Revamped the backward/cross tool compatibility section to remove
  some confusion.
  Add some examples and the version since when ``entry_points`` are
  supported in declarative configuration.
  Tried to make the reading flow a bit leaner, gather some informations
  that were a bit dispersed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-setuptools_57.0.0.bb => python3-setuptools_57.1.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_57.0.0.bb => python3-setuptools_57.1.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
index a15b51e31c..c066d8209f 100644
--- a/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
@@ -8,10 +8,9 @@ inherit pypi setuptools3
 
 SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch \
-            file://reproducibility.patch"
+SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "401cbf33a7bf817d08014d51560fc003b895c4cdc1a5b521ad2969e928a07535"
+SRC_URI[sha256sum] = "cfca9c97e7eebbc8abe18d5e5e962a08dcad55bb63afddd82d681de4d22a597b"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1

