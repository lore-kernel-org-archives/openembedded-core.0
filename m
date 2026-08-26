Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347E3C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:34:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7889.1787733240672481510
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PDAF9HOx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 65F554E413CA
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:33:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34437604EC
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:33:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06D9211C7AC85;
	Wed, 26 Aug 2026 10:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733233; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4XZXNFNw+LbBFZxOZqp7qyJ9QUPCBUDawiiuyDWRgZ0=;
	b=PDAF9HOxynHusqy+t+IZqRg4lTJ1LkLJglk/0g6CJr2FD0Y0OpYLzVVvTPYvbh57pC7zPv
	FPZzMZMrNN3+OvRvifhjUnVMo4G1InxT0GYcOfcadNTUQasDB8ei7weAyQv3+U9NerH227
	i/SURrmcEBJK6c6PV2EnbVRcsOET45pXIfsFVbO1Osp/mCitA/ibUTduURS0PvrbWA06n2
	T2KrU3+BsYznlP+25FRijaYRZAxu4BmAAySpLMSYajLu+MIgBtx2rxEOhheTKWhDzaFf9m
	AbeouwqWzUe1SLqsAWWqDLp6yjMg55PruSLnpvOIC0rjEoO7LUm74iuxTtXU+w==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH 0/8] Various upgrades
Date: Wed, 26 Aug 2026 10:33:39 +0200
Message-Id: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOOkjmoC/z2MQQqAIBAAvxJ7TrBFLPpKdBBdaw+ZaEUg/T3p0
 HEYZgpkSkwZxqZAoosz76FC1zZgVxMWEuwqA0rUckAtNnOsTKc4ozMHZfELa5zG3iuPUkHNYyL
 P97ee5ud5AeuEpqtqAAAA
X-Change-ID: 20260826-mathieu-updates-20260826-cad627f4f204
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787733232; l=1712;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=L8mr0z0Gt9JVDmX/kNa/QvjWep3411pCdMEr+Udc+2Q=;
 b=emJJbpCUbEoGyo+fFEuDfoKbqniZP5KoG9ovhLRTX03quy7Se1wvn3IXjbN2/z8REdakGELHd
 +VDFb1UJoZ8BcrHrad9gJmjYhrl1SAqF/VocWdVa7w0YXT13xiyzNPv
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244367

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Mathieu Dubois-Briand (8):
      python3-imagesize: upgrade 2.0.0 -> 2.0.1
      libslirp: upgrade 4.9.3 -> 4.9.4
      cmake,cmake-native: upgrade 4.4.2 -> 4.4.3
      python3-cryptography: upgrade 50.0.0 -> 50.0.1
      python3-git: upgrade 3.1.59 -> 3.1.60
      python3-pbr: upgrade 7.1.0 -> 7.1.2
      python3-uv-build: upgrade 0.12.5 -> 0.12.6
      man-pages: upgrade 6.18 -> 6.19

 .../slirp/{libslirp_4.9.3.bb => libslirp_4.9.4.bb}                | 2 +-
 .../cmake/{cmake-native_4.4.2.bb => cmake-native_4.4.3.bb}        | 0
 meta/recipes-devtools/cmake/cmake.inc                             | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.4.2.bb => cmake_4.4.3.bb}    | 0
 meta/recipes-devtools/python/python3-cryptography-common.inc      | 2 +-
 meta/recipes-devtools/python/python3-cryptography-vectors.bb      | 2 +-
 meta/recipes-devtools/python/python3-cryptography.bb              | 2 +-
 .../0001-pyproject.toml-remove-benchmark-disable-option.patch     | 8 +++-----
 .../python/{python3-git_3.1.59.bb => python3-git_3.1.60.bb}       | 2 +-
 .../{python3-imagesize_2.0.0.bb => python3-imagesize_2.0.1.bb}    | 4 ++--
 .../python/{python3-pbr_7.1.1.bb => python3-pbr_7.1.2.bb}         | 2 +-
 .../{python3-uv-build_0.12.5.bb => python3-uv-build_0.12.6.bb}    | 2 +-
 .../man-pages/{man-pages_6.18.bb => man-pages_6.19.bb}            | 4 ++--
 13 files changed, 15 insertions(+), 17 deletions(-)
---
base-commit: 1426897def97186e2f2ef62fbe140f41a94f07e4
change-id: 20260826-mathieu-updates-20260826-cad627f4f204

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


