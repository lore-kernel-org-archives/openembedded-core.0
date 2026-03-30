Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07AE10D14A8
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 11:59:13 +0000 (UTC)
Received: from esa4.hc324-48.eu.iphmx.com (esa4.hc324-48.eu.iphmx.com [207.54.71.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49803.1774871943193316489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 04:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=fTTPefT7;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.71.48, mailfrom: prvs=54233de49=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1774871941; x=1806407941;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iu7GMI9EtFUmAu+YuJ1Ye1tU1LhZGlGLld3h2uVCuIQ=;
  b=fTTPefT7bPjBC0jcjTZh8rM+8F43fkdy43C38nCpv12I+gFbWKiJ3X7/
   2FXNDDPxfHJagRIvfJCMTS6Unfs+UG6sYXygr4LKkh/JpTjxhIRa5Epkt
   69Po8cKD0c2VTm+Vivt5K7xCDa3xMy/z8b71sR5GhYn9J9YEp7FAscbJ2
   E=;
X-CSE-ConnectionGUID: 6CIQs++WSt+x2HJuIqWL6A==
X-CSE-MsgGUID: z4TRvKkoT6yk7b5Ucqf2hg==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa4.hc324-48.eu.iphmx.com with ESMTP/TLS; 30 Mar 2026 13:58:58 +0200
Received: from unknown (HELO esabb6.muc) ([10.31.187.137]) by esagw6.muc with
 ESMTP/TLS; 30 Mar 2026 13:58:58 +0200
Received: from smucmp18b.bmwgroup.net (HELO smucmp18b.europe.bmw.corp)
 ([10.30.13.160]) by esabb6.muc with ESMTP/TLS; 30 Mar 2026 13:58:59 +0200
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp18b.europe.bmw.corp (2a03:1e80:a15:58f::1:51) with Microsoft SMTP
 Server (version=TLS; Mon, 30 Mar 2026 13:58:58 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.202) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Mon, 30 Mar 2026 13:58:57 +0200
X-CSE-ConnectionGUID: XOrT6Rk7ToWD4T3HTdcsyQ==
X-CSE-MsgGUID: uNhIJVFGQ2SnWVGUMM85Ig==
X-CSE-ConnectionGUID: ZJA9D6zxTMSuCizPfuEIdA==
X-CSE-MsgGUID: dKtuz+cCQhymsU92S+Bypg==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] cmake: upgrade 4.3.0 -> 4.3.1
Date: Mon, 30 Mar 2026 13:58:47 +0200
Message-ID: <20260330115847.1918773-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15b.europe.bmw.corp (2a03:1e80:a15:58f::1:4b) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 11:59:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234230

Release notes are available at [0].

[0]: https://cmake.org/cmake/help/v4.3/release/4.3.html#id2

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../cmake/{cmake-native_4.3.0.bb => cmake-native_4.3.1.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.3.0.bb => cmake_4.3.1.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.3.0.bb => cmake-native_4.3.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.3.0.bb => cmake_4.3.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.3.0.bb b/meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.3.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.3.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 06ded2201be85df65b1a1a6480ca3fe3c336872c..fee2efc2f3607ab91db8e4e3465238225553b9e1 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "f51b3c729f85d8dde46a92c071d2826ea6afb77d850f46894125de7cc51baa77"
+SRC_URI[sha256sum] = "0798f4be7a1a406a419ac32db90c2956936fecbf50db3057d7af47d69a2d7edb"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.3.0.bb b/meta/recipes-devtools/cmake/cmake_4.3.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.3.0.bb
rename to meta/recipes-devtools/cmake/cmake_4.3.1.bb

