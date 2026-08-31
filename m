Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9934C61DE2
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:04:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25589.1788167054200139408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2SJTHxuR;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 568124E41464
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2306E60231
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D82E11C78388;
	Mon, 31 Aug 2026 11:04:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788167051; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=RDx8jtoZs46k9NcZCaOOFTlcGPnPPlvUi38sYpSPM/Q=;
	b=2SJTHxuRLLgX5D6GNGrHKzvngyNNdIBAz3dCuuAAP8oV1OxC3f+26pHMaOhbv3nTUe3HLO
	3yKRnlTaEKRvRsvJJqh1inp8rfgrICGRiTaybkDMfhCk+eMww4HACz+BFh2W/1tjBgoblj
	bjXZedyjIBjdXLvU8QxKRlAJwx38DfKTG/kid/pZL7kEOQQz8olj5hgg1V++qQWgpIe4GY
	jA0ktiPsmO4LOVIGOAOcFKFs6DHka8+u1PmVcwNpS8+gukg+t5ufG8mB4myF+OFftEZJsg
	+sag2pMxsj+SdBQZsVYVaQ3z69+muYxgPM4EFMUxFIOvijEIvNLeD6UaPYXiYw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/9] Various upgrades
Date: Mon, 31 Aug 2026 11:03:32 +0200
Message-Id: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGRDlWoC/x3MQQqAIBBA0avErBsYC8y6SrSQmmoWmWhFEN49a
 /l58B+IHIQjdMUDgS+JsrscqixgXK1bGGXKDRVVmkytcLPHKnzi6Sd7cMQPkAxmGo2mRmlL7dx
 CHvjAs9z/vB9SegHWJytkbAAAAA==
X-Change-ID: 20260831-mathieu-updates-2026-08-31-c860716a09f9
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788167050; l=2018;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=QaMCwpBMpGYfp9q7RoGgWAqIdYFszW9y1sYdtOx8qvQ=;
 b=PjoiDVkkD3GD0s8WRNHAsYmSwQkcRbNpmEs0eEhQw0Vu6NsxHHTZbzd+OwuYyFjiB1Q+poUqG
 O2bvOUNOzRMA0Fd2QVqFELv7u/EAoeNZYQlEfH84lAKqYXMpgFQCGuQ
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244742

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (9):
      orc: upgrade 0.4.42 -> 0.4.43
      python3-wcwidth: upgrade 0.8.2 -> 0.8.3
      appstream: upgrade 1.1.6 -> 1.2.0
      libgcrypt: upgrade 1.12.2 -> 1.12.3
      libksba: upgrade 1.8.0 -> 1.8.1
      python3-hypothesis: upgrade 6.165.10 -> 6.167.0
      re2c: upgrade 4.5.1 -> 4.6
      python3-pdm: upgrade 2.28.2 -> 2.29.0
      sysstat: upgrade 12.7.9 -> 12.8.0

 .../orc/{orc_0.4.42.bb => orc_0.4.43.bb}           |   2 +-
 ...s_6.165.10.bb => python3-hypothesis_6.167.0.bb} |   2 +-
 ...python3-pdm_2.28.2.bb => python3-pdm_2.29.0.bb} |   2 +-
 ...3-wcwidth_0.8.2.bb => python3-wcwidth_0.8.3.bb} |   2 +-
 ...1-configure.in-remove-check-for-chkconfig.patch |   4 +-
 .../{sysstat_12.7.9.bb => sysstat_12.8.0.bb}       |   2 +-
 .../appstream/0001-remove-hardcoded-path.patch     |   6 +-
 .../appstream/0002-Do-not-build-qt-tests.patch     |   2 +-
 ..._PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch |   2 +-
 .../{appstream_1.1.6.bb => appstream_1.2.0.bb}     |   2 +-
 .../0001-libgcrypt-fix-m4-file-for-oe-core.patch   |   2 +-
 ...-tests-Fix-link-errors-for-t-thread-local.patch |  13 +--
 ...ile.am-fix-undefined-reference-to-pthread.patch |  11 +--
 .../libgcrypt/files/no-bench-slope.patch           |   2 +-
 .../libgcrypt/files/no-native-gpg-error.patch      |   4 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.12.2.bb |  56 -----------
 meta/recipes-support/libgcrypt/libgcrypt_1.12.3.bb | 106 +++++++++++++++++++++
 .../libksba/ksba-add-pkgconfig-support.patch       |   2 +-
 .../libksba/{libksba_1.8.0.bb => libksba_1.8.1.bb} |   2 +-
 .../re2c/{re2c_4.5.1.bb => re2c_4.6.bb}            |   2 +-
 20 files changed, 135 insertions(+), 91 deletions(-)
---
base-commit: db81c1a42a0f552d9a8ec124f004ae2063d58c33
change-id: 20260831-mathieu-updates-2026-08-31-c860716a09f9

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


