Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8318CD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 14:28:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44565.1782138528674036864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 07:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nUYhcrEU;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46A72175D
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 07:28:43 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 663223F632
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 07:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782138527; bh=vgbH4ZuF9d/s0ozVW7lePq/KvJTP3dFDynwjdFsclqk=;
	h=From:To:Subject:Date:From;
	b=nUYhcrEUB7N78A7d6jVMrGvJ+WcAQVNaQ4fdnpkAdCGW4Q4iui7XvCTkbRvmM+Zz8
	 cd2vq/zfp0H0IQAVP/nTm5iv4kccgZaD/u7hngwVmLZwR7y3xVc9v4Mry4YdyiK278
	 +qb3oWS+CjrDTBSonSCDFexjEEax2P1jPE/OD35g=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rng-tools: remove obsolete CFLAGS
Date: Mon, 22 Jun 2026 15:28:45 +0100
Message-ID: <20260622142845.2484071-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 14:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239303

There's no need to set this explicitly, as upstream does this since 6.16
onwards[1].

[1] rng-tools 57be6d ("configure.ac: fix jitterentropy internal timers
    detection")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/rng-tools/rng-tools_6.17.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.17.bb b/meta/reci=
pes-support/rng-tools/rng-tools_6.17.bb
index c979a916400..90856586972 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.17.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.17.bb
@@ -33,8 +33,6 @@ INITSCRIPT_PARAMS:${PN}-service =3D "start 03 2 3 4 5 .=
 stop 30 0 6 1 ."
 SYSTEMD_PACKAGES =3D "${PN}-service"
 SYSTEMD_SERVICE:${PN}-service =3D "rng-tools.service"
=20
-CFLAGS +=3D " -DJENT_CONF_ENABLE_INTERNAL_TIMER "
-
 PACKAGES =3D+ "${PN}-service"
=20
 FILES:${PN}-service +=3D " \
--=20
2.43.0


