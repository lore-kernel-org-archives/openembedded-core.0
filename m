Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0914CD6E5D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 06:15:09 +0000 (UTC)
Received: from esa5.hc324-48.eu.iphmx.com (esa5.hc324-48.eu.iphmx.com [207.54.71.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2449.1780640100080186896
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 23:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=HWn2bTc3;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.71.60, mailfrom: prvs=609d86a93=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1780640100; x=1812176100;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CcmkAFSXpI9EtPghhPyFsF2hV0VqudZ6i4q2ri4apf4=;
  b=HWn2bTc3hveQQyUcnzGnFUZ4/owr6qCjhVkaiq7Z1ycxtSVuN9qH6Kk7
   z+HTxskUSjO+o0mO7y0KD6VJu4/yd23H7p63+dyUi4Uhm+x0SaBzggmZ0
   NIuR0dxPrN3pbwyYsfXjIMtWVXeNHwDgrhKAAK/lB3dLDy4Kj9gh7hVKB
   0=;
X-CSE-ConnectionGUID: 8vKpCkWcRECHUrkRtLKjyA==
X-CSE-MsgGUID: xpSst1BXTRu5klsQrs7qMA==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa5.hc324-48.eu.iphmx.com with ESMTP/TLS; 05 Jun 2026 08:14:57 +0200
Received: from unknown (HELO esabb6.muc) ([10.31.187.137]) by esagw4.muc with
 ESMTP/TLS; 05 Jun 2026 08:14:57 +0200
Received: from smucmp17c.bmwgroup.net (HELO smucmp17c.europe.bmw.corp)
 ([10.30.13.153]) by esabb6.muc with ESMTP/TLS; 05 Jun 2026 08:14:58 +0200
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp17c.europe.bmw.corp (2a03:1e80:a15:58f::1:46) with Microsoft SMTP
 Server (version=TLS; Fri, 5 Jun 2026 08:14:57 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.213) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Fri, 5 Jun 2026 08:14:57 +0200
X-CSE-ConnectionGUID: XyTikxrwQPqahZ5mIx2jxg==
X-CSE-MsgGUID: M6nts+WrTZyEAjHrHMAXKw==
X-CSE-ConnectionGUID: dPQWIliMR1O7ScFfw4VKug==
X-CSE-MsgGUID: Id/hVDAHSk26xpXsHcSYBA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] cmake: upgrade 4.3.2 -> 4.3.3
Date: Fri, 5 Jun 2026 08:14:39 +0200
Message-ID: <20260605061439.3395090-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15f.europe.bmw.corp (2a03:1e80:a15:58f::1:4e) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 06:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238139

Release notes are available at [0].

[0]: https://cmake.org/cmake/help/v4.3/release/4.3.html#id3

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../cmake/{cmake-native_4.3.2.bb => cmake-native_4.3.3.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.3.2.bb => cmake_4.3.3.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.3.2.bb => cmake-native_4.3.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.3.2.bb => cmake_4.3.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.3.2.bb b/meta/recipes-devtools/cmake/cmake-native_4.3.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.3.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.3.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 889badb7726fc5754c2463c0a7bec0ddf22bc02e..f183f823e3c591e93e5483c0b47b13bf1716c411 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "b0231eb39b3c3cabdc568c619df78208a7bd95ea10c9b2236d61218bac1b367d"
+SRC_URI[sha256sum] = "cba4bb7a44edf2877bb6f059932896383babe435b3a8c3b5df48b4aa41c9bb85"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.3.2.bb b/meta/recipes-devtools/cmake/cmake_4.3.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.3.2.bb
rename to meta/recipes-devtools/cmake/cmake_4.3.3.bb

