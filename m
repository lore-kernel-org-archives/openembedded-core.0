Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF4AC61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:31:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6170.1787722309809372616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cvgtjVRj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7DA734E413BB
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:31:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 51DBB604EC
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:31:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9821F11C7A724;
	Wed, 26 Aug 2026 07:31:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787722303; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=tawX94hiX89LZD2LmhDy3EATrVn1NjnFo9hnRYWdjbc=;
	b=cvgtjVRjJr7mp/115LAdtqarv7xiSi1ad7Tnppi6iP31WRtib6AKHtIIdka/vd8b06MtEl
	1m5SmIG01RgamW/qpfPLJvb8r5XYL/RzS/Ccl+MvUMTw5fcuWFNaj6tYo0SYNy1pKOID1F
	QOmTk8ohqJW5/2I+jvxpK5CSohc7RUy8NwQQCs8M/UMTFR0Wqd0hxmWNDbA9vFt8LMDy1E
	G3AcC1CpAlpdQltkg+Fohs3ADKIhIhHv92EHiRH8l5HfSe0QsaLbgjN98zSZC0D4kxaBXo
	0crSCoIBnIth4YG90hUJkz+Kv8R6MIaHCRiDobb33P0ZrmCIoQkTvmM3vtnIMA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/2] python3-pbr: upgrade 7.1.0 -> 7.1.1
Date: Wed, 26 Aug 2026 07:31:24 +0200
Message-Id: <20260826-mathieu-updates-v1-0-7a93b2311f69@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC16jmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMz3dzEkozM1FLd0oKUxJLUYt0UwyRjY3MzYzNDSwMloK6CotS0zAq
 widGxtbUAx1CBbWEAAAA=
X-Change-ID: 20260826-mathieu-updates-d1b337636190
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787722301; l=648;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=yWfkNrCTD8U5AViYsokkjNiEAqI7geBsbdgG1//KvqA=;
 b=/kNjbjTYlQrrMr8+gZlT3KnQ5ax7LgpTbgowfKx/rqPm7w3P7sEE6CW3porOCJDe/jGoR5ySL
 w5YY8Y88apGDvqAh3/ezUWNWT78yahl57SyAJHMb4kL6C6HZxGiuxiV
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244291

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (2):
      python3-pbr: upgrade 7.1.0 -> 7.1.1
      python3-maturin: upgrade 1.14.1 -> 1.15.0

 .../python/python3-maturin-crates.inc              | 34 ++++++++++------------
 ...maturin_1.14.1.bb => python3-maturin_1.15.0.bb} |  2 +-
 .../{python3-pbr_7.1.0.bb => python3-pbr_7.1.1.bb} |  2 +-
 3 files changed, 18 insertions(+), 20 deletions(-)
---
base-commit: b05cc576e46262e92f2978a5c4f8b27ea775be00
change-id: 20260826-mathieu-updates-d1b337636190

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


