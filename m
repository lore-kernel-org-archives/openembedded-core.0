Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026D4C43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 06:13:01 +0000 (UTC)
Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86277.1782713569070305914
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2026 23:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=Rv+kFLoy;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=633195dde=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1782713569; x=1814249569;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vJpWnpVTwJvtIk5zZ6hvj12UrkCbLNaUt0LYZCQnAbA=;
  b=Rv+kFLoyYDSpFjPkV93bddmfmCuCRlwEcATDFdr9Pw53YQUHnVej9K00
   vMh8vIGVt+H4yGgaWIEuTfhCo7hFQAEaxrV/ofIKyrvhUMpBmMWQv1DTM
   c+vdF+2O0Rabm8hK/Rs00W1ef3zspLK+UAQXy1HAXGl2CJTjZ8UTpl+AX
   o=;
X-CSE-ConnectionGUID: Z4Lh1XukTSGGxxDmcAkYOg==
X-CSE-MsgGUID: 8v3nL7IbQhKLyVfzXoDkdA==
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 29 Jun 2026 08:12:46 +0200
Received: from unknown (HELO esabb6.muc) ([10.31.187.137]) by esagw1.muc with
 ESMTP/TLS; 29 Jun 2026 08:12:46 +0200
Received: from smucmp18f.bmwgroup.net (HELO smucmp18f.europe.bmw.corp)
 ([10.30.13.164]) by esabb6.muc with ESMTP/TLS; 29 Jun 2026 08:12:46 +0200
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp18f.europe.bmw.corp (2a03:1e80:a15:58f::1:47) with Microsoft SMTP
 Server (version=TLS; Mon, 29 Jun 2026 08:12:45 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Mon, 29 Jun 2026 08:12:45 +0200
X-CSE-ConnectionGUID: TSiD67gsTXezjeisV+L8uQ==
X-CSE-MsgGUID: 9wyehR5RRiutA24qz3WBlw==
X-CSE-ConnectionGUID: 0ENdAkjvRxyrZ4ahstGAaQ==
X-CSE-MsgGUID: t2uh6s/jTQiFi8wJERFVjA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] json-c: upgrade 0.18 -> 0.19
Date: Mon, 29 Jun 2026 08:12:29 +0200
Message-ID: <20260629061229.702229-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17c.europe.bmw.corp (2a03:1e80:a15:58f::1:46) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 06:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239723

Release notes are available at [0].

[0]: https://github.com/json-c/json-c/blob/json-c-0.19/ChangeLog

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../json-c/{json-c_0.18.bb => json-c_0.19.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/json-c/{json-c_0.18.bb => json-c_0.19.bb} (85%)

diff --git a/meta/recipes-devtools/json-c/json-c_0.18.bb b/meta/recipes-devtools/json-c/json-c_0.19.bb
similarity index 85%
rename from meta/recipes-devtools/json-c/json-c_0.18.bb
rename to meta/recipes-devtools/json-c/json-c_0.19.bb
index c112aacf4bceb0c41dbe2e1643d2d7e0944bf250..f16c7f1d59455e9ef19e7dffd5494b25f5d90e8f 100644
--- a/meta/recipes-devtools/json-c/json-c_0.18.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.19.bb
@@ -9,17 +9,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "876ab046479166b869afc6896d288183bbc0e5843f141200c677b3e8dfb11724"
+SRC_URI[sha256sum] = "37ad0249902e301bd9052bf712e511fcc6acff4ecaad4b5900aad9ce564e26de"
 
 # NVD uses full tag name including date
-CVE_VERSION = "0.18-20240915"
+CVE_VERSION = "0.19-20260627"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES:${PN} = "libjson"
 
-# Apps aren't needed/packaged and their CMakeLists.txt is incompatible with CMake 4+.
+# Apps aren't needed/packaged.
 EXTRA_OECMAKE = "-DDISABLE_WERROR=ON \
                  -DBUILD_APPS=OFF \
 "

