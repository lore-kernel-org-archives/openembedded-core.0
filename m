Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2D4C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 13:57:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22448.1684245458458932564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 06:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 087A01FB;
	Tue, 16 May 2023 06:58:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C6D653F7BD;
	Tue, 16 May 2023 06:57:36 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] qemu: add PACKAGECONFIG for debuginfo support
Date: Tue, 16 May 2023 14:57:02 +0100
Message-Id: <20230516135702.1044245-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 13:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181406

From: Ross Burton <ross.burton@arm.com>

qemu was auto-detecting the presence of libdw from elfutils, which
causes problems with a sstate object for qemu-native built with libdw is
ran on a machine without libdw.

We have no need for the debuginfo support to be enabled, so disable this
by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 394fa2acabf..a87dee5c996 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -224,6 +224,7 @@ PACKAGECONFIG[vde] =3D "--enable-vde,--disable-vde"
 PACKAGECONFIG[slirp] =3D "--enable-slirp,--disable-slirp,libslirp"
 PACKAGECONFIG[brlapi] =3D "--enable-brlapi,--disable-brlapi"
 PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack,"
+PACKAGECONFIG[debuginfo] =3D "--enable-libdw,--disable-libdw,elfutils"
=20
 INSANE_SKIP:${PN} =3D "arch"
=20
--=20
2.34.1


