Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033A0FA3742
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 13:15:08 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web12.19208.1666617298884760544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 06:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout06.t-online.de (Postfix) with SMTP id B918A9DA2
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 15:14:56 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.44.69]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1omxI8-4DSlBh0; Mon, 24 Oct 2022 15:14:56 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] mesa: update 22.2.0 -> 22.2.2
Date: Mon, 24 Oct 2022 15:14:26 +0200
Message-Id: <20221024131426.368788-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1666617296-E30B0E65-3A2C9F87/0/0 CLEAN NORMAL
X-TOI-MSGID: 254de463-e652-4ed2-a89f-b5faac3c0bbd
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 13:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172086

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mesa/{mesa-gl_22.2.0.bb =3D> mesa-gl_22.2.2.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_22.2.0.bb =3D> mesa_22.2.2.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.2.0.bb =3D> mesa-gl_22.2.2=
.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.2.0.bb =3D> mesa_22.2.2.bb} (=
100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb b/meta/recipes-=
graphics/mesa/mesa-gl_22.2.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.2.0.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.2.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 8a74e0a80a..0eec292e4e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-=
${PV}.tar.xz \
            file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error=
.patch \
            "
=20
-SRC_URI[sha256sum] =3D "b1f9c8fd08f2cae3adf83355bef4d2398e8025f449473328=
80f2d0066bdafa8c"
+SRC_URI[sha256sum] =3D "2de11fb74fc5cc671b818e49fe203cea0cd1d8b69756e97c=
db06a2f4e78948f9"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
=20
diff --git a/meta/recipes-graphics/mesa/mesa_22.2.0.bb b/meta/recipes-gra=
phics/mesa/mesa_22.2.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.2.0.bb
rename to meta/recipes-graphics/mesa/mesa_22.2.2.bb
--=20
2.34.1


