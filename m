Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A270C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:05:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6668.1784124319828196802
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Ingr3Qmq;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EEC81477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:15 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F39C93F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784124319; bh=cx2ie3YVbzFo3KMSYm/tDaKtJNvxLwu3hUcC4pEF8xk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ingr3Qmq9eQ4MNVv1gsYB4XIp+6Yatxwtukhmb0C1VqV0upmMTxaYH5+BhWjCFf7D
	 iO/7KIuo50o0QTyabQdaq1PTyNEQOARWgiPhfN2xoRP+3O4CjvaEYYY+rsnt1Mv9Dm
	 G7FQDMsnKRV/7QoQlaMshU7JT7oqWvpZH166WsKg=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/12] xeyes: build with meson
Date: Wed, 15 Jul 2026 15:05:04 +0100
Message-ID: <20260715140507.2329605-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715140507.2329605-1-ross.burton@arm.com>
References: <20260715140507.2329605-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240968

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-app/xeyes_1.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-app/xeyes_1.3.1.bb b/meta/recipes=
-graphics/xorg-app/xeyes_1.3.1.bb
index d412bfb4c80..33ad8bddc9f 100644
--- a/meta/recipes-graphics/xorg-app/xeyes_1.3.1.bb
+++ b/meta/recipes-graphics/xorg-app/xeyes_1.3.1.bb
@@ -12,3 +12,5 @@ SRC_URI_EXT =3D "xz"
 SRC_URI[sha256sum] =3D "5608d76b7b1aac5ed7f22f1b6b5ad74ef98c8693220f32b4=
b87dccee4a956eaa"
=20
 DEPENDS +=3D "libxau libxt libxext libxmu libxrender libxi"
+
+XORGBUILDCLASS =3D "meson"
--=20
2.43.0


