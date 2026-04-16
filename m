Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AC5F8D76C
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 19:10:56 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23311.1776366649916626030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 12:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VUKPFYxD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260416191046557db9a40c00020707-yc4nrb@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260416191046557db9a40c00020707
        for <openembedded-core@lists.openembedded.org>;
        Thu, 16 Apr 2026 21:10:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=5KzY3Rf8RIlyYffDzSLpO/BWaLoerfhynjXt5wl6Q6w=;
 b=VUKPFYxD3ktkA5gNztu5d7bH0cYpG6dorPl/8dVdaHVbf4wMuwX6cOvLMMt6HbC2aYUrW2
 6rqmQP4sh/UfMaVSaBhMwDDDtvDN5xQawqOUc9kBfU3suXHKF6CR1lWY+U8xArNvMXPIH6rm
 4BWi+LeV6bnMB9942rMzipFEtlBikfdxPtbIqmQHpxAxcSE/pYJE5UVpM4FhIrkTYR+NJ3b5
 yQWNtS4JyUYO5m+nUb6tliHPaHNnmDxKfQFsAfWhxb9yLQBQUhWsfLdd4tvsNK1jtEiYq5jW
 hkeFyem3uqMzrq75TZweXW/rNcLteo/MMI6/Yc99tUiOGbxJFHNLEIBg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/2] binutils: mark CVE-2025-69652 as fixed
Date: Thu, 16 Apr 2026 21:10:32 +0200
Message-ID: <20260416191033.921922-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 19:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235415

From: Peter Marko <peter.marko@siemens.com>

Fix commit [1] mentioned in the NVD report [2] is aleady included in
2.46 even when NVD says <= 2.46

$ git tag --contains 44b79abd0fa12e7947252eb4c6e5d16ed6033e01
binutils-2_46

[1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=44b79abd0fa12e7947252eb4c6e5d16ed6033e01
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-69652

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/binutils/binutils-2.46.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index d41a3a3f1a..6ae6cef352 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -21,6 +21,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 CVE_STATUS[CVE-2025-69650] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
 CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release code, does not affect any tagged version"
 CVE_STATUS[CVE-2025-69649] = "fixed-version: Fixed from version 2.46"
+CVE_STATUS[CVE-2025-69652] = "fixed-version: Fixed from version 2.46"
 
 SRCREV ?= "49d4d3fafa4ec4ff5a3460d91d5b1ed5286487db"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"

