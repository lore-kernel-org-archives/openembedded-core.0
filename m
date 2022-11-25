Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18DDC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 14:58:28 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.48905.1669388306569614384
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 06:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout03.t-online.de (Postfix) with SMTP id 6EE3260F1
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 15:58:24 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.139]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oya9o-26g50T0; Fri, 25 Nov 2022 15:58:24 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] ell: upgrade 0.53 -> 0.54
Date: Fri, 25 Nov 2022 15:58:15 +0100
Message-Id: <20221125145815.119530-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669388304-B2FEDB6F-889FE919/0/0 CLEAN NORMAL
X-TOI-MSGID: 0bc21b7e-64be-4859-b507-e147198bb16e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 14:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173769

iwd-2.0 will require ell 0.54

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/ell/{ell_0.53.bb =3D> ell_0.54.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.53.bb =3D> ell_0.54.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.53.bb b/meta/recipes-core/ell/el=
l_0.54.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.53.bb
rename to meta/recipes-core/ell/ell_0.54.bb
index 7817476030..5594e0ba54 100644
--- a/meta/recipes-core/ell/ell_0.53.bb
+++ b/meta/recipes-core/ell/ell_0.54.bb
@@ -15,7 +15,7 @@ DEPENDS =3D "dbus"
 inherit autotools pkgconfig
=20
 SRC_URI =3D "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN=
}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "a7d0df846af839bbea1b80f292166371070328854b3fa785=
b5c607fe600552ad"
+SRC_URI[sha256sum] =3D "43be093b25359acd84dd2b07b45a1eacc3a4089bb01342eb=
3fc99ec9d94a25d9"
=20
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
--=20
2.34.1


