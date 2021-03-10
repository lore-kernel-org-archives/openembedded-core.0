Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [])
 by mx.groups.io with SMTP id smtpd.web08.7582.1615376958231430243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 03:49:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: <nil>, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 4B/8A-64503-E32B8406; Wed, 10 Mar 2021 11:49:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxVdduk0e
  CwYF74hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bTyzsZCxZyVkxofc7awHico4uRi0NIYAaT
  xLMPTYwQznFGiR9931i7GDk52AQ0JXq3bAFKcHCICOhJXP0nChJmFlCXuLSuhQXEFhawlzi+b
  R4ziM0ioCrx5eZqsDivgIvExY6LYHEJAQWJKQ/fg9mcAq4S13u/M4GMFAKqaZiRAFEuKHFy5h
  MWiPESEgdfvIBqVZSYfbmZBcKulNiz+SHrBEb+WUhaZiFpWcDItIrRPKkoMz2jJDcxM0fX0MB
  A19DQSNfQ0kzXzEQvsUo3SS+1VLc8tbhE11AvsbxYr7gyNzknRS8vtWQTIzAUUwqOOOxgvP/6
  g94hRkkOJiVR3r4CjwQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryBS4BygkWp6akVaZk5wLiAS
  Utw8CiJ8PZtAErzFhck5hZnpkOkTjEqSonzOm0ESgiAJDJK8+DaYLF4iVFWSpiXkYGBQYinIL
  UoN7MEVf4VozgHo5IwrwjIFJ7MvBK46a+AFjMBLVYwcANZXJKIkJJqYBIomb6tk29VwXHOKWV
  vimbVfnaofSo86/mcr7ttZPe6XH3i+bVuoXC76sPSg/u+RhmEuOV0Pvy0P/x9W03o6gNeZ43X
  3y/byX77R+CbxL9HNiZ1vp73R5fhxjplFkdd3tLvz3x+6s+8r7WtbMPDuENf1bQPl+TJPbbJ/
  cVf792ZPbNhYo8vZzjjs/gVN88zfT8qeVTe7VBibNKmncV2rw8/X7Ov5PLc2uYfcrIbgk/fdP
  XYIB4c0JPt+2O24bWdj5bZq8yU40jlFS1aOmtlyYw57Xt36Z/zWn/avNGp971wzLbi/tsbZXe
  6lstHb5vbttb546W7L2extOSmBM9esOnFfaOLfaWvjf/M/N03P9NZiaU4I9FQi7moOBEAfZdg
  ZUADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-285.messagelabs.com!1615376958!1644692!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3665 invoked from network); 10 Mar 2021 11:49:18 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-18.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2021 11:49:18 -0000
Received: from r01ukexcasm111.r01.fujitsu.local ([10.183.43.167])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ABnHak024511
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 11:49:17 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Mar 2021 11:49:16 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] python3-zipp: upgrade 3.4.0 -> 3.4.1
Date: Wed, 10 Mar 2021 19:49:06 +0800
Message-ID: <1615376946-3261-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1615376946-3261-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1615376946-3261-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM111.r01.fujitsu.local (10.183.43.167)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python3-zipp_3.4.0.bb => python3-zipp_3.4.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.4.0.bb => python3-zipp_3.4.1.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.4.0.bb b/meta/recipes-devtools/python/python3-zipp_3.4.1.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-zipp_3.4.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.4.1.bb
index 97523e8e7c..191d3b38ad 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.4.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.4.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[md5sum] = "ae81f228995578b840d76d1b7d87fede"
-SRC_URI[sha256sum] = "ed5eee1974372595f9e416cc7bbeeb12335201d8081ca8a0743c954d4446e5cb"
+SRC_URI[md5sum] = "3d91c7ab73b62ac3674210df94df600a"
+SRC_URI[sha256sum] = "3607921face881ba3e026887d8150cca609d517579abe052ac81fc5aeffdbd76"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.25.1

