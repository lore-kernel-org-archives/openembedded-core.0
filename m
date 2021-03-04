Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.1888.1614817636839554429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 16:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 69/D8-55623-26920406; Thu, 04 Mar 2021 00:27:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxRTdJ0yH
  B4OxCWYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPvzN9sBQ94Kxa/eM7YwPiAp4uRi0NIYBOT
  xJnmrSwQznFGia6F/axdjJwcbAKaEr1btjB2MXJwiAjoSVz9JwoSZhZQl7i0roUFxBYWcJGYd
  PIwI4jNIqAiMe/UXHYQm1fAVeLmvBNgNRICChJTHr5nBrE5BdwkPn7/BRYXAqo5ceAcM0S9oM
  TJmU9YIOZLSBx88YIZoldRYvblZqg5VRJrOqaxTWDkn4WkZRaSlgWMTKsYLZOKMtMzSnITM3N
  0DQ0MdA0NjXWBpLGBXmKVbqJeaqlucmpeSVEiUFYvsbxYr7gyNzknRS8vtWQTIzAgUwoZmnYw
  vnv1Qe8QoyQHk5Io74Ev9glCfEn5KZUZicUZ8UWlOanFhxhlODiUJHglNBwShASLUtNTK9Iyc
  4DRAZOW4OBREuFVUwNK8xYXJOYWZ6ZDpE4xKkqJ8x4D6RMASWSU5sG1wSLyEqOslDAvIwMDgx
  BPQWpRbmYJqvwrRnEORiVhXk51oCk8mXklcNNfAS1mAlo8y80OZHFJIkJKqoEpJFy3eGJ7aUf
  ZguoW0UdTP4iq13GtezWRJdtR+0CaRtozzUftSkWnq7qO7Ih0O9vR5uBQHhcc/bFYWcet+fys
  pFJXQeclYQz3zJ4eUNr64ghPuU9Uj8FNrkP9+/mnXElYUH1m+QmBM5W6jhfXXHW5rPIk7/1+N
  x3nfSGn3YXe7dVRKUvW5djsy86w1ND3XsnDxad9/NZNMuu4cf1qj6b522Rlz/1+xp3BQiVq76
  z+Jdqr2yY/NT6sFDxh2y6j3Y5ChQ7+2u+MVTUYl/yT01qwsPLbnTtqt0wWZR+xFJu1UuFWW9l
  7ToHL++dfbZxkdVarb5WRq6qWvbVTwMar994tjTE74tB/n2+rDa/YZCWW4oxEQy3mouJEAG4E
  RDpDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-226.messagelabs.com!1614817633!198588!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16541 invoked from network); 4 Mar 2021 00:27:14 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-5.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2021 00:27:14 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1240RDr5027212
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Mar 2021 00:27:13 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 00:27:12 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] mklibs-native: upgrade 0.1.44 -> 0.1.44.1
Date: Thu, 4 Mar 2021 08:26:37 +0800
Message-ID: <1614817602-40383-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1614817602-40383-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1614817602-40383-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{mklibs-native_0.1.44.bb => mklibs-native_0.1.44.1.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.44.bb => mklibs-native_0.1.44.1.bb} (70%)

diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.1.bb
similarity index 70%
rename from meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
rename to meta/recipes-devtools/mklibs/mklibs-native_0.1.44.1.bb
index 1784af1f4c..dcedf421b9 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.44.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20180828T214102Z/pool/main/m/mklibs/mklibs_${PV}.tar.xz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20210303T024957Z/pool/main/m/mklibs/mklibs_${PV}.tar.xz \
 	file://ac_init_fix.patch\
 	file://fix_STT_GNU_IFUNC.patch\
 	file://sysrooted-ldso.patch \
@@ -13,9 +13,10 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20180828T214102Z/pool/main/
 	file://show-GNU-unique-symbols-as-provided-symbols.patch \
 	file://fix_cross_compile.patch \
 "
+S = "${WORKDIR}/mklibs-0.1.44ubuntu3"
 
-SRC_URI[md5sum] = "6b6eeb9b4016c6a7317acc28c89e32cc"
-SRC_URI[sha256sum] = "3af0b6bd35e5b6fc58d8b68827fbae2ff6b7e20dd2b238ccb9b49d84722066c2"
+SRC_URI[md5sum] = "bdd94f148086f433869826daf8dd2602"
+SRC_URI[sha256sum] = "5ff31579aae688a502dd2072b77b398478d5fcfb7ce524a5da5b3691ab8c4bcd"
 
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/m/mklibs/"
 
-- 
2.25.1

