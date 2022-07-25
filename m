Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0D9C43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 13:21:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.28105.1658755301324447746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 06:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B49C2B;
	Mon, 25 Jul 2022 06:21:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D5C43F73B;
	Mon, 25 Jul 2022 06:21:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] qemu: add io_uring PACKAGECONFIG
Date: Mon, 25 Jul 2022 14:21:29 +0100
Message-Id: <20220725132129.280622-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 13:21:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168483

io_uring is enabled or disabled depending on whether liburing is availabl=
e,
so add a PACKAGECONFIG to make this explicit, disabled by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index e5e644453df..c9e48f4a5a8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -141,6 +141,7 @@ PACKAGECONFIG:remove:mingw32 =3D "kvm virglrenderer e=
poxy gtk+"
 PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,libsdl2"
 PACKAGECONFIG[virtfs] =3D "--enable-virtfs --enable-attr --enable-cap-ng=
,--disable-virtfs,libcap-ng attr,"
 PACKAGECONFIG[aio] =3D "--enable-linux-aio,--disable-linux-aio,libaio,"
+PACKAGECONFIG[uring] =3D "--enable-linux-io-uring,--disable-linux-io-uri=
ng,liburing"
 PACKAGECONFIG[xen] =3D "--enable-xen,--disable-xen,xen-tools,xen-tools-l=
ibxenstore xen-tools-libxenctrl xen-tools-libxenguest"
 PACKAGECONFIG[vnc-sasl] =3D "--enable-vnc --enable-vnc-sasl,--disable-vn=
c-sasl,cyrus-sasl,"
 PACKAGECONFIG[vnc-jpeg] =3D "--enable-vnc --enable-vnc-jpeg,--disable-vn=
c-jpeg,jpeg,"
--=20
2.34.1


