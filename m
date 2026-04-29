Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6900FCCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 19:37:12 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4540.1777491430668408517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 12:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=bF3yOSmK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202604291937086785e7f45900020743-qnkipp@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202604291937086785e7f45900020743
        for <openembedded-core@lists.openembedded.org>;
        Wed, 29 Apr 2026 21:37:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=rz16NynGVVGcLscGi2TLWm1dww0KpGY8q6gD9m5XbZs=;
 b=bF3yOSmKTfDGXPD0E8FwuVYMJ99f1elzO53INhOKOZsc85WJkyZHE2iQIQLW8mVgVHh7L3
 iTB9XYFEoNkvn/r9O/hgz6D7VOtleq8bjSOxNNGJOko2urHYJFo3g7xrz9ebZvwtqIcZLKto
 kvDLpb3i0BtudUUDctZmFSIRgLX0bMGSKi1XB/L2DMJCK0umwGINzIfnVYMmR44JN2V0ycoR
 olHROaWBJzjmDHa5QQXei6SfZVGf91d6ORgcNcAPkMgMixRs1itFuRe29BWUiPCCTh3IBCtY
 eNdhmazT/tHSL/qF9q91ogNiL4eX7+83rbjC6g/9j9n4xYquegFGX/vg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/7] libmicrohttpd: set status for CVE-2025-59777 and CVE-2025-62689
Date: Wed, 29 Apr 2026 21:36:43 +0200
Message-ID: <20260429193647.3090502-3-peter.marko@siemens.com>
In-Reply-To: <20260429193647.3090502-1-peter.marko@siemens.com>
References: <20260429193647.3090502-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 19:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236133

From: Peter Marko <peter.marko@siemens.com>

This was fixed in the same commit includeded in 1.0.3 per [1] and [2].
The CVEs have dates instead of version in CPE.

[1] https://security-tracker.debian.org/tracker/CVE-2025-59777
[2] https://security-tracker.debian.org/tracker/CVE-2025-62689

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb
index cca3496a19..935fbfcf89 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.5.bb
@@ -25,3 +25,6 @@ do_compile:append() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-59777] = "fixed-version: fixed since 1.0.3"
+CVE_STATUS[CVE-2025-62689] = "fixed-version: fixed since 1.0.3"

