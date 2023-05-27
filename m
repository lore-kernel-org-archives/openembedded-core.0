Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD80C77B7C
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 13:33:11 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.10272.1685194384108449367
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 May 2023 06:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout07.t-online.de (Postfix) with SMTP id 0B3341BF16
	for <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 15:33:02 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.35.82]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q2u2W-2qD35d0; Sat, 27 May 2023 15:33:00 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH 1/4] ell: upgrade 0.56 -> 0.57
Date: Sat, 27 May 2023 15:32:49 +0200
Message-Id: <20230527133252.284132-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1685194380-337FDCD8-E7FA7AF0/0/0 CLEAN NORMAL
X-TOI-MSGID: d13cad8b-c23d-4bfb-b950-db533fa73a29
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 13:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181803

ver 0.57:
	Fix issue with handling Generic Netlink cancel requests.

ell 0.57 is required for iwd 2.5

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/ell/{ell_0.56.bb =3D> ell_0.57.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.56.bb =3D> ell_0.57.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.56.bb b/meta/recipes-core/ell/el=
l_0.57.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.56.bb
rename to meta/recipes-core/ell/ell_0.57.bb
index 0ace622835..09a0831fbe 100644
--- a/meta/recipes-core/ell/ell_0.56.bb
+++ b/meta/recipes-core/ell/ell_0.57.bb
@@ -15,7 +15,7 @@ DEPENDS =3D "dbus"
 inherit autotools pkgconfig
=20
 SRC_URI =3D "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN=
}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "58eb8b2b64087f7479d5db6a830a0656c536d93e5f11d4c9=
a4443ce8760a1b63"
+SRC_URI[sha256sum] =3D "7603928ee584b758ca27c67e4dc513049a09b038d7d28459=
a9440f8443c91018"
=20
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
--=20
2.34.1


