Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F85C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 06:27:30 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.70139.1747117645922867022
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 23:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout11.t-online.de (Postfix) with SMTP id E22D88B6
	for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 08:27:23 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.170.233]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uEj6p-4bSxsH0; Tue, 13 May 2025 08:27:23 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] libxcvt: allow native build
Date: Tue, 13 May 2025 08:27:17 +0200
Message-ID: <20250513062717.289665-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1747117643-CD7F85E7-AF6BA4FC/0/0 CLEAN NORMAL
X-TOI-MSGID: f79da307-1ff5-4777-9529-b20a81e58210
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 06:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216396

'mutter' requires the 'cvt' binary at compile time to build the native ba=
ckend
For this it depends on xserver-xorg-cvt-native, which is currently broken=
 and
also deprecated.
[https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/637]

This commit would allow to use libxcvt-native to provide the needed binar=
y
instead.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb b/meta/recip=
es-graphics/xorg-lib/libxcvt_0.1.3.bb
index 91537b0f4b..08194e4815 100644
--- a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.3.bb
@@ -17,3 +17,5 @@ FILES:${PN} =3D " \
     ${libdir}/libxcvt.so.0* \
     ${bindir}/cvt \
 "
+
+BBCLASSEXTEND =3D "native"
--=20
2.49.0


