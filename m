Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094DAC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 20:40:05 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.2371.1678394401999358929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 12:40:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout09.t-online.de (Postfix) with SMTP id BA40395F5
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Mar 2023 21:39:59 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.229.247]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1paN3M-0VX7jO0; Thu, 9 Mar 2023 21:39:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][RFC][PATCH 2/6] glib-networking: update 2.74.0 -> 2.76.beta
Date: Thu,  9 Mar 2023 21:39:29 +0100
Message-Id: <20230309203933.834098-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309203933.834098-1-f_l_k@t-online.de>
References: <20230309203933.834098-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678394396-B9016A74-2A29EC14/0/0 CLEAN NORMAL
X-TOI-MSGID: 42696399-ce1b-4121-aca3-a9fcdfe53798
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 20:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178264

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{glib-networking_2.74.0.bb =3D> glib-networking_2.76.beta.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.74.0.bb =3D>=
 glib-networking_2.76.beta.bb} (93%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.76.beta.bb
similarity index 93%
rename from meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.76.beta.bb
index dc0be23357..a49ab51425 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.76.beta.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
 SECTION =3D "libs"
 DEPENDS =3D "glib-2.0-native glib-2.0"
=20
-SRC_URI[archive.sha256sum] =3D "1f185aaef094123f8e25d8fa55661b3fd7102016=
3a0174adb35a37685cda613b"
+SRC_URI[archive.sha256sum] =3D "c0ab5b0f358332521058eb07f3c9a3fdac0e7a52=
01c4130a567bd9d6cd3f1da1"
=20
 PACKAGECONFIG ??=3D "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', =
'tests', '', d)}"
=20
--=20
2.34.1


