Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC78CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 10:04:33 +0000 (UTC)
Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
 by mx.groups.io with SMTP id smtpd.web10.70827.1754993070227422057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 03:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4c1Rth11lGzFQ3;
	Tue, 12 Aug 2025 12:04:28 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4c1Rtg39hbzDMQ;
	Tue, 12 Aug 2025 12:04:27 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 12 Aug 2025 11:54:53 +0200
Subject: [PATCH master walnascar] go-helloworld: fix license
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-go-helloworld-lic-v1-1-07ce00a0f252@cherry.de>
X-B4-Tracking: v=1; b=H4sIAGwPm2gC/x3MwQqDMAyA4VcpOS/QKjrZq4wdSk01kLUjGToQ3
 33F43f4/wOMlMng4Q5Q2ti4loZwc5DWWBZCnpuh893gpxBwqbiSSN2ryozCCcdwz33qJ5+HDK3
 7KGX+Xc8nvKN9Sd0epURLUeF1nn99u0RQdQAAAA==
X-Change-ID: 20250811-go-helloworld-lic-617f3c380f5f
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 10:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221761

From: Quentin Schulz <quentin.schulz@cherry.de>

The example repo doesn't seem to have ever been under MIT to begin with
but rather Apache-2.0. It was then changed to the license used by the
goland projectm that is BSD-3-Clause, 2 years ago in commit 00c7068f9d83
("all: update to Go license"). It saw minor edits a year ago in commit
39e772fc2670 ("LICENSE: update per Google Legal").

The license file exists in the sources, so use that one instead of
taking it from the OE-Core license directory.

License-Update: Incorrect license is now proper

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
kirkstone's version is apache-2.0, scarthgap's is already BSD-3-Clause
but with a different checksum.

This should be backportable to walnascar as is though.
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index f21cfbdf27e3eb84127115ce603282581539574e..5279c6a693237f9ed16b029d1329aca22b4aacb5 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -2,8 +2,8 @@ SUMMARY = "This is a simple example recipe that cross-compiles a Go program."
 SECTION = "examples"
 HOMEPAGE = "https://golang.org/"
 
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=7998cb338f82d15c0eff93b7004d272a"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 SRCREV = "d7b0ac1278591aea848a99258ccfdee8e4d454c1"

---
base-commit: 3b2f9c31dc17c3ba5f6a9971413afed3d450d826
change-id: 20250811-go-helloworld-lic-617f3c380f5f

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


