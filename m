Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8903FCD0C1
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 06:31:37 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8010.1773815488951100846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 23:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=kxdxf0SY;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=5305b6da4=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1773815488; x=1805351488;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DXSZ0MAouaW0uKbTqu/+AdJvKXttQJypEa4vKHwgL84=;
  b=kxdxf0SYNUaaVLrwIwFSKFg4DTdlcBQuf0smLxxIZQWX27/r44BKZPPZ
   90EN0HjVYtAqwu5nVPAOB3aKNg6bpja3Bo0LlRskTd4C+rpISONk+HU5y
   /5gfFaZ0RORyYFaUxIUe6VBAVebWm5+YGDskbYO/p59TNzoJKZUn1VNri
   8=;
X-CSE-ConnectionGUID: swSL30fjTcKhnpWqrlRg0w==
X-CSE-MsgGUID: nXagYKVaQVeT9W60XI2u3g==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 18 Mar 2026 07:31:26 +0100
Received: from unknown (HELO esabb2.muc) ([10.31.187.133]) by esagw3.muc with
 ESMTP/TLS; 18 Mar 2026 07:31:24 +0100
Received: from smucmp17b.bmwgroup.net (HELO smucmp17b.europe.bmw.corp)
 ([10.30.13.152]) by esabb2.muc with ESMTP/TLS; 18 Mar 2026 07:31:25 +0100
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp17b.europe.bmw.corp (2a03:1e80:a15:58f::1:4c) with Microsoft SMTP
 Server (version=TLS; Wed, 18 Mar 2026 07:31:25 +0100
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Wed, 18 Mar 2026 07:31:25 +0100
X-CSE-ConnectionGUID: uPVWWbllSOOxpOuYhWI+IA==
X-CSE-MsgGUID: cVQI3WxORVSQ9zTTYVxSMA==
X-CSE-ConnectionGUID: JXhtjBcFTlamsM1vVPczgw==
X-CSE-MsgGUID: RgNLFTnxTZCPmnH+CJA5JQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] cmake: upgrade 4.2.3 -> 4.3.0
Date: Wed, 18 Mar 2026 07:31:10 +0100
Message-ID: <20260318063110.483032-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp16e.europe.bmw.corp (2a03:1e80:a15:58f::1:147) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233364

Release notes are available at [0].

License-Update: Year references updated in [1] and [2]

[0]: https://cmake.org/cmake/help/v4.3/release/4.3.html
[1]: https://gitlab.kitware.com/cmake/cmake/-/commit/b08cb30f2efda73796a076cef2b7b4c29e458c27
[2]: https://gitlab.kitware.com/cmake/cmake/-/commit/97ad58a86cf73d85f755939114eb6b32f085d0dd

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../cmake/{cmake-native_4.2.3.bb => cmake-native_4.3.0.bb}  | 2 +-
 meta/recipes-devtools/cmake/cmake.inc                       | 6 +++---
 .../cmake/{cmake_4.2.3.bb => cmake_4.3.0.bb}                | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.2.3.bb => cmake-native_4.3.0.bb} (96%)
 rename meta/recipes-devtools/cmake/{cmake_4.2.3.bb => cmake_4.3.0.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb b/meta/recipes-devtools/cmake/cmake-native_4.3.0.bb
similarity index 96%
rename from meta/recipes-devtools/cmake/cmake-native_4.2.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.3.0.bb
index cf800d48543f3c067725c87d3ba6aeed266777e6..9ab1f0ce738414c785b67050bc66f45207668b3f 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.2.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.3.0.bb
@@ -11,7 +11,7 @@ LICENSE:append = " & BSD-1-Clause & MIT & BSD-2-Clause & curl & Apache-2.0"
 LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
     file://Utilities/cmlibarchive/COPYING;md5=7ce08437ff7f5e24d72e666313ae4084 \
-    file://Utilities/cmexpat/COPYING;md5=7b3b078238d0901d3b339289117cb7fb \
+    file://Utilities/cmexpat/COPYING;md5=f4fedd6116da0e171f7cb4d2923d7ac2 \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
     file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
     file://Utilities/cmcurl/COPYING;md5=72f4e9890e99e68d77b7e40703d789b8 \
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 1b84c785d0305eaa756c0c5639203dcd8691f064..06ded2201be85df65b1a1a6480ca3fe3c336872c 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=0cafc0f3b6b28f3d5ecb5d1a68c36471 \
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=69baa2b64b4976226122f87ecbad32c5 \
                     file://Source/cmake.h;beginline=1;endline=2;md5=4ba59ac0e953e1a713eea8c55b1d531b \
                     "
 
@@ -19,10 +19,10 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "7efaccde8c5a6b2968bad6ce0fe60e19b6e10701a12fce948c2bf79bac8a11e9"
+SRC_URI[sha256sum] = "f51b3c729f85d8dde46a92c071d2826ea6afb77d850f46894125de7cc51baa77"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
 CVE_STATUS[CVE-2016-10642] = "cpe-incorrect: This is specific to the npm package that installs cmake, so isn't relevant to OpenEmbedded"
 
-EXTRA_OECMAKE += "-DCMAKE_USE_SYSTEM_LIBRARIES=1"
\ No newline at end of file
+EXTRA_OECMAKE += "-DCMAKE_USE_SYSTEM_LIBRARIES=1"
diff --git a/meta/recipes-devtools/cmake/cmake_4.2.3.bb b/meta/recipes-devtools/cmake/cmake_4.3.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.2.3.bb
rename to meta/recipes-devtools/cmake/cmake_4.3.0.bb

