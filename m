Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CC2C001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 15:08:39 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.17876.1690988910580300668
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 08:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id 3205019AAF
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Aug 2023 17:08:28 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.160.142]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qRDSc-2ddkUE0; Wed, 2 Aug 2023 17:08:26 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 2/2] epiphany: upgrade 44.5 -> 44.6
Date: Wed,  2 Aug 2023 17:08:01 +0200
Message-ID: <20230802150801.2607-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802150801.2607-1-f_l_k@t-online.de>
References: <20230802150801.2607-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1690988906-1381E931-BAD3F3A4/0/0 CLEAN NORMAL
X-TOI-MSGID: f645103e-45c7-412f-97ee-3ea6460146d0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 15:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185412

44.6 - July 28, 2023
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * Hide "Search the Web for" context menu item in web app mode (#2097, Cl=
eo Menezes Jr.)
 * Fix Save Password? permission requests, broken since 44.4 (#2113)
 * Fix unencoded % characters in URLs causing session to fail to save (#2=
128, Vanadiae)
 * Fix web views not being destroyed when window is closed (#2130)
 * Hopefully fix crash in ephy_sqlite_connection_create_statement (#2132)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../epiphany/{epiphany_44.5.bb =3D> epiphany_44.6.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_44.5.bb =3D> epiphany_44.6.=
bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_44.5.bb b/meta/recipes-=
gnome/epiphany/epiphany_44.6.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_44.5.bb
rename to meta/recipes-gnome/epiphany/epiphany_44.6.bb
index f92d149c88..d8dd3d6dae 100644
--- a/meta/recipes-gnome/epiphany/epiphany_44.5.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_44.6.bb
@@ -32,7 +32,7 @@ SRC_URI =3D "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.tri=
m_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] =3D "3c475e04ed2a0f410cb44b96937563697079193a=
c9b7a50c91485fb9b08315ab"
+SRC_URI[archive.sha256sum] =3D "5335dd573581db61e126d854dc16ae519657a5b8=
790789a47d25e43e17cd3a43"
=20
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] =3D "-Ddeveloper_mode=3Dtrue,-Ddeveloper_m=
ode=3Dfalse"
--=20
2.41.0


