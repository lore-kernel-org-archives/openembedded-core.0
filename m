Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455B2C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 16:39:30 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.29413.1745771966239047693
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 09:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout12.t-online.de (Postfix) with SMTP id 467AB2E1
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 18:39:24 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.169.99]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u952G-2bmFwf0; Sun, 27 Apr 2025 18:39:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] qemu.inc: make use of virtual/libsdl2
Date: Sun, 27 Apr 2025 18:39:10 +0200
Message-ID: <20250427163910.3745584-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745771960-E0FF6A30-3AA30897/0/0 CLEAN NORMAL
X-TOI-MSGID: ab8d0b14-534e-4c26-a93a-e0af344e6a49
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 16:39:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215564

Fix to ensure it would work with both libsdl2 and libsdl2-compat

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 048266f5f6..68b1e7067e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -165,7 +165,7 @@ do_install () {
 PACKAGECONFIG:remove:darwin =3D "kvm virglrenderer epoxy gtk+"
 PACKAGECONFIG:remove:mingw32 =3D "kvm virglrenderer epoxy gtk+ pie"
=20
-PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,libsdl2"
+PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,virtual/libsdl2"
 PACKAGECONFIG[sdl-image] =3D "--enable-sdl-image,--disable-sdl-image,lib=
sdl2-image"
 PACKAGECONFIG[png] =3D "--enable-png,--disable-png,libpng"
 PACKAGECONFIG[virtfs] =3D "--enable-virtfs --enable-attr --enable-cap-ng=
,--disable-virtfs,libcap-ng attr,"
--=20
2.49.0


