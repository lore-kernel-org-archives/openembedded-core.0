Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3307D3B7D2
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 10:12:40 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3921.1765015956131003601
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Dec 2025 02:12:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ECi4Gnbc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2025120610123203075168ec000207b9-bnhyf1@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025120610123203075168ec000207b9
        for <openembedded-core@lists.openembedded.org>;
        Sat, 06 Dec 2025 11:12:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qUnQhb7v80nbtj+HtcU4WZRy+I8wJ4L1G9/2iUdRDVY=;
 b=ECi4GnbcUnPmywt4QN84jqcBW1mYaWk7cIFeAd/dmuTxjNyd6odIyNcwIIhw2F8tsPcqvt
 8VBvwkB5fWDAIZKLJ6GVKvd9weZVLENSTa2kUHs5PD/TiCiTEypNrPb9JFncqisxE0fGiHsM
 IfitfkpjXgevz6mSwwmEuCIKnbFHt0nWpUvfOf1AHzbOfns/56OGXBGte3Oy3esqH+sSe4fV
 4s57TnErQhrUb7CGmIzvSaivPw8Wq1ffn03YXSbe2R0JPt8nFIvIEhVswVxpTEOUNADx+5d3
 lV5XU9+TWaS10W9nWK9RPrGqKyk3lHV+GGQBAj091xuPI0nTmbs1FhRg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] sqlite: upgrade 3.51.0 -> 3.51.1
Date: Sat,  6 Dec 2025 11:12:30 +0100
Message-Id: <20251206101230.1972066-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 10:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227365

From: Peter Marko <peter.marko@siemens.com>

From https://sqlite.org/changes.html

2025-11-28 (3.51.1)
1. Fix incorrect results from nested EXISTS queries caused by the optimization in item 6b in the 3.51.0 release.
2. Fix a latent bug in fts5vocab virtual table, exposed by new optimizations in the 3.51.0 release

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sqlite/{sqlite3_3.51.0.bb => sqlite3_3.51.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.51.0.bb => sqlite3_3.51.1.bb} (74%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.0.bb b/meta/recipes-support/sqlite/sqlite3_3.51.1.bb
similarity index 74%
rename from meta/recipes-support/sqlite/sqlite3_3.51.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.51.1.bb
index 258b2c6505..1a9f3128c3 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.51.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.1.bb
@@ -4,6 +4,6 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "42e26dfdd96aa2e6b1b1be5c88b0887f9959093f650d693cb02eb9c36d146ca5"
+SRC_URI[sha256sum] = "4f2445cd70479724d32ad015ec7fd37fbb6f6130013bd4bfbc80c32beb42b7e0"
 
 SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"

