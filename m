Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CCEC88E5C
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 15:43:59 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1312.1789314236128330655
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 08:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=k/MnNVjp;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260913154352efffecb6440002073e-qvtpom@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260913154352efffecb6440002073e
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Sep 2026 17:43:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=895YnVxeyCEj1i+MdwtPgj1aPJX2kzqcsvsVK27jThc=;
 b=k/MnNVjp7IZjZqZnG86OSX0KVFTu/JRd/gG9pjNSDEOeDOQSsNRDb01KcMglL+3RM/9Yzr
 HmAF3grWA3viQNr86SUzArxBC/eaV4p5teQl6CaqWzrMkdix8gvdB1sAyOxcQeHAxlXFU4Ky
 Jq3VxWaAOOTIwDGhweCH7tuIz6qrYUYR5kywYf3sEzCzabKCqfLJ0mRl58oFEBxh9qs1T49j
 7/xpx2mhkp57omia1dNCeyZl+KoUf5g5QHzipmx1sgHkCzx+hcRxApFfMfzVSMDvgudQdDYz
 xibS0fTmPdji+8XCnfpQ3oOXDY4ZD38KK6DejcGSghGSqYvjGQtbDRtA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 1/2] golang: fix homepage
Date: Sun, 13 Sep 2026 17:43:43 +0200
Message-ID: <20260913154344.3206517-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 15:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245715

From: Peter Marko <peter.marko@siemens.com>

Leading space leads to SPDX document validation errors in some tools.

Example:
SchemaError: \" http://golang.org/\" is not valid under any of the
schemas listed in the 'anyOf' keyword
(components -> ... -> externalReferences -> 0 -> url)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: cbf36f436b477d81b58ff605846a2482308aefa4)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/go-binary-native_1.26.7.bb | 2 +-
 meta/recipes-devtools/go/go-common.inc              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.7.bb b/meta/recipes-devtools/go/go-binary-native_1.26.7.bb
index 753f1b13bb..034c051cee 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.7.bb
@@ -1,7 +1,7 @@
 # This recipe is for bootstrapping our go-cross from a prebuilt binary of Go from golang.org.
 
 SUMMARY = "Go programming language compiler (upstream binary for bootstrap)"
-HOMEPAGE = " http://golang.org/"
+HOMEPAGE = "http://golang.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7998cb338f82d15c0eff93b7004d272a"
 
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 5d0177bdb6..a96e67617b 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -9,7 +9,7 @@ DESCRIPTION = " The Go programming language is an open source project to make \
  fast, statically typed, compiled language that feels like a\
  dynamically typed, interpreted language."
 
-HOMEPAGE = " http://golang.org/"
+HOMEPAGE = "http://golang.org/"
 LICENSE = "BSD-3-Clause"
 
 inherit goarch

