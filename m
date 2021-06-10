Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.7173.1623313928696922288
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 01:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UtF7k1Sk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623313926; i=@fujitsu.com;
	bh=PrONT+PATR6Tv5N9BZwrHY5bomm18pUHTn2RUcKPj2o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=UtF7k1Sk1WXEmv+Av80POX9YMIF+Lxt3wcffAPyebWBu2V/EDI3QTJnp9Nw0y/14I
	 lAwj530fgkRs1NFn38FVRf7mFemzq9lss+l8WhXaiNmEaQZattxdiK/T8dQG2jFcEm
	 YFTzOAUoDawSVo17bKAEheAlWLL91gXf0HcI958Kzeb+DJqbxocJoRNUcfyGsPawUq
	 9uv55BniIRysECfGV61q8Pbyf7jlIBnhU+36BsX7YCRTZuaRVuuYiz82vNOQJTM6Ck
	 yHiWT4h2ShlQxkrJQwXKM1xvaW8s3wxo5dohmV6QwrDWLzmQD8x3/Tv7BWGpZOT4dZ
	 OnWjLKqFY/TJg==
Received: from [100.113.1.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id B0/E3-37841-60EC1C06; Thu, 10 Jun 2021 08:32:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRost27mC
  Cwb8OQYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP3BN6CY3wVDy5uYG1gnMDbxcjFISQwi0li
  6t21LBDOCUaJd6+WsHYxcnKwCahJTL91A8jm4BAR0JO4+k8UJMwsoCLx4ncPO4gtLGAhsW7Ce
  mYQm0VAVeL3tQawOK+Ak8T1aY8ZQWwJAQWJKQ/fg9VwCjhLTO44ADZeCKjmwcrbbBD1ghInZz
  5hgZgvIXHwxQtmiF5FidmXm1kg7AqJ14cvMU9g5J+FpGUWkpYFjEyrGC2TijLTM0pyEzNzdA0
  NDHQNDY11DXWNjMz0Eqt0E/VSS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgeGYUsj4aAfj
  6dcf9A4xSnIwKYny3l5wMEGILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO+pM0A5waLU9NSKtMwcY
  GzApCU4eJREeCvPAqV5iwsSc4sz0yFSpxgVpcR5ZUESAiCJjNI8uDZYPF5ilJUS5mVkYGAQ4i
  lILcrNLEGVf8UozsGoJMwbCjKFJzOvBG76K6DFTECLHY33gSwuSURISTUwzfnYqBP/rOPXJ+Z
  /FfOzVWsqmdxnzGW28bv+/ORcG+Ech6Jv/vqn9ufe4bj6t9NXyfi4fXMDm8CEWruDbpkHXtWk
  JLT9n3/2xv53kjV9b9+rnQ/qMor1jhJQnjPr779fmgLHn7DdkjDfaa745D7bjvBKI7HO0z9N3
  7/N0otbxTRpzweOQ0v36kuddZo/n7/477xn2Q1/nvewn0rKn5Nr86/E+QvH9L0LvsT2zgswiF
  C+rH6+iWmb59vWu819L6WXJPz+HrvPvag0fOUShWJL32cOycdmXHCYMnNXwwwf5/TlKsHrVpf
  GFOzI3c9VuGVNluJOhnA5iccVuxNqU/NmrZq4Y/7+6nM+x49cc/o8Q4mlOCPRUIu5qDgRAARt
  G4FCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-226.messagelabs.com!1623313925!8207!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18363 invoked from network); 10 Jun 2021 08:32:06 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-5.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jun 2021 08:32:06 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15A8W2ci007177
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 09:32:05 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 09:32:01 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ethtool: upgrade 5.10 -> 5.12
Date: Thu, 10 Jun 2021 16:31:38 +0800
Message-ID: <1623313898-45731-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623313898-45731-1-git-send-email-wangmy@fujitsu.com>
References: <1623313898-45731-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh avoid_parallel_tests.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch | 2 +-
 .../ethtool/{ethtool_5.10.bb => ethtool_5.12.bb}                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.10.bb => ethtool_5.12.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 54aec01284..b3f3de4a16 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -19,7 +19,7 @@ index 13c2bc0..0b6ca1d 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.10, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.12, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.10.bb b/meta/recipes-extended/ethtool/ethtool_5.12.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.10.bb
rename to meta/recipes-extended/ethtool/ethtool_5.12.bb
index 5c0df3acbc..df7dd47748 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.10.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.12.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "4b86adb3ed913c1ef14a276301981f696ab4ec360c19f0a5b68235c4756abae5"
+SRC_URI[sha256sum] = "7ca623cc1dd25ba66531573da6a11f1ecde9b62b00742d9ba54f9ba983439bfa"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.25.1

