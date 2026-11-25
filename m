Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39008.1795601001374753171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 02:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eGDzJMzH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7C7D0C2F4E0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:03:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 991C860480
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:03:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1EF811E69D65;
	Wed, 25 Nov 2026 11:03:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795600994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=WYvYeoKoONQWyXsEK3z1xUKVsvX2fREV5YmhG82BEPA=;
	b=eGDzJMzHar4M+jhnQHv/lxHRl2dB3h+PPDxxqnQ57UkUEY8EDchdCIhzesIrRFW5UqLfuc
	3+F6VXFzd9rnjP35KMrT4r1WnSxaFo2AQKA4MN9y1ryVFY0I8x33ZhUSEj4U73bp89hqJW
	MgxKKcvpglIujWFW/hbsMHQaeGKuvQMUM7Izbd35Gu+n3r5zij0jzCqV3eXFH9r6zv5IGS
	+zKAIklXQuLtnCRmWYwyTzw1GAouSuD1JvlamnziunMgD9VpoaTDiDT2824szUWAb2nTu7
	aX7tgiMWokdqZ9MoYr31B/uGR+9k1CH/eoZozi6h6855FtqF5J8thawU6DmOYQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] zstd: upgrade 1.5.7 -> 1.6.0 and PACKAGECONFIG update
Date: Wed, 25 Nov 2026 11:03:04 +0100
Message-Id: <20261125-zstd-1-6-0-v1-0-95f50c6b9de6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxA0asgz7UUW9QDV0EMlLjFDIBiqBCIu
 xPa8Q3/H+CaTB2q4oCkX3Obxgx6FND17fhRtJgNHFiIuMTdl4iEggGFSUWeHLSMkIM56du236x
 u/vb1NWi33Ac4zwuq2pcQbgAAAA==
X-Change-ID: 20261124-zstd-1-6-0-621e66520e4d
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=513;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tOu9uQ3ZG57vyDmub8f/p29F52jx4V8H7tGgb5hqsd4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBrBrJax0ZKWOhFMPRw3BnaPXAsGn1pxRoY8gB9+
 ENx+iovTRqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCawayWgAKCRDRgEFAKaOo
 NgslD/4whwjfAFJxNWoA07fAcZUl1QAeOYHbvkznwc7Q5XxiWQH5dRAuijXm/8rHneIweCgWD1r
 omYhHtF3dtCGeEoiA6SxdCiHmay04YEEj/oyqW3gRrpz5Cuy7O255R45NbUYwq2DEV0xRamzmxa
 sdu9mT7nIoTmotZnmG+g9tR8pm2vL3TItssGub1cuy3t+XBTD1/BjfJhpORkYosdO7gnQmbPZXB
 INkyCS2J1RtjS4qmUnguok6j+7L3hen17zV9I+G/bBy0bRFQXMsmpWoW99kjm9OU7nv0EC8KXxR
 59GSxKOSBreLM/bE3pk4bcYliXMPO97j0ebk/78nBUKPfdNh73AH/58O+ZnTayIJrIwNfcjy4Ss
 flljnC4E7/8ivt8NShqXRVG0Yws4xY0zhwPvHAUtMrxU4CxmpJhXFmZacJNypsAo15ODkGDfAZO
 3IVHvXcH+Q0tcr1dlgbbLdxzmytFTZfpRsaNTgvMwKI/LqxfC9GqP0ZIJ9uJkk6UmHUKTRhFmjc
 laLgICXBN8JVlaBCEvLl/tf+iHcEy8yREzihtw60opZLc+4Gl3vp7yyBLkSFhh1zb0NlY2o0+1B
 96cicAUS+Fj2AJcvUrvv3LvmfLjVlA0HBGUAi3a9N1qy4XZsVeNYjlfz678p5i4WgFfsObyfuyN
 uHt/ZQOu14pAf5g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251175

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      zstd: upgrade 1.5.7 -> 1.6.0
      zstd: add nobench, nocompress, nodecompress, nodict to PACKAGECONFIG

 ...01-cli-tests-skip-zstd-max-level-when-memory-is-insuffi.patch | 4 ++--
 meta/recipes-extended/zstd/{zstd_1.5.7.bb => zstd_1.6.0.bb}      | 9 +++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)
---
base-commit: 7412d08ab2ee94354a93f3765b94479d84c6b034
change-id: 20261124-zstd-1-6-0-621e66520e4d

