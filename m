Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417CCC43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 17:28:39 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50755.1782926908779465737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 10:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=HQic9p6K;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout08.t-online.de (Postfix) with SMTP id 57355ECA8
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 19:28:26 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.163.76]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1weyjX-1ZjVir0; Wed, 1 Jul 2026 19:28:23 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][Patch 1/3] webkitgtk: add PACKAGECONFIG for lcms
Date: Wed,  1 Jul 2026 19:28:12 +0200
Message-ID: <20260701172814.1976769-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782926904-E37FDBCC-066BFB6A/0/0 CLEAN NORMAL
X-TOI-MSGID: 262c7b63-6827-442f-91f9-e62bc94fad6f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782926906; i=f_l_k@t-online.de;
	bh=2icAql0AwNc3+ylRQqnTNOjFBxzj3cbwmMsU+k42Qp0=;
	h=From:To:Subject:Date;
	b=HQic9p6KqDe0TsUl6dK4nm5n8sg/bhfj99ZSM/iT9cQaRmyOj/DokoQPH9sKGoegd
	 IZ8/efhRPQFLAQ4h82BbNqSwQ3pFiErhDbax9QhNfz5CHNLYNHIF39Z4eNpW5Drrf3
	 PpkLXeAd+3rBc7bdtSugFiPB4N/lHCHD1B/RfyM1aJlOVZEwq8YfZPSXXAae4hw00c
	 IQpcu3TZUPl6ZG0jEShyUpYJhwXjEIPtDSMaLtth9muga+m9ws/kMmn+eGd9fJoqr/
	 3ttHm9UQzG7GdIZhu57wZSmq6xN8ixRTlW/SOSTHqorK6Xisl+eROfFuKs40Kp/rgd
	 JMCySfDpQ+qGA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 17:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240004

disabled by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.52.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.52.4.bb
index e81cdfa301..a2683638dd 100644
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
+PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms"
=20
 EXTRA_OECMAKE =3D " \
                  -DPORT=3DGTK \
--=20
2.54.0


