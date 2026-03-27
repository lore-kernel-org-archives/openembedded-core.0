Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30EF10BA45F
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 09:24:27 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68000.1774603456564546501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 02:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=SRQiishz;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=53913bb1b=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1774603456; x=1806139456;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PFXKTw/lAJ1TnhWOr9sVrZrNDxkGqBHm/2m40wTrvjU=;
  b=SRQiishz2Mw17ue7Ln3JmBHa2980yvROCQmCLZDmHyARY/jHgp4xFT96
   xuFUEy+hSkoZBKMgrJuyp3IQbWfyqsKoos2Ms0FvXE1aCh6inyVcHQ6L1
   J9XXaRS8YuxvFTZ4ttXN3fPWcvgmMZvPNZHRQR1IEToz0uT7qBUpHwQGc
   o=;
X-CSE-ConnectionGUID: AjJC7SSgQd6Cb4k3DLGZkg==
X-CSE-MsgGUID: P7EZhEMZRvKYpPNFoMnySQ==
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 27 Mar 2026 10:24:10 +0100
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw5.muc with
 ESMTP/TLS; 27 Mar 2026 10:24:03 +0100
Received: from smucmp18d.bmwgroup.net (HELO smucmp18d.europe.bmw.corp)
 ([10.30.13.162]) by esabb3.muc with ESMTP/TLS; 27 Mar 2026 10:24:03 +0100
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp18d.europe.bmw.corp (2a03:1e80:a15:58f::1:5e) with Microsoft SMTP
 Server (version=TLS; Fri, 27 Mar 2026 10:24:03 +0100
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.214) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Fri, 27 Mar 2026 10:24:02 +0100
X-CSE-ConnectionGUID: R7qOH0JORLecCOtfim9lpg==
X-CSE-MsgGUID: cASqLoRJRbejYDWMDKGyHg==
X-CSE-ConnectionGUID: fycuIqILTwKjDM/An+gqBg==
X-CSE-MsgGUID: rXnwVZibRxa2PL6WmE5JHg==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] createrepo-c: upgrade 1.2.2 -> 1.2.3
Date: Fri, 27 Mar 2026 10:23:39 +0100
Message-ID: <20260327092339.854402-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17a.europe.bmw.corp (2a03:1e80:a15:58f::1:3a) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 09:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234075

Full list of changes in this release is available at [0].

[0]: https://github.com/rpm-software-management/createrepo_c/releases/tag/1.2.3

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../{createrepo-c_1.2.2.bb => createrepo-c_1.2.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.2.2.bb => createrepo-c_1.2.3.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.2.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.2.2.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb
index 1dd5165260718aea987b7947bdfbbd9490b53273..a5c1a9dd440d5f8a7b85a6456f8ed88e427b89af 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.2.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "46b86c9b14bd724cb6bec0bfa81a7b179847f3db"
+SRCREV = "5ecca5e6c85cca1399378af5756344eb1c7448a1"
 
 DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
 DEPENDS:append:class-native = " file-replacement-native"

