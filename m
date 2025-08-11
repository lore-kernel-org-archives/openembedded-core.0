Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B871C87FDA
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 05:47:14 +0000 (UTC)
Received: from esa12.hc324-48.eu.iphmx.com (esa12.hc324-48.eu.iphmx.com [207.54.72.34])
 by mx.groups.io with SMTP id smtpd.web11.41394.1754891225511371559
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 22:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=A8ykcS2Q;
 spf=pass (domain: bmw.de, ip: 207.54.72.34, mailfrom: prvs=3110e8bf1=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1754891225; x=1786427225;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ouLc3nSOhTkeIiSsEzQn/mNhgMIg+Bosz/yoS+LiepM=;
  b=A8ykcS2Q4gzIuoxFQtwVIX2xdU+4dTlLzG3p1RS66XJnufXpwagVlLiR
   j827wyMZiFHe5zLhOpdjmrlHQJkdWB68iWslEJHZMC+PgsZTfdT30rThT
   y0Aw0dk7LAfYlvm5iT0Xdsciz36Of15VAtXpN0yu/xEz5UVvkwaL1Pdkg
   w=;
X-CSE-ConnectionGUID: qnM6JeibR5qaY9UrzeW1Eg==
X-CSE-MsgGUID: xO4tp+EpS/OiPbDCgRpEzw==
Received: from 160.46.252.38.spf.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa12.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Aug 2025 07:47:03 +0200
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw2.muc with
 ESMTP/TLS; 11 Aug 2025 07:47:03 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb4.muc with ESMTP/TLS; 11 Aug 2025 07:47:04 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.206) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 11 Aug 2025 07:47:02 +0200
X-CSE-ConnectionGUID: KtcrqIvnSbGKpSdIFwjLew==
X-CSE-MsgGUID: 7mfI2oleQDi2Q28AUXWYCg==
X-CSE-ConnectionGUID: KtK6eFxeTIWYNwB3PC3RuQ==
X-CSE-MsgGUID: K1kB7IPRQ5ijiEygzTtaZA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] cmake: upgrade 4.0.3 -> 4.1.0
Date: Mon, 11 Aug 2025 07:46:43 +0200
Message-ID: <20250811054643.1034266-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18g.europe.bmw.corp (2a03:1e80:a15:58f::1:79) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 05:47:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221718

Release notes are available at [0].

[0]: https://cmake.org/cmake/help/v4.1/release/4.1.html

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../cmake/{cmake-native_4.0.3.bb => cmake-native_4.1.0.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.0.3.bb => cmake_4.1.0.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.0.3.bb => cmake-native_4.1.0.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.0.3.bb => cmake_4.1.0.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb b/meta/recipes-devtools/cmake/cmake-native_4.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.0.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.1.0.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index a15dfd3bb4..cbeeb31520 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "8d3537b7b7732660ea247398f166be892fe6131d63cc291944b45b91279f3ffb"
+SRC_URI[sha256sum] = "81ee8170028865581a8e10eaf055afb620fa4baa0beb6387241241a975033508"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.0.3.bb b/meta/recipes-devtools/cmake/cmake_4.1.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.0.3.bb
rename to meta/recipes-devtools/cmake/cmake_4.1.0.bb

