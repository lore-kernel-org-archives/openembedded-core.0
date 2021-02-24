Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web12.7645.1614176808101825306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:26:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 44/5A-14660-62266306; Wed, 24 Feb 2021 14:26:46 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxVVc1ySz
  B4NNmTYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePhxonsBSv5K04cm8zawLiNt4uRi0NIYDOT
  xKf165khnBOMEpcPP2TrYuTkYBPQlOjdsoWxi5GDQ0RAT+LqP1GQMLOAusSldS0sILawgLnE/
  I8v2UFsFgFViYVfZoHZvAKuEs1nO8BqJAQUJKY8fM8MEReUODnzCQvEHAmJgy9eMEPUKErMvt
  wMVV8lsaZjGtsERt5ZSFpmIWlZwMi0itEiqSgzPaMkNzEzR9fQwEDX0NBI19ASiI1N9RKrdBP
  1Ukt1y1OLS3QN9RLLi/WKK3OTc1L08lJLNjECwyul4ED7DsZHrz/oHWKU5GBSEuX96G2WIMSX
  lJ9SmZFYnBFfVJqTWnyIUYaDQ0mCtzgeKCdYlJqeWpGWmQMMdZi0BAePkgjvvDigNG9xQWJuc
  WY6ROoUo6KUOK9WAlBCACSRUZoH1waLr0uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHljQa
  bwZOaVwE1/BbSYCWjxlRiwxSWJCCmpBiY90/fXO5q4dD8IVLaz8LdLy83/++pYlJfbW+sTvN9
  W13g8fmNVnntPNWmvi+SC0t3ffZqVhaZoNVysSPtjedCO91JW8wnzO1Kuc2+9+aB6dO4b3hOq
  MY/2lH+49Nxh+rvWQ/+kEpzvMj/Sero49fVNndK/vJ9ezzDNTVSvaqrU01+jO3F3zOdGp7OlJ
  blXuyfLsc/y1+B7xh4Rvnmx9s39l+PbjgvrTbaaZH9j72pF74epDx9q7mgO1hCo7alZMdd60e
  x1onxHX26/Xr+kN57/X8Nzk/hC1++vtuY//1O2fMd7vrttDxseFHOrrun8p8GkFXecXS3v+O0
  9mYttLf/Ws0ocl10dbyrd9CPW5IMSS3FGoqEWc1FxIgBemrAZKgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-29.tower-265.messagelabs.com!1614176805!521167!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23410 invoked from network); 24 Feb 2021 14:26:45 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-29.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Feb 2021 14:26:45 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 11OEQdt1005989
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 14:26:44 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Feb 2021 14:26:37 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] bluez5: upgrade 5.55 -> 5.56
Date: Wed, 24 Feb 2021 22:26:26 +0800
Message-ID: <1614176788-19920-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

-License-Update:
remove the description of license from src/main.c

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc                   | 2 +-
 .../bluez5/{bluez5_5.55.bb => bluez5_5.56.bb}                 | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.55.bb => bluez5_5.56.bb} (91%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 4c1156c67c..a7b628ce1b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
-                    file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e"
+                    file://src/main.c;beginline=1;endline=24;md5=0ad83ca0dc37ab08af448777c581e7ac"
 DEPENDS = "dbus glib-2.0"
 PROVIDES += "bluez-hcidump"
 RPROVIDES_${PN} += "bluez-hcidump"
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb b/meta/recipes-connectivity/bluez5/bluez5_5.56.bb
similarity index 91%
rename from meta/recipes-connectivity/bluez5/bluez5_5.55.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.56.bb
index 8190924562..676cb2dbb2 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.56.bb
@@ -1,7 +1,7 @@
 require bluez5.inc
 
-SRC_URI[md5sum] = "94972b8bc7ade60c72b0ffa6ccff2c0a"
-SRC_URI[sha256sum] = "8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e0894e9b88"
+SRC_URI[md5sum] = "e6c51b2aefa7c56ff072819a78611fa5"
+SRC_URI[sha256sum] = "59c4dba9fc8aae2a6a5f8f12f19bc1b0c2dc27355c7ca3123eed3fe6bd7d0b9d"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.25.1

