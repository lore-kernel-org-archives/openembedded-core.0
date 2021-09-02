Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.4034.1630570338448090571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 01:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BwmOB9om;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630570335; i=@fujitsu.com;
	bh=rv5X0AHpEOMkeoTBpHopP+Pra0LKmCu8LwMANHF5h00=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BwmOB9omu6nx1XwSUcFPM8ikQWzjvOcqEZ6+G4WLrMC02Uvpsz4nw7qLkI9PhGud2
	 Jc6dWN9rfRPKk99bSBAXdmWogxx788h9MTkqqAD4kdSqELpAatb/DbSBaCHpsOfrs3
	 NSgthEDXu6GtmNeic8pW8UL7fQKej2Co6ce1R7LkUs2DhJbBrwVl04+BoJW7nEJHdy
	 E0U0fsujiJFRgon4zUCF0V2ZEPi+YEtuPhWBg79y52aMaGnZY61V5mNKsnRvFIoj0G
	 el+W1T/KZadUuREkcVusVnSV0JAGOnid/d5D2uqX9MnmvIIqdeQkrX0FrIf3+ZTh8i
	 9aTUPVxofDo3w==
Received: from [100.112.199.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id E2/4E-30018-F5780316; Thu, 02 Sep 2021 08:12:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRqhvXbpB
  ocHC2hcWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjH18Vnmgic8FbcedLA3MJ7m7mLk4hASmMkk
  sXzHJkYI5zijxKqpL9m7GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x6wEmEBK4n5T
  66xgtgsQPEF8w8zg9i8Ao4SVz+cZQOxJQQUJKY8fA8VF5Q4OfMJC8QcCYmDL14wQ9QoSsy+3M
  wCYVdIzJrVxjSBkXcWkpZZSFoWMDKtYrRIKspMzyjJTczM0TU0MNA1NDTSNbQ01zUysdRLrNJ
  N0kst1S1PLS7RNdRLLC/WK67MTc5J0ctLLdnECAyvlIKjP3cwPnz9Qe8QoyQHk5Ior1uVQaIQ
  X1J+SmVGYnFGfFFpTmrxIUYZDg4lCd7/zUA5waLU9NSKtMwcYKjDpCU4eJREeOe1AaV5iwsSc
  4sz0yFSpxgVpcR5L4MkBEASGaV5cG2w+LrEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3qh
  FoCk9mXgnc9FdAi5mAFvP80AFZXJKIkJJqYOpVrmRz2tV9wy1ji0JbX464gobVye4NnCe6fxi
  VzY7mK/U4a//yZsyfI0XvHfvqt9c5yZ1rd91efzh72+YvtjHqfC+O3KprvRU36/1qi/tLyx4u
  0hSa0X9b0aw8ISMgtc7lzaTMrZFpWuzuRSylU/+UPjauWrM78e3Xtj0q31tjVE48TbF41tggy
  8rdpt8ZftXgloXGfNn85q9uO0R5mtVthba6hn1n6ljCkVtZuWPzvJTurKCfh/PMHpS+T9eR6e
  V60+I7xXbd304j6UVpNyYUrE7tM+t7mLtk/vy+F+Lxym+c33ya+sfU7tFa/58LNrwv3JbRxH/
  xf69sfvFKszMSJx+/OWo82+z//N38SizFGYmGWsxFxYkA+RP38ioDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-291.messagelabs.com!1630570334!256919!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21459 invoked from network); 2 Sep 2021 08:12:14 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-8.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Sep 2021 08:12:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1828C6xo022220
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 2 Sep 2021 09:12:14 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 2 Sep 2021 09:12:04 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] cmake: upgrade 3.21.1 -> 3.21.2
Date: Thu, 2 Sep 2021 16:11:56 +0800
Message-ID: <1630570316-1724-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cmake/{cmake-native_3.21.1.bb => cmake-native_3.21.2.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.21.1.bb => cmake_3.21.2.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.21.1.bb => cmake-native_3.21.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.21.1.bb => cmake_3.21.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.21.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.21.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.21.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.21.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 7f0aff8118..2bdfd6061a 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "fac3915171d4dff25913975d712f76e69aef44bf738ba7b976793a458b4cfed4"
+SRC_URI[sha256sum] = "94275e0b61c84bb42710f5320a23c6dcb2c6ee032ae7d2a616f53f68b3d21659"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.21.1.bb b/meta/recipes-devtools/cmake/cmake_3.21.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.21.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.21.2.bb
-- 
2.25.1

