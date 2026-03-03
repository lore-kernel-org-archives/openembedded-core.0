Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AB9E67A6A
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 05:15:45 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11645.1772514937673410613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 21:15:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=fEsbQD7c;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=51596fb09=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1772514937; x=1804050937;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DUH9pw9F8yHsTPVBIrlqiUx35NVImgPCxSyS4N4ChXE=;
  b=fEsbQD7cO/JMrFSdsGgtUmhGyQMZqEipQLt+350dE+cz4FBc4xpyt50l
   6uP3fWsddXrAaUhpCHKNvMIQOcnM5XIgxMexQgggaiD11RcYdGfSA+DtY
   ja0BO3BDAEXrYWtZlwpwKFHPx8LGOeYMTT2E1YTn41OV2ybqNDpcP07H3
   M=;
X-CSE-ConnectionGUID: pOJcrUvLT26hWEc868drdg==
X-CSE-MsgGUID: rT2G9E88TXGO35uAGSt8fA==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 03 Mar 2026 06:15:35 +0100
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw3.muc with
 ESMTP/TLS; 03 Mar 2026 06:15:34 +0100
Received: from smucmp16d.bmwgroup.net (HELO smucmp16d.europe.bmw.corp)
 ([10.30.13.146]) by esabb3.muc with ESMTP/TLS; 03 Mar 2026 06:15:34 +0100
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp16d.europe.bmw.corp (2a03:1e80:a15:58f::1:57) with Microsoft SMTP
 Server (version=TLS; Tue, 3 Mar 2026 06:15:34 +0100
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.206) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Tue, 3 Mar 2026 06:15:33 +0100
X-CSE-ConnectionGUID: 5p9sxrhrRbKfwjnlMegdqA==
X-CSE-MsgGUID: PYha6CB3QBCYMuKN98JNIg==
X-CSE-ConnectionGUID: gFsmboOPTWiPOo1O2nne6A==
X-CSE-MsgGUID: bCwhB9d8S0K0VvsU1cLMRA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] libcomps: upgrade 0.1.23 -> 0.1.24
Date: Tue, 3 Mar 2026 06:15:13 +0100
Message-ID: <20260303051513.2469366-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18g.europe.bmw.corp (2a03:1e80:a15:58f::1:79) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 05:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232236

The project did not publish release notes, but the list of changes is available
at [0].

[0]: https://github.com/rpm-software-management/libcomps/compare/0.1.23...0.1.24

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 .../libcomps/{libcomps_0.1.23.bb => libcomps_0.1.24.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.23.bb => libcomps_0.1.24.bb} (94%)

diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.23.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.24.bb
similarity index 94%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.23.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.24.bb
index 0a9608297a07d8a511e2fc218985b7c206d9650d..c26fc71b3b4caa25a047a7d1c5cb775e0f5236cc 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.23.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.24.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;t
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "e75e85ffd2c7f2a2a96d8eaf45d8dc4f2c73153d"
+SRCREV = "8d439dd015d4c6f637e64e1160201345883138e9"
 
 inherit cmake setuptools3-base
 

