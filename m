Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F975C43602
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 17:28:39 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50758.1782926909109357307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 10:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=TrB2cPTW;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout09.t-online.de (Postfix) with SMTP id 8EBD0383C2
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 19:28:26 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.163.76]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1weyjY-1ZjVit0; Wed, 1 Jul 2026 19:28:24 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][Patch 3/3] webkitgtk: add PACKAGECONFIG for bubblewrap
Date: Wed,  1 Jul 2026 19:28:14 +0200
Message-ID: <20260701172814.1976769-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701172814.1976769-1-f_l_k@t-online.de>
References: <20260701172814.1976769-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782926904-5F7FDBCC-EF19856F/0/0 CLEAN NORMAL
X-TOI-MSGID: ccb45360-fb84-4e5a-8db2-fb856193a6f8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782926906; i=f_l_k@t-online.de;
	bh=1IBPLzl98OHU2BU5SwrPPZj+ahONyOhSnV9/RWdzB5I=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TrB2cPTWMFNaiIILyeuV3V1XC1i6+Y2IB1pA6lSCwWORax/AtBg4OafOSfNehe9+p
	 9e4rNg1alVkg1X6Z17ZdZ8gkgRxzj2rmGYA/g5dUsdMp8R5HHY3m7l4/bMAHqNBrtJ
	 593qj1TGI+zzFfJ2YWSdIlGhTis6y4tSFhWpqxE6MOCbyWs/X7tAy6Mw1oh4HnmBDR
	 W5IyP9/2gAGv1tYesvHbWBrI/hC3Nq6IURGq8Kd4hpW46R03nwEdbxqVN544OtEX/y
	 LDy7P4oSAfI+aphYTI5kHBwkroBA8HokZGPZuzX6T6p61iPzpefjbVpp3Xa5LWkNZN
	 MwaLdNaHDB09Q==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 17:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240006

disabled by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.52.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.52.4.bb
index 47d97c71fc..d3dfa8d869 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
@@ -83,6 +83,7 @@ PACKAGECONFIG[speech] =3D "-DENABLE_SPEECH_SYNTHESIS=3D=
ON,-DENABLE_SPEECH_SYNTHESIS=3D
 PACKAGECONFIG[librice] =3D "-DUSE_LIBRICE=3DON,-DUSE_LIBRICE=3DOFF,libri=
ce"
 PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms"
 PACKAGECONFIG[webrtc] =3D "-DENABLE_WEB_RTC=3DON,-DENABLE_WEB_RTC=3DOFF"
+PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=3DON -DBWRAP_=
EXECUTABLE=3D${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=3D${bindir}/xdg-dbus=
-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=3DOFF,,bubblewrap xdg-dbus-proxy"
=20
 EXTRA_OECMAKE =3D " \
                  -DPORT=3DGTK \
@@ -90,7 +91,6 @@ EXTRA_OECMAKE =3D " \
                  ${@oe.utils.vartrue('GIDOCGEN_ENABLED', '-DENABLE_DOCUM=
ENTATION=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \
                  ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_=
HINTS=3DON', '-DWEBKIT_NO_INLINE_HINTS=3DOFF', d)} \
                  -DENABLE_MINIBROWSER=3DON \
-                 -DENABLE_BUBBLEWRAP_SANDBOX=3DOFF \
                  -DUSE_GTK4=3DON \
                  -DCMAKE_EXPORT_COMPILE_COMMANDS=3DOFF \
                  -DENABLE_RELEASE_LOG=3DON \
--=20
2.54.0


