Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B50CC88E65
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 15:44:39 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1330.1789314270521008366
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 08:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ELMXb7Fq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260913154428d082053fe400020765-3mro9b@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260913154428d082053fe400020765
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Sep 2026 17:44:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2x7EMOS4Mfr6a9fImvlm1IpRqnFOiuehDBz8SUlbFbk=;
 b=ELMXb7FqUXf/tMh+28yO94bPRaA/pR36E7bI2CWr8KaQEkKtC/4ZqIIwaCG87Np9AplzqG
 5AlMaoiNFsIcxuHvsYAkd7B/u9pB3eEX9RLkCMiUtsouuf+eLy0W98Ic+NrAsON7HLD74big
 vuoD0I3pHsRk8nklsTNY1RKKP2Mewa31mG2bUJv/41unIMYXVRAnvzhokjQCS0YnDuChEBp5
 mPfaDTQW2Tx+HW5zoL0dJU7ReeDgXUjD7lbKNqZGooZBmDlR+tkSBXstgjQmfjuPJjX8AzPc
 Og/8LWLpcotEUaaiHpbP4yeOe+0ai8qNqRo7tKvQI9EoEOfxTy+1/OCw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 1/2] golang: fix homepage
Date: Sun, 13 Sep 2026 17:44:04 +0200
Message-ID: <20260913154405.3206585-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 15:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245716

From: Peter Marko <peter.marko@siemens.com>

Leading space leads to SPDX document validation errors in some tools.

Example:
SchemaError: \" http://golang.org/\" is not valid under any of the
schemas listed in the 'anyOf' keyword
(components -> ... -> externalReferences -> 0 -> url)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: cbf36f436b477d81b58ff605846a2482308aefa)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/go-binary-native_1.22.12.bb | 2 +-
 meta/recipes-devtools/go/go-common.inc               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
index dd84021cc9e..5dfb3133f6b 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
@@ -1,7 +1,7 @@
 # This recipe is for bootstrapping our go-cross from a prebuilt binary of Go from golang.org.
 
 SUMMARY = "Go programming language compiler (upstream binary for bootstrap)"
-HOMEPAGE = " http://golang.org/"
+HOMEPAGE = "http://golang.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index a39dea6c1cb..62b31f1762f 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -9,7 +9,7 @@ DESCRIPTION = " The Go programming language is an open source project to make \
  fast, statically typed, compiled language that feels like a\
  dynamically typed, interpreted language."
 
-HOMEPAGE = " http://golang.org/"
+HOMEPAGE = "http://golang.org/"
 LICENSE = "BSD-3-Clause"
 
 inherit goarch

