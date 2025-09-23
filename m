Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E68BCAC5A5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 06:48:39 +0000 (UTC)
Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web11.10707.1758610114988497432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 23:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=gS5Cuzcj;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=354c56002=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1758610115; x=1790146115;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=InZIbvgzn37H5z92/6clxv0PxH38pZ0NBoMic+h9H80=;
  b=gS5Cuzcj6ncTyDdPnCM9quKFIPUMVF/S0M0jhd07Yenp8Y/sP7oUX0Wv
   36Ix22nZWPUU2tmp48MTiiB27GQ4omxDN1q84jmz907KPZasIacu2WGy0
   OH97lNC8v4JC/F3oldpJffaoLor29xAAilbR5V7bvDXHiArRKnnRG5ymd
   8=;
X-CSE-ConnectionGUID: +DCxFFS8SRONJj5AwlS2FA==
X-CSE-MsgGUID: ZeExtW02QIyx0M22oS3AJQ==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 23 Sep 2025 08:48:32 +0200
Received: from unknown (HELO esabb2.muc) ([10.31.187.133]) by esagw6.muc with
 ESMTP/TLS; 23 Sep 2025 08:48:32 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb2.muc with ESMTP/TLS; 23 Sep 2025 08:48:31 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.211) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Tue, 23 Sep 2025 08:48:31 +0200
X-CSE-ConnectionGUID: oCengc24QK6W06MvdOV5BQ==
X-CSE-MsgGUID: t75Pg00DQhuJt4KYRXzDog==
X-CSE-ConnectionGUID: psuWd6irSR2u3EMAvePymg==
X-CSE-MsgGUID: Wo7oV8k6SlKXXxwRQ5P9gA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] cmake: upgrade 4.1.0 -> 4.1.1
Date: Tue, 23 Sep 2025 08:47:53 +0200
Message-ID: <20250923064753.189961-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18e.europe.bmw.corp (2a03:1e80:a15:58f::1:75) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 06:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223865

Release notes are available at [0].

[0]: https://cmake.org/cmake/help/v4.1/release/4.1.html#id1

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../cmake/{cmake-native_4.1.0.bb => cmake-native_4.1.1.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.1.0.bb => cmake_4.1.1.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.1.0.bb => cmake-native_4.1.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.1.0.bb => cmake_4.1.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.1.0.bb b/meta/recipes-devtools/cmake/cmake-native_4.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.1.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.1.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index b2d3d60ef9..e86bb3dec1 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-cmCTestCurl-Avoid-using-undocumented-type-for-CURLOP.patch \
            "
 
-SRC_URI[sha256sum] = "81ee8170028865581a8e10eaf055afb620fa4baa0beb6387241241a975033508"
+SRC_URI[sha256sum] = "b29f6f19733aa224b7763507a108a427ed48c688e1faf22b29c44e1c30549282"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.1.0.bb b/meta/recipes-devtools/cmake/cmake_4.1.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.1.0.bb
rename to meta/recipes-devtools/cmake/cmake_4.1.1.bb

