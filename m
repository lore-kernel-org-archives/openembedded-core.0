Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0261C77B62
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 10:32:45 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.62744.1679999555215460391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 03:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout01.t-online.de (Postfix) with SMTP id DCCAA1A11A
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 12:32:32 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.35.166]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ph6cx-17U9ER0; Tue, 28 Mar 2023 12:32:31 +0200
From: Markus Volk <f_L_K@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv5 3/8] glib-networking: update 2.74.0 -> 2.76.0
Date: Tue, 28 Mar 2023 12:31:39 +0200
Message-Id: <20230328103144.5757-3-f_L_K@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328103144.5757-1-f_L_K@t-online.de>
References: <20230328103144.5757-1-f_L_K@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679999551-8556AC08-CBB03DB4/0/0 CLEAN NORMAL
X-TOI-MSGID: c1bf589c-dcbf-4fed-bcba-f1e135b84de3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 10:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179223

From: Markus Volk <f_l_k@t-online.de>

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


