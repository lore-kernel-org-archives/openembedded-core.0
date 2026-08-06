Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC18C5AC67
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 19:23:01 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27359.1786044172183118241
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 12:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NVO96dar;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260806192248f43c8fa1a8000207c4-t06yym@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260806192248f43c8fa1a8000207c4
        for <openembedded-core@lists.openembedded.org>;
        Thu, 06 Aug 2026 21:22:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=wDHkJ7wJ6L+N9gcw6bMQPm/kGEe5h8tOn6FwnANq7RM=;
 b=NVO96darT3Gv3Vg5q3VguGn+g5ys67jJMj0zXCgs0ZDy7Nx4q4fj4J/Z9fhZu13eUHr9C0
 ioMWzJ3IFKwJ7mCF/b016wTPxIKp4Oe7zQ+0sahuyfZTBZgEE3kO8pJi7rAd7bz4brxvGlto
 sDsMWl7wxZz0LvaEw6mpTW8lS9odZs+g0LP4lumFsXIbphgUbGUkWgRBC3zd3I3Pj+B5xD0q
 GtloBXUYGUKSN6JkeHk4I5yJ7f7WqVcEHrIIrSBsn0gcki9wvaqdSOUYBrQ85nYd8/0nmDg9
 I5r1DiI3II92+Cu1UJ0i02GdcwaQn7vZTsF6uIXNlWDjSwLaf4Q8A6eA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] binutils: set status for CVE-2026-4647
Date: Thu,  6 Aug 2026 21:22:46 +0200
Message-ID: <20260806192246.41057-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 19:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242968

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is fixed in 2.47.

As a RedHat version-less CVE this is currently reported as
"Unpatched": "no-version-ranges".

[1] https://security-tracker.debian.org/tracker/CVE-2026-4647

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/binutils/binutils-2.47.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.47.inc b/meta/recipes-devtools/binutils/binutils-2.47.inc
index 3b2dfa4187..ccaf12142a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.47.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.47.inc
@@ -18,6 +18,8 @@ SRCBRANCH ?= "binutils-2_47-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
+CVE_STATUS[CVE-2026-4647] = "fixed-version: fixed-version: Fixed from version 2.47"
+
 SRCREV ?= "6ce87bbc521cf46eaee9a1f7ef61cee2cdfb3e32"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\

