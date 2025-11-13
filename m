Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F270CD5BC0
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 10:35:37 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20688.1763030129026294165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 02:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ge+5aB0K;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20251113103524bfd6f275170002077a-bqtxxz@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20251113103524bfd6f275170002077a
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Nov 2025 11:35:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rrw8lvD2fSlG1MyFpgLlRRyiACZtJg0PNKfwP+7veIg=;
 b=ge+5aB0Kvc39JQ8MRJPHLXyIY+GoqvA9BIw7ak5KE6QkI0QYQ6mg1DfANf/7tVqGUdF7EK
 o/Iba1bW3HU6K1gCJPFUGXc0FbrtIyhNlx+KGACBCWCKImd6WroraotHo4boDAt8kKe5Qc5F
 zWufzMhO/G9gg8rsXh9jqL9U5wbPTEGXM2fHHjlvRoAg6gNCV8lJruv16TN/kNBUO0HeMESN
 IFIlJIS8I3z7P+Rv9UJgem4w6kRaLRWm7VgfROuaYUuW2r5JpBft3bSVWDTR88xcCl2llBl6
 XlKUdTtT/nrvOIEo5m2Jykx0SxoJb7BPYLPgyzUQSSZOyVtFg6G+JVJw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [OE-core][PATCH v2] go-helloworld: fix license
Date: Thu, 13 Nov 2025 11:35:15 +0100
Message-Id: <20251113103515.97083-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 10:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226235

From: Peter Marko <peter.marko@siemens.com>

The example repo doesn't seem to have ever been under MIT.
It started with Apache-2.0, later changed to standard go license BSD-3.

The license file exists in the sources, so use that one instead of
taking it from the OE-Core license directory.

Note that this was already fixed in scarthgap and kirkstone, but the
patch was not merged into master. Also the old releases still had
Apache-2 license, so this patch is different now with new version of
the component.

License-Update: Fix license declaration.

Reported-By: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index e12dcb15f6..0a8668dd4d 100644
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
 SRCREV = "8b405629c4a5215871be932097e099c05ec5cb2e"

