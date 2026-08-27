Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15F4C61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 16:01:21 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.518.1787846473249619925
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 09:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=In8wd0bD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260827160109384529b20c000207aa-9veo5c@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260827160109384529b20c000207aa
        for <openembedded-core@lists.openembedded.org>;
        Thu, 27 Aug 2026 18:01:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=olYGLaBXiwWwGMfBHWF0o2mve70YLTYPqZbXz2Atu8w=;
 b=In8wd0bD54q7z8eHHSCZws52qoJomKXSXlicNpMsQxbDI8aiGmsM9CNZNwd8rNCGJjrcM0
 H7+Fv+siMMqq6o+e1i2oeR4XKK+mF//izDnIisD+WzPdqkDKfH6LG/naYBkPmDPLZ4onkSWg
 2+mROclo04HeroT4OgH1GHv17DoI12hsfbn4KoL84wM8g//h2+CqwKUDoVU0DrYfjSyM8r1r
 LMNiWtaqwalKGCTSymaaaYObu/+aXAQwXKJ8kz1c+FeXDfYSFhTVbH2w7mxRad4D8F1YZp2e
 +Io0SqH4wLpBuviks/0c72nQ0kwKconXul65qsWysdojR78pazkW8ldg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/2] golang: fix homepage
Date: Thu, 27 Aug 2026 18:00:42 +0200
Message-ID: <20260827160044.12262-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 16:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244501

From: Peter Marko <peter.marko@siemens.com>

Leading space leads to SPDX document validation errors in some tools.

Example:
SchemaError: \" http://golang.org/\" is not valid under any of the
schemas listed in the 'anyOf' keyword
(components -> ... -> externalReferences -> 0 -> url)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/go-binary-native_1.27.0.bb | 2 +-
 meta/recipes-devtools/go/go-common.inc              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.27.0.bb b/meta/recipes-devtools/go/go-binary-native_1.27.0.bb
index a3750653c8..0f6c3bc96e 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.27.0.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.27.0.bb
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

