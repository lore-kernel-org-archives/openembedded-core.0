Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D10E98E03
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 08:11:33 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31280.1771834291295620204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 00:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qm9sL1wj;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8CA79C1266C
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 08:11:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 83FEA5FD43;
	Mon, 23 Feb 2026 08:11:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D23010368EA3;
	Mon, 23 Feb 2026 09:11:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771834288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fDzdoG3HCWK7LK0iJ3L3dozhZ0JdAkcvg2TX0JaEbTc=;
	b=qm9sL1wjTGx6cTb6vUDGXX3DvIq7XNK+6E53o7IkfDgMiECQd60ZriPxvlFZmsP/cr0qev
	THFxnNZXhGUuiRUkeYWhInnBhkRtOhx+4N9/A/JlMHHy3hPDZ4fFPAX6BkfJcisP0Zmn72
	M5Ggadd5/WOK/UMkcsuovHszAIPdaavqPuOBaEFxGNvQYgLUa6EELu5vES+Y+hbaCkLHkQ
	X/CXnSqHBctytBoYbgcA75tiMbBAKklbFZGyGTUlnz7uGoqkOouS7kffGo6sDdHG113xcR
	4XPwsEFneyR48e0YvoRRIKatmcbJdShzbAt5kGFacVLz682nO1WAJG0iTwOISw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 23 Feb 2026 09:11:08 +0100
Subject: [PATCH v2 1/2] avahi: Remove a reference to the rejected
 CVE-2021-36217
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-update-patch-with-rejected-cve-v2-1-851e6f96b910@bootlin.com>
References: <20260223-update-patch-with-rejected-cve-v2-0-851e6f96b910@bootlin.com>
In-Reply-To: <20260223-update-patch-with-rejected-cve-v2-0-851e6f96b910@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, thomas.petazzoni@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, antonin.godard@bootlin.com, 
 jpewhacker@gmail.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 08:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231651

CVE-2021-36217 is rejected, and should no longer be referenced.
CVE-2021-36217 is a duplicate of CVE-2021-3502 which is already
referenced in the local-ping.patch.

The CVE database indicates the following reason:
  ConsultIDs: CVE-2021-3502. Reason: This candidate is a duplicate of
  CVE-2021-3502. Notes: All CVE users should reference CVE-2021-3502
  instead of this candidate. All references and descriptions in this
  candidate have been removed to prevent accidental usage.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/recipes-connectivity/avahi/files/local-ping.patch | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/files/local-ping.patch b/meta/recipes-connectivity/avahi/files/local-ping.patch
index 29c192d296e0..8f102815df04 100644
--- a/meta/recipes-connectivity/avahi/files/local-ping.patch
+++ b/meta/recipes-connectivity/avahi/files/local-ping.patch
@@ -1,4 +1,3 @@
-CVE: CVE-2021-36217
 CVE: CVE-2021-3502
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>

-- 
2.53.0


