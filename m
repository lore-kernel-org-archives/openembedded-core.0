Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB22C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:19:24 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.15632.1741187954339534765
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:19:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout11.t-online.de (Postfix) with SMTP id E7DC515DC
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Mar 2025 16:18:26 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.234.117]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tpqVs-0Jb97Z0; Wed, 5 Mar 2025 16:18:24 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] fastfloat: add recipe
Date: Wed,  5 Mar 2025 16:19:06 +0100
Message-ID: <20250305151906.269922-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741187904-8BFFC97D-5D59F93F/10/3626336762 SUSPECT URL
X-TOI-MSGID: eeec0ac1-885e-425c-ad0a-44304b23c46b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212320

A header-only library for fast number parsing
An older version of this recipe is included in meta-oe, since fastfloat
is also used by libplacebo. If the recipe is accepted, I will send a patc=
h for
removal there.

The reason why this is needed in oe-core is the upcoming vte release,
which uses fastfloat but pulls it as a wrap-based subproject by default.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/maintainers.inc          |  1 +
 .../recipes-devtools/fastfloat/fastfloat_8.0.0.bb | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-devtools/fastfloat/fastfloat_8.0.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index a6f413caa9..5515d46ca5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -174,6 +174,7 @@ RECIPE_MAINTAINER:pn-eudev =3D "Anuj Mittal <anuj.mit=
tal@intel.com>"
 RECIPE_MAINTAINER:pn-expat =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-expect =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-ffmpeg =3D "Unassigned <unassigned@yoctoproject.org=
>"
+RECIPE_MAINTAINER:pn-fastfloat =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-file =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-findutils =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-flac =3D "Michael Opdenacker <michael@opdenacker.or=
g>"
diff --git a/meta/recipes-devtools/fastfloat/fastfloat_8.0.0.bb b/meta/re=
cipes-devtools/fastfloat/fastfloat_8.0.0.bb
new file mode 100644
index 0000000000..6426a1d2ec
--- /dev/null
+++ b/meta/recipes-devtools/fastfloat/fastfloat_8.0.0.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "fast_float number parsing library: 4x faster than strtod"
+HOMEPAGE =3D "https://github.com/fastfloat/fast_float"
+LICENSE =3D "Apache-2.0 & BSL-1.0 & MIT"
+LIC_FILES_CHKSUM =3D " \
+	file://LICENSE-MIT;md5=3D32b11d50c7d9788d4270f6a83f3e68eb \
+	file://LICENSE-APACHE;md5=3D81db248e90379bcfc0582b578b009bc3 \
+	file://LICENSE-BOOST;md5=3D2c7a3fa82e66676005cd4ee2608fd7d2 \
+"
+
+SRC_URI =3D "git://github.com/fastfloat/fast_float.git;protocol=3Dhttps;=
branch=3Dmain"
+
+SRCREV =3D "77cc847c842c49e7e3477c1e95da2b6540166d66"
+S =3D "${WORKDIR}/git"
+
+inherit cmake
--=20
2.48.1


