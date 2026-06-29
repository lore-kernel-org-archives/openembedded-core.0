Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77E4C43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 11:07:03 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35197.1782731213365006036
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 04:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=EPTvKzVP;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A0614E40B56
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 11:06:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3C275FF96;
	Mon, 29 Jun 2026 11:06:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73C1A106F1732;
	Mon, 29 Jun 2026 13:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782731210; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=z3D9TYnCxr7jas3V8McQ4LPUwPzQkOqVtpRat000WtQ=;
	b=EPTvKzVPEV6Ca0b5deRSqPYAen5vmdvFWBRx+CpuNWVqzPXcT588KnWB9kLRicheroj7yl
	P5Cc0RKKEavRl8zLSbvciUEwARG1A5Lp+GhuOkvu8BP/eVcSq95PXFeyFRcfAgCKymxFbw
	3D/4FCl6xjveQHa4vyA44EGy48aVR+2uV3SBXLiEpOsbTSElqD+3ykVLIYEjZGChTArVwa
	9X+85S2bMzCYxvXzS+Y9bTRduCVSjKMRdiNAi9hqaVgk07LWaq4pEbSEu/58sYBCvqrvnu
	lHKEDOU/Gd5v+LVTlo/u4/JoF68D51BjpoSu9ihjHEG7/eaJ0r0f0253G5ALrw==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 0/2] clang: misc fixes
Date: Mon, 29 Jun 2026 13:06:17 +0200
Message-ID: <20260629110619.530623-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 11:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239756

Hello,

Regarding the first patch, it is dead code for now because get_clang_host=
_arch()
and get_clang_target_arch() are not used anywhere. However, I had prepare=
d some
patches to fix them too, then use them to define LLVM_TARGETS_TO_BUILD, b=
ut this
still needs some testing and I have other changes to submit first.

Best regards,

Jo=C3=A3o Marcos Costa (2):
  common-clang.inc: fix undefined name in get_clang_arch
  clang_git.bb: remove dangling comment

 meta/recipes-devtools/clang/clang_git.bb     | 2 --
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

--=20
2.47.0


