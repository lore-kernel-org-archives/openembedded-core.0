Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C4FFF885C
	for <webhook@archiver.kernel.org>; Sat, 25 Apr 2026 22:27:43 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6878.1777156062658915340
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2026 15:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=a7NWRW8P;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2026042522274177e27549b3000207db-fo0dxf@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026042522274177e27549b3000207db
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 00:27:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=l5bYmO8eUsSNmnZXglhTyxvR6+tJAlcL33yrVGw6NEI=;
 b=a7NWRW8PLe8e+NTMYEKjEfeiPftYMViVQ91+ciRJ6W4axEe+W3t0M/pqhexyHrCtt/iYpM
 SxgZMwg2JVggg1lqRA97WJFU6eHDL8QRxSObRkHyI3L6fGad8gn0XLKG4o0FQAocdnB6GL6m
 3giixZheDHp6yWNTYziYjoYFZpe+h3tUJOZiPqp+qyrxy7CZjXudLLgfaW/DrhxpkxzbCPeu
 iSGTdHQ0sweu5wtcnl81mSzkx/oeEBHquq0cdIQh9ssteB5aQCnemz2NgvCqnu5zwAeo4pKJ
 jFlx6j3yr08C4b9NSpdvG8UhAhOiuNuBzw1orpNGT9O8WoO+hay1GrFQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 4/5] p11-kit: set status for CVE-2026-2100
Date: Sun, 26 Apr 2026 00:26:33 +0200
Message-ID: <20260425222634.44171-4-peter.marko@siemens.com>
In-Reply-To: <20260425222634.44171-1-peter.marko@siemens.com>
References: <20260425222634.44171-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2026 22:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235949

From: Peter Marko <peter.marko@siemens.com>

This is a Redhat version-less CVE in NVD DB.
Per [1] this is fixed in 0.26.2.

[1] https://security-tracker.debian.org/tracker/CVE-2026-2100

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.26.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
index fa41b45feb..5f553f11bb 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
@@ -42,3 +42,5 @@ BBCLASSEXTEND = "native nativesdk"
 # git/p11-kit/import-object.c:229:70: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
 # git/p11-kit/import-object.c:264:78: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
 CFLAGS += "-Wno-error=incompatible-pointer-types"
+
+CVE_STATUS[CVE-2026-2100] = "fixed-version: fixed since 0.26.2"

