Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB79C77B60
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 00:50:08 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.13190.1679705401501255477
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 17:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout11.t-online.de (Postfix) with SMTP id 5807C19E8F
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 01:48:55 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfs5M-20zHG70; Sat, 25 Mar 2023 01:48:44 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 3/7] glib-networking: update 2.74.0 -> 2.76.0
Date: Sat, 25 Mar 2023 01:48:14 +0100
Message-Id: <20230325004818.2784943-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325004818.2784943-1-f_l_k@t-online.de>
References: <20230325004818.2784943-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679705325-E67FBC37-771DB1EB/0/0 CLEAN NORMAL
X-TOI-MSGID: 9d1915a0-1ce3-4d46-b923-72aa382b1834
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 00:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179083

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{glib-networking_2.74.0.bb =3D> glib-networking_2.76.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.74.0.bb =3D>=
 glib-networking_2.76.0.bb} (93%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb
similarity index 93%
rename from meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.76.0.bb
index dc0be23357..c1dc0bcbde 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.74.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.76.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
 SECTION =3D "libs"
 DEPENDS =3D "glib-2.0-native glib-2.0"
=20
-SRC_URI[archive.sha256sum] =3D "1f185aaef094123f8e25d8fa55661b3fd7102016=
3a0174adb35a37685cda613b"
+SRC_URI[archive.sha256sum] =3D "149a05a179e629a538be25662aa324b499d7c454=
9c5151db5373e780a1bf1b9a"
=20
 PACKAGECONFIG ??=3D "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', =
'tests', '', d)}"
=20
--=20
2.34.1


