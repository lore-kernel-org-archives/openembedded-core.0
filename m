Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DF6C44511
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 15:37:23 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16004.1784216232419481157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 08:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lHfYSmaU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260716153708f2099f336900020753-p4rgpe@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260716153708f2099f336900020753
        for <openembedded-core@lists.openembedded.org>;
        Thu, 16 Jul 2026 17:37:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ZcC/+0q96SMKmrGYL9nIimZdUBOZLjT5WldnBJOhzAw=;
 b=lHfYSmaU+GzPzu1iAxKfBqLRO7CMOfJQR0Y2B+MH+qOvN0Vx8PMX39NOdcKUFRdb6I6lHF
 yGjXreQcMxQPapZ95CwYsbWZchUi0qamgU5zze4x9OiPqgStXs0icYyJCIjRvMcnmIulP30R
 uPYkhc59/LJ7x+t8eBgeGC021wzOrJyRNoVVbs/Kc7nBb0l8MBlUisYfybJaFtVPRJBo7lv6
 eQmOfoppfbq+l50+wspVZlRYdGfAl80H9zCIeeEHr36+TcCC7cwbKzxH8ZP1G+TBiO1VFjfe
 CIblbPVYMMiOBlNKPZKCChiFxto5f3xBkF4HakLl/DNnpbcQ5JsCoWSQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] p11-kit: set status for CVE-2026-13757
Date: Thu, 16 Jul 2026 17:36:44 +0200
Message-ID: <20260716153644.11159-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 15:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241096

From: Peter Marko <peter.marko@siemens.com>

This is a RedHat version-less CVE.
Per [1] this is fixed in 0.26.3.

[1] https://security-tracker.debian.org/tracker/CVE-2026-13757

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.26.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
index aaf64ce094..4828d6f942 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
@@ -46,3 +46,4 @@ FILES:${PN}-remote = "\
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2026-2100] = "fixed-version: fixed since 0.26.2"
+CVE_STATUS[CVE-2026-13757] = "fixed-version: fixed since 0.26.3"

