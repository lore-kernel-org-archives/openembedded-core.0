Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53382EDA68D
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 16:46:50 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23210.1772556402816863033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 08:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DcaaH5JR;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 45AC0C40FA0;
	Tue,  3 Mar 2026 16:46:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 881CF5FF29;
	Tue,  3 Mar 2026 16:46:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A792103696B7;
	Tue,  3 Mar 2026 17:46:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772556399; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C+g2XGUb+I2198y7BznYz5a71rFRm7fcnPQiUWOSq2s=;
	b=DcaaH5JRL1jG2JferlOehF7jKRr8ZR6BHNeVfOv6um2K5LAkW5aDLkHt/eioDGUWPmbZq5
	fEZzneJTJ3T7gztBvF8p3ZcqwEL/i2Lxthy//ARu0JNDn4M7n0XaF10keUs045AubThbeX
	NhTpw4rVu3/4TtGq5TvWzcV9+kUrCx+qlIieubOw+h0A6eKTpOVJ36cw3XqCb0Y9egv2Fa
	n/a8CtLUeOWrfUEQuYJcvHtWSuzi8PD8zbpvVfK4BbJxS9f1KC8+J2tNnbkKBFvaJhMoZ+
	gH5JiLMTFgsxGAFZehkK5P/RTZ6jTRmjJ4z0kNyIhlWyvqDftss7GvgLA3Tzhg==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Tue, 03 Mar 2026 17:46:15 +0100
Subject: [PATCH scarthgap 1/3] avahi: Remove a reference to the rejected
 CVE-2021-36217
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-backport-fixes-scarthgap-v1-1-2dc803f921a9@bootlin.com>
References: <20260303-backport-fixes-scarthgap-v1-0-2dc803f921a9@bootlin.com>
In-Reply-To: <20260303-backport-fixes-scarthgap-v1-0-2dc803f921a9@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com, richard.purdie@linuxfoundation.org, 
 JPEWhacker@gmail.com, thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>, 
 Ross Burton <ross.burton@arm.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 16:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232326

CVE-2021-36217 is rejected, and should no longer be referenced.
CVE-2021-36217 is a duplicate of CVE-2021-3502 which is already
referenced in the local-ping.patch.

The CVE database indicates the following reason:
  ConsultIDs: CVE-2021-3502. Reason: This candidate is a duplicate of
  CVE-2021-3502. Notes: All CVE users should reference CVE-2021-3502
  instead of this candidate. All references and descriptions in this
  candidate have been removed to prevent accidental usage.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
(cherry picked from commit bf41240132e2efa6b46aab46290eed9c53e312e9)
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


