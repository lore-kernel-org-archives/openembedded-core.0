Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9964C55162
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 06:38:57 +0000 (UTC)
Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37587.1785739135331404510
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 23:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=FVNH9CgA;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=668abdce1=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1785739135; x=1817275135;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B7ZEwyTDfclP2DzX5f6Fe7bvew6rX9CzLHWfCjcd52Q=;
  b=FVNH9CgAuOxJkIIe3Uj2sQvqpTCwnxFhh0Vux/E8gX+S5NoL3Gcuyhd6
   mJciyz/TprD+vLLomf+eKCqK3460jPL4/ofKMOlP80g1kTOW+kWB1xIRl
   3a4aCGDUMhE0RSQsdV0S4Cbe9k25vyt2r+qZx24k/2gcBpignbQXv8ckp
   M=;
X-CSE-ConnectionGUID: 2bJPa0PfTOKI98dELMZt+A==
X-CSE-MsgGUID: omn0eNbxTa+Iu7xfIfa7Kw==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 03 Aug 2026 08:38:53 +0200
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw3.muc with
 ESMTP/TLS; 03 Aug 2026 08:38:53 +0200
Received: from smucmp21a.bmwgroup.net (HELO smucmp21a.europe.bmw.corp)
 ([10.100.172.92]) by esabb3.muc with ESMTP/TLS; 03 Aug 2026 08:38:53 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.209) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Mon, 3 Aug 2026 08:38:52 +0200
X-CSE-ConnectionGUID: NrBOsx10Qlu7JmDu+4XnlQ==
X-CSE-MsgGUID: F36fE6JVTWW56f7CuXQywg==
X-CSE-ConnectionGUID: ZfTJMCk5SwWtyNZohPyv7A==
X-CSE-MsgGUID: 1vN/b2prT6SmoWOdbP08JA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] cmake: upgrade 4.4.1 -> 4.4.2
Date: Mon, 3 Aug 2026 08:38:40 +0200
Message-ID: <20260803063840.3120612-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15f.europe.bmw.corp (2a03:1e80:a15:58f::1:4e) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 06:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242608

Release notes are available at [0].

[0]: https://cmake.org/cmake/help/v4.4/release/4.4.html#id2

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../cmake/{cmake-native_4.4.1.bb => cmake-native_4.4.2.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.4.1.bb => cmake_4.4.2.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.4.1.bb => cmake-native_4.4.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.4.1.bb => cmake_4.4.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.4.1.bb b/meta/recipes-devtools/cmake/cmake-native_4.4.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.4.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.4.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 45172da729b7ee6146e58425be5880295ad3d8af..a51b25b86475fb1fcf11b1837889c5dfe6146bbe 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "95d4721f3625fb0d9d6ca480dd59a46c84b4c157f7fadd2e9b179ef9c871174d"
+SRC_URI[sha256sum] = "1db9e61e60b6e0874c86386340b910382f3c5e75b9fbfb44d122063129a2789d"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.4.1.bb b/meta/recipes-devtools/cmake/cmake_4.4.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.4.1.bb
rename to meta/recipes-devtools/cmake/cmake_4.4.2.bb

