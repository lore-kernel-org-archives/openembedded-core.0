Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BE0C369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 15:47:18 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.18288.1745250435787646919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 08:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout02.t-online.de (Postfix) with SMTP id F354054A
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 17:47:13 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.191]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u6tMW-1PXKHh0; Mon, 21 Apr 2025 17:47:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] qemu: add PACKAGECONFIG for sdl-image
Date: Mon, 21 Apr 2025 17:47:02 +0200
Message-ID: <20250421154702.3439-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745250432-80FF6A64-1AFBADED/0/0 CLEAN NORMAL
X-TOI-MSGID: db942bf6-a41e-4cbb-b816-305346b9b7d7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 15:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215178

This allows to enable sdl-image support from a bbappend file

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 1fb387e9b5..048266f5f6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -166,6 +166,7 @@ PACKAGECONFIG:remove:darwin =3D "kvm virglrenderer ep=
oxy gtk+"
 PACKAGECONFIG:remove:mingw32 =3D "kvm virglrenderer epoxy gtk+ pie"
=20
 PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,libsdl2"
+PACKAGECONFIG[sdl-image] =3D "--enable-sdl-image,--disable-sdl-image,lib=
sdl2-image"
 PACKAGECONFIG[png] =3D "--enable-png,--disable-png,libpng"
 PACKAGECONFIG[virtfs] =3D "--enable-virtfs --enable-attr --enable-cap-ng=
,--disable-virtfs,libcap-ng attr,"
 PACKAGECONFIG[aio] =3D "--enable-linux-aio,--disable-linux-aio,libaio,"
--=20
2.49.0


