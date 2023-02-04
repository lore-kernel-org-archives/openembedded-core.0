Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBA0C61DA4
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 19:20:52 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.13544.1675538449652488512
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 11:20:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout01.t-online.de (Postfix) with SMTP id D5C49183C1
	for <openembedded-core@lists.openembedded.org>; Sat,  4 Feb 2023 20:20:47 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.165.5]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pOO5f-1fDOAj0; Sat, 4 Feb 2023 20:20:47 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] ell: update 0.55 -> 0.56
Date: Sat,  4 Feb 2023 20:20:34 +0100
Message-Id: <20230204192034.3181189-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675538447-B1029007-4454DCF3/0/0 CLEAN NORMAL
X-TOI-MSGID: e1dda57d-7c47-427a-ab2c-398687130c2d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 19:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176766

Needed by iwd 2.3

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-core/ell/{ell_0.55.bb =3D> ell_0.56.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.55.bb =3D> ell_0.56.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.55.bb b/meta/recipes-core/ell/el=
l_0.56.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.55.bb
rename to meta/recipes-core/ell/ell_0.56.bb
index 7184701e4e..0ace622835 100644
--- a/meta/recipes-core/ell/ell_0.55.bb
+++ b/meta/recipes-core/ell/ell_0.56.bb
@@ -15,7 +15,7 @@ DEPENDS =3D "dbus"
 inherit autotools pkgconfig
=20
 SRC_URI =3D "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN=
}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "a7e1fd3e13d9083f80eb9787546add49fba5c3d9e9f166b0=
6e2ff9fd8030dc6d"
+SRC_URI[sha256sum] =3D "58eb8b2b64087f7479d5db6a830a0656c536d93e5f11d4c9=
a4443ce8760a1b63"
=20
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
--=20
2.34.1


