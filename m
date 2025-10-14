Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F85CCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 08:47:28 +0000 (UTC)
Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web11.10611.1760431639288774750
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 01:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=qCJI1r+k;
 spf=pass (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=37518b124=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1760431640; x=1791967640;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U8DvbAeZUFZOw8uX46H7Gxh+PqlmcVjkU9cX8T0AlNM=;
  b=qCJI1r+kd/AWUYtjjwdCInYyYwXFOKgHmflFHu2Gdy8eFhx7/M3oX5+u
   gD0c+wfMEkgJPEgNHyWkTvig/1s2aBtYe3ZoePg7wzv9NhPdvcwD2APC6
   Oi5O1WSbOz/HUbVuIQ9u1+1b/p5f2BXP8s8ZLgKSJN44o54RHTrzFb1l6
   g=;
X-CSE-ConnectionGUID: /ha60NjKSL2unMd4xFDGCg==
X-CSE-MsgGUID: ErjmWffrT7+tkgQvZrPEIg==
Received: from 160.46.252.34.spf.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Oct 2025 10:47:17 +0200
Received: from unknown (HELO esabb6.muc) ([10.31.187.137]) by esagw1.muc with
 ESMTP/TLS; 14 Oct 2025 10:47:16 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb6.muc with ESMTP/TLS; 14 Oct 2025 10:47:17 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.211) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Tue, 14 Oct 2025 10:47:16 +0200
X-CSE-ConnectionGUID: Ninp5uvsSi2+u39Yk7QZ3Q==
X-CSE-MsgGUID: aycrNG6zT1CgHsZ4jWXrzw==
X-CSE-ConnectionGUID: scC6bHVzQMWBUOrdXEqLcA==
X-CSE-MsgGUID: SiPnAf7FR8qP+of/PSXj2Q==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] cmake: upgrade 4.1.1 -> 4.1.2
Date: Tue, 14 Oct 2025 10:46:52 +0200
Message-ID: <20251014084652.444354-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17d.europe.bmw.corp (2a03:1e80:a15:58f::1:66) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 08:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224814

Release notes are available at [0].

[0]: https://cmake.org/cmake/help/v4.1/release/4.1.html#id2

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...-native_4.1.1.bb => cmake-native_4.1.2.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc         |  3 +-
 ...d-using-undocumented-type-for-CURLOP.patch | 35 -------------------
 .../cmake/{cmake_4.1.1.bb => cmake_4.1.2.bb}  |  0
 4 files changed, 1 insertion(+), 37 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.1.1.bb => cmake-native_4.1.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
 rename meta/recipes-devtools/cmake/{cmake_4.1.1.bb => cmake_4.1.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.1.1.bb b/meta/recipes-devtools/cmake/cmake-native_4.1.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.1.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.1.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index e86bb3dec1..256275d42b 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -17,10 +17,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=0cafc0f3b6b28f3d5ecb5d1a68c36471 \
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
-           file://0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch \
            "
 
-SRC_URI[sha256sum] = "b29f6f19733aa224b7763507a108a427ed48c688e1faf22b29c44e1c30549282"
+SRC_URI[sha256sum] = "643f04182b7ba323ab31f526f785134fb79cba3188a852206ef0473fee282a15"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch b/meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
deleted file mode 100644
index d04d0be795..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c8143074cf3954b1e169904eb9d843cfbe14acc3 Mon Sep 17 00:00:00 2001
-From: Brad King <brad.king@kitware.com>
-Date: Tue, 2 Sep 2025 11:41:10 -0400
-Subject: [PATCH] cmCTestCurl: Avoid using undocumented type for
- CURLOPT_PROXYTYPE values
-
-Since upstream curl commit `1a12663d06` (CURLOPT: bump `CURLPROXY_*`
-enums to `long`, drop casts, 2025-07-28), the `CURLPROXY_*` constants
-are integer literals instead of `enum curl_proxytype`.  It turns out
-that `curl_easy_setopt` has always expected a `long` anyway, and that
-`curl_proxytype` is not documented for public use.
-
-Fixes: #27178
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-Upstream-Status: Backport [https://gitlab.kitware.com/cmake/cmake/-/commit/c8143074cf3954b1e169904eb9d843cfbe14acc3]
----
- Source/CTest/cmCTestCurl.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/CTest/cmCTestCurl.h b/Source/CTest/cmCTestCurl.h
-index 7836f4b9c7..9113890b5a 100644
---- a/Source/CTest/cmCTestCurl.h
-+++ b/Source/CTest/cmCTestCurl.h
-@@ -52,7 +52,7 @@ private:
-   std::vector<std::string> HttpHeaders;
-   std::string HTTPProxyAuth;
-   std::string HTTPProxy;
--  curl_proxytype HTTPProxyType;
-+  long HTTPProxyType;
-   bool UseHttp10 = false;
-   bool Quiet = false;
-   int TimeOutSeconds = 0;
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/cmake/cmake_4.1.1.bb b/meta/recipes-devtools/cmake/cmake_4.1.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.1.1.bb
rename to meta/recipes-devtools/cmake/cmake_4.1.2.bb

