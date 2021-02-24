Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.7644.1614176807967310129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:26:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 53/A9-04518-52266306; Wed, 24 Feb 2021 14:26:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxVVc1ySz
  BoHOFpsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrFy6nr2guM8Fbt/HmJvYPzD1cXIySEksJlJ
  YuY1lS5GLiD7BKNEw+mVrCAJNgFNid4tWxi7GDk4RAT0JK7+EwUJMwuoS1xa18ICYgsL2Em0r
  T7ABGKzCKhKPPh2kQ3E5hVwlVgz7zmYLSGgIDHl4XtmEJtTwE3i9MpzTBB7XSW2rl4BVS8ocX
  LmExaI+RISB1+8YIboVZSYfbmZBcKukljTMY1tAiP/LCQts5C0LGBkWsVokVSUmZ5RkpuYmaN
  raGCga2hopGtoaaZrZGiil1ilm6SXWqpbnlpcomuol1herFdcmZuck6KXl1qyiREYjCkFR67t
  YDzw+oPeIUZJDiYlUd6P3mYJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4i+OBcoJFqempFWmZO
  cDIgElLcPAoifDOiwNK8xYXJOYWZ6ZDpE4xKkqJ82olACUEQBIZpXlwbbBovMQoKyXMy8jAwC
  DEU5BalJtZgir/ilGcg1FJmDcWZApPZl4J3PRXQIuZgBZfiQFbXJKIkJJqYFJItLhT++hA95s
  pOrkX9+78+Czy87Z9GQtuSrVVPr2futdWLCGkhC9W891Nm94Etfm6qtzztEu7Vim+qJBg/Br+
  8/ikrp3Hr8c2Fn1/qKp8cMGMa6kajlpuXDultm6fyS7qF7hOOGWeZ+xvlrfv85bvtw67a74gx
  P9Oy+vbH6OvGgbs3ucv1n3QvUNCtfT3pzbjNtafdq2aUofcTJS5A3Z/DxOob2g02SbFK+rhUJ
  tkq3Tj9rG8/ycCg7uYq41E7S3bf91VOrjf9PGUoB+/+NUezwnvq1vV+2ra2dpW+yrG69eLk0+
  xTL7ZLMH9VPvT/9yeXcv+rEmbc+Cn7tK327aqJfe4+TFWGXx8IczJqsRSnJFoqMVcVJwIAMK+
  EN9BAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-291.messagelabs.com!1614176805!430221!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23260 invoked from network); 24 Feb 2021 14:26:45 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-19.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Feb 2021 14:26:45 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 11OEQdt2005989
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 14:26:44 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Feb 2021 14:26:40 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] libxcrypt: upgrade 4.4.17 -> 4.4.18
Date: Wed, 24 Feb 2021 22:26:27 +0800
Message-ID: <1614176788-19920-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1614176788-19920-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1614176788-19920-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

file LICENSING updated: directory of files changed from m4 to build-aux

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc                     | 4 ++--
 .../libxcrypt/{libxcrypt_4.4.17.bb => libxcrypt_4.4.18.bb}    | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.17.bb => libxcrypt_4.4.18.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 104a2af4d2..e9f968b556 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -3,14 +3,14 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSING;md5=102923b6e1b02a85c5a1203fa87d151d \
+LIC_FILES_CHKSUM = "file://LICENSING;md5=bd5d9777dfe7076c4f2928f12fed226a \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     "
 
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "6b110bcd4f4caa61fc39c7339d30adc20a7dd177"
+SRCREV = "94d84f92ca123d851586016c4678eb1f21c19029"
 SRCBRANCH ?= "develop"
 
 PROVIDES = "virtual/crypt"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.17.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.18.bb
-- 
2.25.1

