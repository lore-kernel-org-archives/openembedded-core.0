Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D5FC44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:17:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6903.1784125051760847044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=vlQwN5La;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDB601477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:17:26 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C50A43F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784125051; bh=u9mGz9pK3X2Kuzt6Sv8Mu2gsnAUIUYQ5RqiRlkaIhJw=;
	h=From:To:Subject:Date:From;
	b=vlQwN5LavaF3L20ZsWicVHuhyJdmVq6sKYj5BC98l5r6usFrS3Z8C6YFSFg/8EkbZ
	 AdPmGdWsKe3pk31FM68JZQQiKZZe+S38oVb0BHYHwv9NT/Dbkr8GfsGeGdglig7QqN
	 IEeniDuAKqEUv7BJM0344U7g+ahPdAyz33PXjkvA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] systemd: enable coredump by default
Date: Wed, 15 Jul 2026 15:17:26 +0100
Message-ID: <20260715141728.2384771-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240972

coredump capturing is useful, so enable the support by default.

This doesn't pull any further build dependencies into the build, it just
adds coredumpctl and associated services (+140Kb).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd_259.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-co=
re/systemd/systemd_259.5.bb
index 27722f97bbb..356a10b4b61 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -52,6 +52,7 @@ PACKAGECONFIG ??=3D " \
     link-udev-shared \
     backlight \
     binfmt \
+    coredump \
     gshadow \
     hibernate \
     hostnamed \
--=20
2.43.0


