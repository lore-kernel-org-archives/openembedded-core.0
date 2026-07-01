Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274A0C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 16:55:58 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50056.1782924949164094516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 09:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=BUTqKxaa;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd95.aul.t-online.de (fwd95.aul.t-online.de [10.223.144.121])
	by mailout07.t-online.de (Postfix) with SMTP id CEBD9EEA6
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 18:55:46 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.163.76]) by fwd95.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1weyDv-1RwutF0; Wed, 1 Jul 2026 18:55:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][Patch] webkitgtk: add PACKAGECONFIG for librice
Date: Wed,  1 Jul 2026 18:55:35 +0200
Message-ID: <20260701165536.1650194-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782924943-ABFFD407-F161E158/0/0 CLEAN NORMAL
X-TOI-MSGID: 4ed70e68-ba55-4292-9d0e-72e8860540f4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782924946; i=f_l_k@t-online.de;
	bh=DUibxQkW8LApMjkPa8gCqZAiyvf51IxlA9TebEkpAYM=;
	h=From:To:Subject:Date;
	b=BUTqKxaaThnmx6n8qreRUuhiHoQEhAXIi0p2tdGF+A/ZqFJy2AmyQw5596IlZAyKI
	 119NSzkrXYkoci1keHW/7uipHY9U4lV/51dM0H0qYkscFtJXhCQRe3uMd2LIyO3SbJ
	 VTOyelzm0VbiKZ4pOLzuJ2XPDHGGkoSvpQXcyEkfjUDxYcFXigubkZyl/sbFmkRsq1
	 3V4CBFGtnUbC4yp+MjuCpBw0CaU1SA+nhH03O8mFpVIGK2GDm3eRnmMY/1rIQrBznz
	 lTWzJwucK5DUrSgLC6vPcWavTUV5vV6rh3B5oqoxh9F9gp0xjVjfuaEXbucXKO/izL
	 /0+wTn5KZ6cJQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 16:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240002

This avoids:
| -- Checking for module 'rice-proto'
| --   Package 'rice-proto' not found
| -- Checking for module 'rice-io'
| --   Package 'rice-io' not found
| -- Could NOT find Rice (missing: Io Proto) (Required is at least versio=
n "0.1.1")
| CMake Error at Source/cmake/GStreamerChecks.cmake:67 (message):
|   librice-{io,proto} is needed for USE_LIBRICE.

Note: librice is availabe in meta-oe

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.52.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.52.4.bb
index 1c3f2343ba..e81cdfa301 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
@@ -80,6 +80,7 @@ PACKAGECONFIG[backtrace] =3D "-DUSE_LIBBACKTRACE=3DON,-=
DUSE_LIBBACKTRACE=3DOFF,libback
 PACKAGECONFIG[gamepad] =3D "-DENABLE_GAMEPAD=3DON,-DENABLE_GAMEPAD=3DOFF=
,libmanette"
 PACKAGECONFIG[sysprof-capture] =3D "-DUSE_SYSTEM_SYSPROF_CAPTURE=3DYES,-=
DUSE_SYSTEM_SYSPROF_CAPTURE=3DNO,sysprof"
 PACKAGECONFIG[speech] =3D "-DENABLE_SPEECH_SYNTHESIS=3DON,-DENABLE_SPEEC=
H_SYNTHESIS=3DOFF,flite"
+PACKAGECONFIG[librice] =3D "-DUSE_LIBRICE=3DON,-DUSE_LIBRICE=3DOFF,libri=
ce"
=20
 EXTRA_OECMAKE =3D " \
                  -DPORT=3DGTK \
--=20
2.54.0


