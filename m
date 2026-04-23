Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606EEF99351
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 08:42:39 +0000 (UTC)
Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15110.1776933751121164335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 01:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=ZOPxEIxH;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=56620df78=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1776933751; x=1808469751;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MBKJbIGx5bcSQgHQgJlCdKaGILETakoOrYgsf8puP0A=;
  b=ZOPxEIxHnZ3Ve2QgRt9wJtOwV2KyQrMbgqOfN1aMCRIOEdSGZ2uwf5at
   uaRUu6DJqJKg+1iSCYzEtm7OPQg9F46GL3nPOvNBRaI6buT2nRslBeEHu
   NS/6m+oAbOlhS8zU5dQzxkG1iyYJ0bFFf/FVJe6IcDMMPdl2KaLqqn21i
   w=;
X-CSE-ConnectionGUID: djoil/VXSSmEFKniLNxQsQ==
X-CSE-MsgGUID: GZDxf3laSWKyZPvN5LLQrw==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 23 Apr 2026 10:42:28 +0200
Received: from unknown (HELO esabb5.muc) ([10.31.187.136]) by esagw4.muc with
 ESMTP/TLS; 23 Apr 2026 10:42:28 +0200
Received: from smucmp16a.bmwgroup.net (HELO smucmp16a.europe.bmw.corp)
 ([10.30.13.143]) by esabb5.muc with ESMTP/TLS; 23 Apr 2026 10:42:28 +0200
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp16a.europe.bmw.corp (2a03:1e80:a15:58f::1:2a) with Microsoft SMTP
 Server (version=TLS; Thu, 23 Apr 2026 10:42:28 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.202) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Thu, 23 Apr 2026 10:42:28 +0200
X-CSE-ConnectionGUID: f3fBMaCGR2COcNU1Ocz1EQ==
X-CSE-MsgGUID: lUJE6+YGS+aYEh12+5xWZA==
X-CSE-ConnectionGUID: UvDGpvZfT5eihpoKHY3Buw==
X-CSE-MsgGUID: y4tPM6BARMKtnVtClDnshg==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] cmake: upgrade 4.3.1 -> 4.3.2
Date: Thu, 23 Apr 2026 10:41:21 +0200
Message-ID: <20260423084121.806841-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17b.europe.bmw.corp (2a03:1e80:a15:58f::1:4c) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235750

Release notes are available at [0].

[0]: https://cmake.org/cmake/help/v4.3/release/4.3.html#id2

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../cmake/{cmake-native_4.3.1.bb => cmake-native_4.3.2.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.3.1.bb => cmake_4.3.2.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.3.1.bb => cmake-native_4.3.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.3.1.bb => cmake_4.3.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb b/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.3.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index fee2efc2f3607ab91db8e4e3465238225553b9e1..889badb7726fc5754c2463c0a7bec0ddf22bc02e 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "0798f4be7a1a406a419ac32db90c2956936fecbf50db3057d7af47d69a2d7edb"
+SRC_URI[sha256sum] = "b0231eb39b3c3cabdc568c619df78208a7bd95ea10c9b2236d61218bac1b367d"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.3.1.bb b/meta/recipes-devtools/cmake/cmake_4.3.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.3.1.bb
rename to meta/recipes-devtools/cmake/cmake_4.3.2.bb

