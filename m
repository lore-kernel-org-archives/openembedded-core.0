Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7750ACA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 10:46:33 +0000 (UTC)
Received: from smtp-42aa.mail.infomaniak.ch (smtp-42aa.mail.infomaniak.ch [84.16.66.170])
 by mx.groups.io with SMTP id smtpd.web11.70755.1754995582962155555
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 03:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.170, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4c1Sq061j2zFdq;
	Tue, 12 Aug 2025 12:46:20 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4c1Sq022XBzfZ6;
	Tue, 12 Aug 2025 12:46:20 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 12 Aug 2025 12:46:05 +0200
Subject: [PATCH scarthgap] go-helloworld: fix license
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-go-helloworld-lic-scarthgap-v1-1-d3bdbc34e7f8@cherry.de>
X-B4-Tracking: v=1; b=H4sIAGwbm2gC/z3MQQqEMAxA0atI1ga0olavIrPo1NgGipVUnAHx7
 hYXLh98/gmJhCnBWJwgdHDiuGbUZQHWm9UR8pwNqlJtpWuFLqKnEOIvSpgxsMVkjezemQ21/pJ
 uur4fVAP5sAkt/H/uE7wZfK7rBusGRvR4AAAA
X-Change-ID: 20250812-go-helloworld-lic-scarthgap-88be83677923
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 10:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221763

From: Quentin Schulz <quentin.schulz@cherry.de>

The example repo doesn't seem to have ever been under MIT to begin with
but rather Apache-2.0. It was then changed to the license used by the
goland projectm that is BSD-3-Clause, 2 years ago in commit 00c7068f9d83
("all: update to Go license").

The license file exists in the sources, so use that one instead of
taking it from the OE-Core license directory.

License-Update: Incorrect license is now proper

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
This differs from master and walnascar[1] due to the recipe pointing to
SRCREV before changes to the LICENSE file in commit 39e772fc2670
("LICENSE: update per Google Legal").

[1] https://lore.kernel.org/openembedded-core/20250812-go-helloworld-lic-v1-1-07ce00a0f252@cherry.de/
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 98cd4d810335b037e9b58e22000ba63327cd64af..6f0214aa607819749ecb305b8dd2f972b5959d1b 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -2,8 +2,8 @@ SUMMARY = "This is a simple example recipe that cross-compiles a Go program."
 SECTION = "examples"
 HOMEPAGE = "https://golang.org/"
 
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https"
 SRCREV = "d9923f6970e9ba7e0d23aa9448ead71ea57235ae"

---
base-commit: 6f7e929ea6ea557f107c8ccffea69a7d73439591
change-id: 20250812-go-helloworld-lic-scarthgap-88be83677923

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


