Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BA7F36C45
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:44:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14478.1776671095056661846
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1g7CkXu4;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7E3E81A3359;
	Mon, 20 Apr 2026 07:44:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E5165FFA5;
	Mon, 20 Apr 2026 07:44:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC69F10460B76;
	Mon, 20 Apr 2026 09:44:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776671092; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nuMsPEKL/baZqyeBXfeMlyVqIlnGgYZv+Ob4E1Fb2U4=;
	b=1g7CkXu4JGcyqD/FitdoWvY4GPD63Ca8ux6tDZVqoOVBt0BducVgSguzQPoB0EPov8dzSa
	VXM3p0rWJ5HufoS+cMcdySRpFiBuw2jj61fXgx7ViQV6VBMk2NL5M+sl1lFoCYbqUxjpuv
	Yy2EQfINryWmielD3kleQkIqvrNaEnkdSvdiG7y3N7QDAox7p5rS/0tgqbwxQYcMNM/YcN
	6t4F2BQA+MUSTPNVNLQIsZCYO3b0gwUbLHoF6t5cloava9Xj1hhqAJVQcStQ8Y5kfpsguF
	PO5CBx5r2z2WLXr7SeMZWmnU5VBrfPb3ypr5jEubvlP6s4nbH8XHarIFxlAwqA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 20 Apr 2026 09:44:38 +0200
Subject: [PATCH 07/10] oe/spdx_common: Remove redundant '\d' in RegExp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spdx3-improvements-v1-7-27e0d5edcdbe@bootlin.com>
References: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
In-Reply-To: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235548

The \w metacharacter matches word characters.
A word character is a character a-z, A-Z, 0-9, including _

The \d metacharacter matches digits from 0 to 9.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/lib/oe/spdx_common.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index c0ef11f19950..47d14b55c701 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -15,7 +15,7 @@ from pathlib import Path
 from dataclasses import dataclass
 
 LIC_REGEX = re.compile(
-    rb"^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$",
+    rb"^\W*SPDX-License-Identifier:\s*([ \w.()+-]+?)(?:\s+\W*)?$",
     re.MULTILINE,
 )
 

-- 
2.53.0


