Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DD2D3EE82
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:34:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39964.1769096085138001592
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 268E91515
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 07:34:38 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 53AE73F632
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 07:34:44 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] ffmpeg: ensure manpage generation is deterministic
Date: Thu, 22 Jan 2026 15:34:35 +0000
Message-ID: <20260122153438.1546221-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122153438.1546221-1-ross.burton@arm.com>
References: <20260122153438.1546221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 15:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229849

Add pod2man-native to DEPENDS to ensure that pod2man is always available
and manpage generation is deterministic.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_8.0.1.bb
index 5ae985efb5..d7afdd14f3 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb
@@ -38,6 +38,7 @@ ARM_INSTRUCTION_SET:armv6 =3D "arm"
 # Should be API compatible with libav (which was a fork of ffmpeg)
 PROVIDES =3D "libav"
=20
+DEPENDS =3D "pod2man-native"
 DEPENDS:append:x86 =3D " nasm-native"
 DEPENDS:append:x86-64 =3D " nasm-native"
=20
--=20
2.43.0


