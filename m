Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E8EC55A79
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 11:02:12 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35834.1771585329136267444
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 03:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=g4ZI0R/O;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5A599C16546
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 11:02:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93AB45FA8F;
	Fri, 20 Feb 2026 11:02:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B823210368CBF;
	Fri, 20 Feb 2026 12:02:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771585325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OcQazP+89kJD8A7KFtITlV1lMBZaFLlu1Dnc2PIClTw=;
	b=g4ZI0R/O7DfXyv6Sf3jjN3kyG8WUvlid5QJ/pxMJ/R2fSaZ26nCs1QqNPp8oM3vxkw0EUs
	wSYngTIfaA+y48Ovf+i55hFBYR9MZZM5JPxh5Jy5LhAEtcMs9JeVqAiuNAUtG4NoQctO/T
	BsmVovhpURC1fl4vvuprJ/X0A7uxcZg4+EJRzmvwl8TJyMXS8NBEiA2Tj2xRR6vq1hOxhr
	loUDWqa3VKqYCyvVtAs6mCN5eEetgDHlSI9IomucumwL4ea+exGg6ARfEy2/ba6N0iJOxO
	3OCNxKw2b/WKitxcil5MlI5WRzDPyKxBW4ypk0VIohQz3CpaVRQZagZOpWgnNQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Fri, 20 Feb 2026 12:01:56 +0100
Subject: [PATCH 1/2] meta: update avahi patch to remove ref to rejected CVE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-update-patch-with-rejected-cve-v1-1-cf113d8a15ca@bootlin.com>
References: <20260220-update-patch-with-rejected-cve-v1-0-cf113d8a15ca@bootlin.com>
In-Reply-To: <20260220-update-patch-with-rejected-cve-v1-0-cf113d8a15ca@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 11:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231510

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
2.52.0


