Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88663FA3740
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:06:38 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web12.20500.1666623981706001760
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 08:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout05.t-online.de (Postfix) with SMTP id 67DBC182E
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 17:06:19 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.44.69]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1omz1t-2IyKZt0; Mon, 24 Oct 2022 17:06:17 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCHv2] mesa: update 22.2.0 -> 22.2.2
Date: Mon, 24 Oct 2022 17:06:08 +0200
Message-Id: <20221024150608.455173-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1666623977-3EFE8B8C-9F224798/0/0 CLEAN NORMAL
X-TOI-MSGID: 14d73928-0a6b-47fe-8463-8efd0ea4fb99
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 15:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172101

- add a PACKAGECONFIG for perfetto support

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mesa/{mesa-gl_22.2.0.bb =3D> mesa-gl_22.2.2.bb}             | 0
 meta/recipes-graphics/mesa/mesa.inc                           | 4 +++-
 meta/recipes-graphics/mesa/{mesa_22.2.0.bb =3D> mesa_22.2.2.bb} | 0
 3 files changed, 3 insertions(+), 1 deletion(-)
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
index 8a74e0a80a..bad8461fef 100644
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
@@ -179,6 +179,8 @@ PACKAGECONFIG[vulkan-beta] =3D "-Dvulkan-beta=3Dtrue,=
-Dvulkan-beta=3Dfalse"
=20
 PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Dtrue,-Dosmesa=3Dfalse"
=20
+PACKAGECONFIG[perfetto] =3D "-Dperfetto=3Dtrue,-Dperfetto=3Dfalse,libper=
fetto"
+
 PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,=
libunwind"
=20
 PACKAGECONFIG[lmsensors] =3D "-Dlmsensors=3Denabled,-Dlmsensors=3Ddisabl=
ed,lmsensors"
diff --git a/meta/recipes-graphics/mesa/mesa_22.2.0.bb b/meta/recipes-gra=
phics/mesa/mesa_22.2.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.2.0.bb
rename to meta/recipes-graphics/mesa/mesa_22.2.2.bb
--=20
2.34.1


