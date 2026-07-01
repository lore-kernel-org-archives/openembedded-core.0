Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67796C43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 17:49:09 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51284.1782928143191967075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 10:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=RwNcONRZ;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout06.t-online.de (Postfix) with SMTP id D2E7D9BF
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 19:49:00 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.163.76]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wez3U-1d72zS0; Wed, 1 Jul 2026 19:49:00 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][Patchv2 2/2] webkitgtk: add PACKAGECONFIG for bubblewrap
Date: Wed,  1 Jul 2026 19:48:52 +0200
Message-ID: <20260701174852.2137771-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701174852.2137771-1-f_l_k@t-online.de>
References: <20260701174852.2137771-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1782928140-74FF6FDE-55DA340D/0/0 CLEAN NORMAL
X-TOI-MSGID: 47abbd31-d448-4b71-89ef-8d1cb6c0ea09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782928140; i=f_l_k@t-online.de;
	bh=33be9faZFPZgo5uSlb3M51S6xpGHFHtsNlg3Ld9Kfi8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=RwNcONRZUclTjwRcJCQT35E+EzFfzsJYHkYRdRl2YpN4ykkmeQ+ClGCz1kk1ou4PW
	 T86i7uF+ml45419HFrQepJiIgv8WgQKZeQXBV4D0XZXgTV74mUvDjmrmWTYpHNnk4L
	 +VPHwIIaYaun3kLqS2kAyD/wMfoOHIpgyXiIegNQWzbeU+Q2+NysYnlH744Yr8qEkb
	 MjvyaO/fY64AZKL6et3JqWkMKhhb6qy14t/TIFqAhKenu2SR4X5Ea8okAHyTNDSN/+
	 tWliMzqve4m6F2siD9LfKJQKfF9LpiF0/4BTL08vC7LWUXGC94aRq/wqtS70oP50Lh
	 tBF5asjlms6gg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 17:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240009

disabled by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-sato/webkit/webkitgtk_2.52.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.52.4.bb
index 7e3411f65a..7602b42d2c 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.52.4.bb
@@ -82,6 +82,7 @@ PACKAGECONFIG[sysprof-capture] =3D "-DUSE_SYSTEM_SYSPRO=
F_CAPTURE=3DYES,-DUSE_SYSTEM_
 PACKAGECONFIG[speech] =3D "-DENABLE_SPEECH_SYNTHESIS=3DON,-DENABLE_SPEEC=
H_SYNTHESIS=3DOFF,flite"
 PACKAGECONFIG[librice] =3D "-DUSE_LIBRICE=3DON,-DUSE_LIBRICE=3DOFF,libri=
ce"
 PACKAGECONFIG[webrtc] =3D "-DENABLE_WEB_RTC=3DON,-DENABLE_WEB_RTC=3DOFF"
+PACKAGECONFIG[bubblewrap] =3D "-DENABLE_BUBBLEWRAP_SANDBOX=3DON -DBWRAP_=
EXECUTABLE=3D${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=3D${bindir}/xdg-dbus=
-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=3DOFF,,bubblewrap xdg-dbus-proxy"
=20
 EXTRA_OECMAKE =3D " \
                  -DPORT=3DGTK \
@@ -89,7 +90,6 @@ EXTRA_OECMAKE =3D " \
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


