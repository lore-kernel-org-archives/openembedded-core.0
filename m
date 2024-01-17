Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8A5C47DA2
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 15:07:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4749.1705504043161387229
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 07:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1B1111FB
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:08:08 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5E0BD3F5A1
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:07:22 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] musl: doesn't support riscv32
Date: Wed, 17 Jan 2024 15:07:17 +0000
Message-Id: <20240117150720.3585669-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 15:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193919

From: Ross Burton <ross.burton@arm.com>

musl doesn't support riscv32, so set COMPATIBLE_HOST appropriately.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/musl/musl.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/mus=
l.inc
index 66468e92ff0..6ca52b186a5 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -25,6 +25,9 @@ MIPS_INSTRUCTION_SET =3D "mips"
 ARM_INSTRUCTION_SET:armv5 =3D "arm"
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
=20
+# 1.2.4 doesn't support riscv32
+COMPATIBLE_HOST:riscv32 =3D "null"
+
 # Enable out of tree build
 B =3D "${WORKDIR}/build"
=20
--=20
2.34.1


