Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FF1CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 12:20:23 +0000 (UTC)
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
 by mx.groups.io with SMTP id smtpd.web10.73176.1755001218421595738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 05:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4c1VvN1kQ5zv9D;
	Tue, 12 Aug 2025 14:20:16 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4c1VvM4qQ0zwZS;
	Tue, 12 Aug 2025 14:20:15 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 12 Aug 2025 14:20:05 +0200
Subject: [PATCH kirkstone] go-helloworld: fix license
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-go-helloworld-lic-kirkstone-v1-1-3e84c8ddec61@cherry.de>
X-B4-Tracking: v=1; b=H4sIAHQxm2gC/z3MwQqDMAyA4VeRnA1oMVD2KmOHajMNlmakww3Ed
 7d48PjBz79DYRMu8Gh2MN6kiOaKvm1gWkKeGSVWg+scdb53OCsunJL+1FLEJBOuYmv5amYciMb
 oRyIfAtTDx/gt/+v+hDuD13GcqCma2XgAAAA=
X-Change-ID: 20250812-go-helloworld-lic-kirkstone-455bd8b558aa
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 12:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221767

From: Quentin Schulz <quentin.schulz@cherry.de>

The example repo doesn't seem to have ever been under MIT to begin with
but rather Apache-2.0.

The license file exists in the sources, so use that one instead of
taking it from the OE-Core license directory.

License-Update: Incorrect license is now proper

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
This differs from master and walnascar[1] due to the recipe pointing to
SRCREV before changes to the LICENSE file in commit 39e772fc2670
("LICENSE: update per Google Legal").

This differs from scarthgap[2] due to the recipe pointing to SRCREV
before changes to the LICENSE file in commit 00c7068f9d83 ("all: update
to Go license") where it was changed from Apache-2.0 to BSD-3-Clause.

[1] https://lore.kernel.org/openembedded-core/20250812-go-helloworld-lic-v1-1-07ce00a0f252@cherry.de/
[2] https://lore.kernel.org/openembedded-core/20250812-go-helloworld-lic-scarthgap-v1-1-d3bdbc34e7f8@cherry.de/
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 0055b32d602b4513eb9f98aa075ea47fb453d93e..5a9d138b9c9f93eb1a6fa6d89731f29be54308c7 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "This is a simple example recipe that cross-compiles a Go program.
 SECTION = "examples"
 HOMEPAGE = "https://golang.org/"
 
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https"
 SRCREV = "787a929d5a0dfb8bbfcdd2c4a62e0fd89466113f"

---
base-commit: 81ab000fa437ca04f584a3327b076f7a512dc6d0
change-id: 20250812-go-helloworld-lic-kirkstone-455bd8b558aa

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


