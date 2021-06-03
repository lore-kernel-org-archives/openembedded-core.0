Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web12.4743.1622704430010196377
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 00:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EHzdASX7;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622704427; i=@fujitsu.com;
	bh=fapLCypqjiqsA6MiMYgET6f0851LpBmPIX438O3DrfQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EHzdASX78LXoBqt8whAZze2Zr3iZA57gyYjWQ7GwnUTUXHKW3/2Ye8vPZfCUK1RYk
	 HAeIxa+KdKCewLT2TvQw+o0Sx3uvYKwh1EEzd1rKA7MidRTLCvsO8jDxe6/BOsH1rR
	 zgcWBnRsCaTCHHUG67Nh+ClXVpZvcf2We8aBQZf6KiFBK5fSAfwWBcF2pKDFpW+kVA
	 WFElfHIX/N5dosVjqzftD9h5x/6TBsDbZM4Yupb5tOFA5fRkYtCVCxBjE6jfwB5BWI
	 hmalneRTfSRGmdvdJXkLYoo7X5vnPMzlyJWoGeakjrqrdUe7TeRi9yTgl4bHCFJUpz
	 95TCvSY2p4L1g==
Received: from [100.112.193.7] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id F0/FD-45475-B2188B06; Thu, 03 Jun 2021 07:13:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxRVercUe
  CQdcbK4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaO3qYWl4AlPxfq/H9gaGE9zdzFycQgJzGSS
  uNS6jhHCOc4o0b5oInsXIycHm4CaxPRbN1i7GDk4RAT0JK7+EwUJMwuoSLz43QNWIixgJbHr6
  TImEJsFKP746wRGEJtXwEni4LU9zCC2hICCxJSH75kh4oISJ2c+YYGYIyFx8MULqBpFidmXm1
  kg7AqJ14cvMU9g5J2FpGUWkpYFjEyrGC2SijLTM0pyEzNzdA0NDHQNDY10DS1NdQ1NDfUSq3Q
  T9VJLdctTi0t0gdzyYr3iytzknBS9vNSSTYzA8EopODx9B2P/mw96hxglOZiURHmN03YkCPEl
  5adUZiQWZ8QXleakFh9ilOHgUJLgLaoHygkWpaanVqRl5gBDHSYtwcGjJMIrVwuU5i0uSMwtz
  kyHSJ1iVJQS530L0icAksgozYNrg8XXJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvAdApv
  Bk5pXATX8FtJgJaLGA1zaQxSWJCCmpBqbprEWuU1Ul/VZ+rLj8oqtQXjlw5mnL2Xlzbk4u2T6
  /qPXorab2X8Z7v81zMPHYrlqs+sRCrmi77+nQrDenZI/Nkk69scXpyg1Xr82vnR79qZvtPW+H
  zrzD0+6d74mYZRnv3KjqlhFs/4tFlDWlP+N6gcnRbJYXwfd3uXmtvpdmxL9EfPqOJ+xyvk7T1
  00PCPjcviFr1ZsVukxMPT+/a9RM/P/jy2W/GImuzPaSjLvFYedd+ZZzRT4sWZx/0na2J+cW3i
  Mnu/1+V50V0Vby/HPvVPE0noTqOb1bN21c+4nb0jzZwztvW8cbdlWVvbceX/Jq5DSP8L1jeH3
  DI9O6llDWa4Evt+/qLj8adMQ11lyJpTgj0VCLuag4EQBke4ZhKgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-267.messagelabs.com!1622704426!138996!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28042 invoked from network); 3 Jun 2021 07:13:46 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-2.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2021 07:13:46 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1537Dd8P023806
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jun 2021 08:13:46 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 08:13:37 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] cmake: upgrade 3.20.2 -> 3.20.3
Date: Thu, 3 Jun 2021 15:13:18 +0800
Message-ID: <1622704403-26153-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cmake/{cmake-native_3.20.2.bb => cmake-native_3.20.3.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.20.2.bb => cmake_3.20.3.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.20.2.bb => cmake-native_3.20.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.20.2.bb => cmake_3.20.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.20.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index be43760628..0987c01c87 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "aecf6ecb975179eb3bb6a4a50cae192d41e92b9372b02300f9e8f1d5f559544e"
+SRC_URI[sha256sum] = "4d008ac3461e271fcfac26a05936f77fc7ab64402156fb371d41284851a651b8"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.20.2.bb b/meta/recipes-devtools/cmake/cmake_3.20.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.20.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.20.3.bb
-- 
2.25.1

