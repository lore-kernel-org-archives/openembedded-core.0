Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6692FC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 17:49:09 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51173.1782928143084175987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 10:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=ibyDIslm;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id D21951C81B
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 19:49:00 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.163.76]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wez3U-1d72zR0; Wed, 1 Jul 2026 19:49:00 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][Patchv2 1/2] webkitgtk: add PACKAGECONFIG for webrtc
Date: Wed,  1 Jul 2026 19:48:51 +0200
Message-ID: <20260701174852.2137771-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782928140-15FF8FDE-A1023A24/0/0 CLEAN NORMAL
X-TOI-MSGID: f437dea0-7639-4c28-901f-5350bcabb268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782928140; i=f_l_k@t-online.de;
	bh=8kO5tZRyYcjcmEEGjPwUOA1Apt3nFzQx4UaT+6OeHKg=;
	h=From:To:Subject:Date;
	b=ibyDIslm4vy/CJqxW298Jj+Ox3dmi8ntoQcBCzG+NS9Q7K0xQKsyscvDR0Q4WVuGv
	 lFAgNS0EBTniTeWJAPGGB8kPck3kNOkljLtyr07dcj11rvV7MgUkT5G7FO2wqEcFkU
	 H8PeK/ME5TFXLpS0aDrZUYtEDPmQtE0HRLHcqNgyX4gbCd95WF9oe7bfAeJowHrp0j
	 YHNn12XrhJnFiuULkaHpJhmxEgIrR46twhRMdc5XjaZ7LNVEMxQa6U9zOwMYcopAuE
	 PYGUul40hVKgpZ5YbqY1WudpTpsLPNxYUJFibGO4qDlIGXfabaBdwB38P+hRdF2Ort
	 Kxva6csdNdWCg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 17:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240008

disabled by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.52.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.52.4.bb
index e81cdfa301..7e3411f65a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
@@ -81,6 +81,7 @@ PACKAGECONFIG[gamepad] =3D "-DENABLE_GAMEPAD=3DON,-DENA=
BLE_GAMEPAD=3DOFF,libmanette"
 PACKAGECONFIG[sysprof-capture] =3D "-DUSE_SYSTEM_SYSPROF_CAPTURE=3DYES,-=
DUSE_SYSTEM_SYSPROF_CAPTURE=3DNO,sysprof"
 PACKAGECONFIG[speech] =3D "-DENABLE_SPEECH_SYNTHESIS=3DON,-DENABLE_SPEEC=
H_SYNTHESIS=3DOFF,flite"
 PACKAGECONFIG[librice] =3D "-DUSE_LIBRICE=3DON,-DUSE_LIBRICE=3DOFF,libri=
ce"
+PACKAGECONFIG[webrtc] =3D "-DENABLE_WEB_RTC=3DON,-DENABLE_WEB_RTC=3DOFF"
=20
 EXTRA_OECMAKE =3D " \
                  -DPORT=3DGTK \
--=20
2.54.0


