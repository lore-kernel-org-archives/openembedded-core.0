Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5F1C5DF97
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 20:22:00 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3420.1787430113981022786
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 13:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Ug5njJA2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2026082220215028ea1eb31f00020710-ov2ptk@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026082220215028ea1eb31f00020710
        for <openembedded-core@lists.openembedded.org>;
        Sat, 22 Aug 2026 22:21:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mHkux/muRvM+hqgIdHMb+XdcnyJSct/f4sanU/SlSgc=;
 b=Ug5njJA2IJw2BsKcsS/LMTNwYMWdkZ6lu7cBdDHwLqXmMxS630IPEZ49PtnRwbHXxZa4cj
 5Bp1BSPSoaSlygi3iTk2fcyLmaeehWNat2KGM3Lhtaq808Knm3kCsbAQUVNJa+v9Tb9Xfppn
 0Dp5x3LO8RSn/bdjGEUPTvfUwnQa9NV8/crUK/jTyzNJpewPZJe+IOKyfYXWNtiy5iKj7qOU
 JawEETsPz+3u+9S5wf8Ca2DPRSxFvkR12zbT8gVxpeRXxhIbNUlgMrSEecZ2TwF48HiMFbPm
 yiUIjF1KInRoxngmU5dpqI5QKyHpMUoBWMHqKctQS2gs76GHo8JFaY+w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] gnutls: set status for CVE-2026-1584
Date: Sat, 22 Aug 2026 22:21:44 +0200
Message-ID: <20260822202144.3375699-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 20:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244003

From: Peter Marko <peter.marko@siemens.com>

Set status per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-1584

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index d27d2cfa748..6fa521b2ec0 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -128,3 +128,4 @@ pkg_postinst_ontarget:${PN}-fips () {
 }
 
 CVE_STATUS[CVE-2026-3832] = "fixed-version: vulnerable multi-record OCSP response handling was introduced in 3.8.8 and is not present in 3.8.4"
+CVE_STATUS[CVE-2026-1584] = "fixed-version: vulnerable code not present, introduced with 3.8.11"

